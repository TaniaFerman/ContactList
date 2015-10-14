require_relative 'contact'
require_relative 'contact_database'
require 'pry'

# TODO: Implement command line interaction
# This should be the only file where you use puts and gets

if ARGV[0] 
  command = ARGV[0]
  puts command
else
  print "type help to get the menu: "
  command = gets.chomp   
  if command == "help"
    puts 'new  - Create a new contact'
    puts 'list - List all contacts'
    puts 'show - Show a contact'
    puts 'find - Find a contact'
    print 'type the command that you want: '
    command = gets.chomp
    end
end
case command
when 'new' then 
  # print 'Please type your name: '
  # name = gets.chomp
  # print 'Please type your email: '
  # email = gets.chomp
  #create a hash 
  name = ARGV[1]
  email = ARGV[2]
  phone = []
  

  if Contact.find(email)
    puts "the name and email already exist"
  else
  Contact.create(name, email, phone)
end
#Contact.create(name, email)
when 'list' then 
  # print 'Please type the id: '
  # id = gets.chomp
  Contact.all
when 'show' then 
  print 'Please type the id: '
  #id = gets.chomp
  Contact.show(ARGV[1])
when 'find' then 
  Contact.find(ARGV[1])
else 
  puts 'Command not recognized'
end #/case
