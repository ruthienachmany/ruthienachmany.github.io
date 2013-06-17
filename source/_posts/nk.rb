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
scraped_database = SQLite3::Database.new ":scraped_data:"

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
    # quote = page.search("h3").first.text
     #scraped_database = SQLite3::Database.new ":scraped_data:"
     scraped_database.execute "CREATE TABLE IF NOT EXISTS students(Id INTEGER PRIMARY KEY, name TEXT)"
     scraped_database.execute "INSERT INTO students (name) VALUES ('#{student_name}')"
     #scraped_database.execute "SELECT * FROM students"

  rescue OpenURI::HTTPError => ex
  end
end
  
scraped_database.execute "SELECT * FROM students"



