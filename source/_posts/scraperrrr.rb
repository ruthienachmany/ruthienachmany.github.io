require 'nokogiri'
require 'sqlite3'
require 'open-uri'


# def comb_page
# page = Nokogiri::HTML(open("http://students.flatironschool.com/students/chrisgonzales.html"))
# student_name = page.search("h4").first.text
# quote = page.search("h3").first.text
# scraped_database = SQLite3::Database.new ":scraped_data:"
# scraped_database.execute "CREATE TABLE IF NOT EXISTS students(Id INTEGER PRIMARY KEY, name TEXT)"
# scraped_database.execute "INSERT INTO students (name) VALUES ('#{student_name}')"

# #--------------------------------------------
scraped_database = SQLite3::Database.new "students.db"
scraped_database.execute "CREATE TABLE IF NOT EXISTS students(Id INTEGER PRIMARY KEY, name TEXT, quote TEXT, bio TEXT, work TEXT, github TEXT, treehouse TEXT, codeschool TEXT, coderwall TEXT, twitter TEXT, linkedin TEXT)"



index = Nokogiri::HTML(open("http://students.flatironschool.com/index.html"))
hrefs = index.css("div.home-blog a")
href = hrefs.map{ |link|   link['href'] }

student_hrefs = href.select{|href|
href.match(/s|S/)!=nil # avi black magic code regular expressions searching for upper and lower case s
}
#student_href = student_href.reverse


student_hrefs.each do |x|
  begin
   # crap = {}
   page = Nokogiri::HTML(open("http://students.flatironschool.com/#{x}"))
     student_name = page.search("h4").first.text
     quote = page.search("h3").first.text.strip
     bio = page.search("p").first.text.strip
     work = page.css(".services")[2].text.split.join(",").gsub(","," ").gsub("Work ", "")
     github = page.css(".section-services a[href*='github']").attribute("href").value
     treehouse = page.css(".section-services a[href*='treehouse']").attribute("href").value
     codeschool = page.css(".section-services a[href*='codeschool']").attribute("href").value
     coderwall = page.css(".section-services a[href*='coderwall']").attribute("href").value
     twitter = page.css(".social-icons a[href*='twitter']").attribute("href").value
     linkedin = page.css(".social-icons a[href*='linkedin']").attribute("href").value
     #scraped_database = SQLite3::Database.new ":scraped_data:"
     #scraped_database.execute "CREATE TABLE IF NOT EXISTS students(Id INTEGER PRIMARY KEY, name TEXT)"
     scraped_database.execute("INSERT INTO students (name, quote, bio, work, github, treehouse, codeschool, coderwall, twitter, linkedin) VALUES (:student_name, :quote, :bio, :work, :github, :treehouse, :codeschool, :coderwall, :twitter, :linkedin)", {:student_name => student_name, :quote => quote, :bio => bio, :work => work, :github => github, :treehouse => treehouse, :codeschool => codeschool, :coderwall => coderwall, :twitter => twitter, :linkedin => linkedin})
     #scraped_database.execute "SELECT * FROM students"

  rescue OpenURI::HTTPError => ex
  end
end
end

scraped_database.execute "SELECT * FROM students"
