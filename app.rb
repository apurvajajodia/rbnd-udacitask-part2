require 'bundler/setup'
require 'chronic'
require 'colorize'
# Find a third gem of your choice and add it to your project
require "artii"
require 'date'
require_relative "lib/listable"
require_relative "lib/errors"
require_relative "lib/udacilist"
require_relative "lib/todo"
require_relative "lib/event"
require_relative "lib/link"

list = UdaciList.new(title: "Julia's Stuff")
list.add("todo", "Buy more cat food", due: "2016-02-03", priority: "low")
list.add("todo", "Sweep floors", due: "2016-01-30")
list.add("todo", "Buy groceries", priority: "high")
list.add("event", "Birthday Party", start_date: "2016-05-08")
list.add("event", "Vacation", start_date: "2016-05-28", end_date: "2016-05-31")
list.add("link", "https://github.com", site_name: "GitHub Homepage")
list.all
list.delete(3)
list.all

# SHOULD CREATE AN UNTITLED LIST AND ADD ITEMS TO IT
# --------------------------------------------------
new_list = UdaciList.new # Should create a list called "Untitled List"
#puts Chronic.parse('in 5 weeks').strftime("%y/%m/%d")
#new_list.add("todo", "Buy more dog food", due: Chronic.parse('in 5 weeks').to_s, priority: "medium")
new_list.add("todo", "Buy more dog food", due: 'in 5 weeks', priority: "medium")
#puts Chronic.parse('in 2 hours').strftime("%y/%m/%d")
new_list.add("todo", "Go dancing", due: 'in 2 hours')
new_list.add("todo", "Buy groceries", priority: "high")
new_list.add("event", "Birthday Party", start_date: "May 31")
new_list.add("event", "Vacation", start_date: "Dec 20", end_date: "Dec 30")
new_list.add("event", "Life happens")
new_list.add("link", "https://www.udacity.com/", site_name: "Udacity Homepage")
new_list.add("link", "http://ruby-doc.org")

# SHOULD RETURN ERROR MESSAGES
# ----------------------------
#new_list.add("image", "http://ruby-doc.org") # Throws InvalidItemType error
#new_list.delete(9) # Throws an IndexExceedsListSize error
#new_list.add("todo", "Hack some portals", priority: "super high") # throws an InvalidPriorityValue error

# DISPLAY UNTITLED LIST
# ---------------------
new_list.all

# DEMO FILTER BY ITEM TYPE
# ------------------------
puts "\n"
 new_list.filter("event")

 #new features
 #-------------------
 #feature #1 change the priority of an item of new list
 puts "\n lets change the priority of an item, select a to do item"
 new_list.filter("todo")
 puts "Enter the description exactly as above"
 desc = gets.chomp
 puts "Enter the new priority for this item"
 prty = gets.chomp
 new_list.change_priority(desc, prty)
 

 #checking entire list
 #new_list.filter("todo")
 #------------------
 #feature 2 delete multiple items
 puts "Lets delete multiple items, select the numbers seperated by space. eg. 1 2 3"
 new_list.all
 
 num = gets
 
 num = num.split(" ").map(&:to_i)
 
 max = num.max
 new_list.delete(num, maximum: "#{max}")

 puts "Updated list:"
 new_list.all

