---
layout: post
title: "Side Project 1: Citibike"
date: 2013-06-17 21:17
comments: true
categories: 
---
Side project number one is Citibike.

There are about 20 repos on Github that have to do with Citibike in some way (that I could find at least). Many of them use JSON and/or Python. Since I'm still just starting to grasp Ruby, I decided to focus on mainly using the repos that use Ruby. I think the others can provide useful datasets and interesting outcomes I can learn from, but I don't think it would make sense to try to understand Python (apart from my new habit of tech talks with my 17 year old brother, who taught himself Python last summer and learned Java this year in school - and come to think of it, my new party conversation topics, which based on this weekend, focus on asking my programmer friends and what languages they use). 

To use the Ruby repos I have to learn several other things. One repo I found is "https://github.com/strcrzy/citibike.git", which is "a collection of ruby scripts that help scrape, slice, and dice the data available from the CitiBike API." To use it I need to use Mongoid, the Ruby ODM framework for MongoDB. It might not be the best strategy to use a repo that requires me to learn Mongo to understand what's going on on the inside, but we have Emily Stoflo, a Columbia professor and software engineer at 10gen, coming in to speak to us today in class, so it won't be a total waste of time.

This all reminds me of some cool things that have been happening as I learn to program. I keep remembering all these other things that I've heard of in the past that now I start to wonder what they really mean, and start to be able to contextualize that in a larger picture. I think that's part of the reason why I've been so excited to talk about coding at parties (i.e. invite me to your parties). Everything starts to have new meaning and context.I'm going to start tracking the new things that I learn, and the paths they lead down. Starting with some definitions of things I come across:

1. What is MongoDB?
MongoDB is an open source document-oriented system developed and supported by 10gen. It's part of the NoSQL movement. As opposed to SQL, a relational databses, it structures data in JSON-like documents with dynamic schemas called BSONs. This can make MongoDB faster than SQL. At the same time, most people who use MongoDB used SQL for many years first, which I think is important to note. MTV, Craigslist, and Foursquare use MongoDB. 

2. What is Mongoid?
Mongoid is an Object-Document-Mapper (ODM) for MongoDB, written in Ruby. It provides a familiar API to Ruby developers who have been using Active Record or Data Mapper, while leveraging MongoDB's schemaless document-based design, dynamic queries, and atomic modifier operations. (NOTE TO SELF: figure out what are atomic modifier operations)

What is JSON?
JSON is JavaScript Object Notation. It's a text-based open standard for human-readable data interchange, built on a collection of key-value pairs and arrays.  It comes from JavaScript objects, which represent simple data structures and associative arrays. Interestingly, though it references JavaScript, it is language-independent. 

3. What is Active Record?
Active Record is a way to query databases in a SQL-like way in Rails without actually having to write SQL. It's compatible with MySWL, PostgreSQL, SQLite, and others. 

4. DataMapper:
DataMapper is an Object-Relational-Mapper (ORM) for Ruby. It's  fast, thread-safe and feature rich. It differentiates itself by having one API for a variety of datastores, the ability to develop a data-store independently of models using Migrations (NOTE: figure out what this means), and helpful when querying or supporting data-stores you don't manage yourself, such as legacy databases.
