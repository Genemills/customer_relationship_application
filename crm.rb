require_relative "contact"
require_relative "rolodex"

class CRM
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def refresh
    puts "\e[H\e[2J"
  end

  def print_main_menu
    puts "\e[H\e[2J"
    puts "Welcome to #{@name} CRM"
    puts ""
    puts "[1] Add a new contact"
    puts "[2] Modify an existing contact"
    puts "[3] Delete a contact"
    puts "[4] Display all contacts"
    puts "[5] Display an attribute" 
    puts "[6] Exit"
    puts ""
    puts "Enter a number: "
  end

  def call_option(user_selected)
    case user_selected
    when 1
      refresh
      Rolodex.add_contact
      return_to_main
    when 2
      refresh
      Rolodex.modify_existing_contact
      return_to_main
    when 3
      refresh
      Rolodex.delete_contact
      return_to_main
    when 4
      refresh
      Rolodex.display_contacts
      return_to_main
    when 5
      refresh
      Rolodex.display_attributes
      return_to_main
    when 6
      refresh
      abort("Thank you for using #{name} CRM")
    else
      main_menu
    end
  end

  def return_to_main
    puts "Hit Enter to return to Main Menu:"
    gets
    main_menu
  end

  def main_menu
    print_main_menu
    user_selected = gets.to_i
    call_option(user_selected)
  end
end

Rolodex.add_initial_contacts
my_crm = CRM.new("Gene's")
my_crm.main_menu


