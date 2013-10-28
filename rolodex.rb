class Rolodex
  attr_accessor :iddd
  @contacts = []
  @iddd = 1002


  def self.add_contact
  puts "Enter first name:"
    first_name = gets.chomp
    first_name.capitalize!
    puts "Enter last name:"
    last_name = gets.chomp
    last_name.capitalize!
    puts "Enter email address:"
    email = gets.chomp
    puts "Enter note:"
    note = gets.chomp
    contact = Contact.new(first_name, last_name, email, note, @iddd)
    @contacts << contact
    @iddd += 1
    puts "New contact added"
  end

  def self.delete_contact
    puts "Select a contact to delete:"
    contact_options
    to_delete = gets.chomp
    puts "Are you sure you wish to delete this contact? [Y / N]"
    answer = gets.chomp.upcase
    if answer == 'Y'
      @contacts.delete_at(to_delete.to_i - 1)
    puts ""
    puts "Contact deleted"
    else answer == 'N'
    end
  end

def self.display_attributes
    puts "Select an attribute:"
    puts "[1] First name"
    puts "[2] Last name"
    puts "[3] Email address"
    puts "[4] Note"
    puts "[5] Id"
    att_select = gets.chomp
    puts "\e[H\e[2J"
    puts "Here is the attribute you have selected:"
    puts ""
    @contacts.each do |x|
      case att_select
      when "1"
        puts x.first_name
        puts ""
      when "2"
        puts x.last_name
        puts ""
      when "3"
        puts x.email
        puts ""
      when "4"
        puts x.note
        puts ""
      when "5"
        puts x.idd
        puts ""
      end
    end  
  end

  def self.add_initial_contacts
    @contacts << contact1 = Contact.new("Gene", "Mills", "genemills@gmail.com", "Web developer", 1000)
    @contacts << contact2 = Contact.new("Bill", "Smith", "billsmith@mail.com", "Tech Writer", 1001)
    @contacts << contact3 = Contact.new("John", "Doe", "johndoe@me.com", "unemployed", 1002)
  end
  def self.contact_options
    y = 1
    Rolodex.contacts.each do |x|
      puts "[#{y}] #{x.first_name} #{x.last_name}"
      y += 1
    end
  end

  def self.modify_existing_contact
    puts "Select the contact to modify:"
    contact_options
    contact_select = gets.chomp
    puts "Select the attribute to modify: [1] first name, [2] last name, [3] email address, [4] note, [5] id"
    attr_select = gets.chomp
    case attr_select
    when "1"
      puts "Enter new first name"
      new_first = gets.chomp
      new_first.capitalize!
      @contacts[contact_select.to_i - 1].first_name = new_first
    when "2"
      puts "Enter new last name"
      new_last = gets.chomp
      new_last.capitalize!
      @contacts[contact_select.to_i - 1].last_name = new_last
    when "3"
      puts "Enter new email address"
      new_email = gets.chomp
      @contacts[contact_select.to_i - 1].email = new_email
    when "4"
      puts "Enter new note"
      new_note = gets.chomp
      @contacts[contact_select.to_i - 1].note = new_note 
    when "5"
      puts "Enter new id"
      new_id = gets.chomp
      @contacts[contact_select.to_i - 1].idd = new_id 
    end
  end


  def self.display_contacts
    puts "The following contacts are in your rolodex:"
    puts ""
    @contacts.each do |x|
      x.display_contact
    end
  end

  def self.contacts
    @contacts
  end
end