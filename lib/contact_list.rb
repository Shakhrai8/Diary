class ContactList
  attr_accessor :contacts

  def initialize
    @contacts = []
  end

  def add_contact(contact)
    contacts << contact
  end

  def view_numbers
    contacts.map(&:phone_number)
  end
end