require 'pry'
class Contact
 
  attr_accessor :name, :email

  def initialize(name, email)
    # TODO: assign local variables to instance variables
  end
 
  def to_s
    # TODO: return string representation of Contact
  end

  def phone_number(*phone)
  @contacts.concat(phone)
end

  ## Class Methods
  class << self
    #@id = 1
    def create(name, email) #, *phone)
      # TODO: Will initialize a contact as well as add it to the list of contacts
      #array of contacts
      #puts "in the create method"
      @contacts = []
      @contacts[0]= @contacts.object_id
      @contacts[1]= name
      @contacts[2]= email

      #phone_number(*phone)
      #put the array into the csv file
  CSV.open("contacts.csv", "a") do |csv|
    csv << @contacts
    end
    #@id += 1
  end  
 
    def find(term)
      # TODO: Will find and return contacts that contain the term in the first name, last name or email
     index = false
      File.open("contacts.csv", "r") do |file|
        file.readlines.each do |line|
          # binding.pry
          return line if line.match(term.to_s)
          # puts "line: #{line}"
          # puts "index: #{index}"
          # puts "match? #{!!line.match(term.to_s)}"
          # puts line if index == true
          #comment
         #index = false
        end   
      end
      index
      #index
      #p "in find"
    end   
 
    def all
      # TODO: Return the list of contacts, as is
      CSV.foreach('contacts.csv') do |row|
     puts row.inspect
    end
  end
    
    def show(id)
      # TODO: Show a contact, based on ID
      index = false
      File.open("contacts.csv", "r") do |file|
        file.readlines.each do |line|

        index = true if line.match(id.to_s)
        # if line.match(id.to_s)
        #     index = true 
        #     puts line if index == true
        #     index = false
        #   else
        #     puts "id not found"
        # end    
        puts line if index == true
         index = false
        end   
        #puts "id not found"
      end
    end
  end
end