require 'contact_list'

RSpec.describe ContactList do
  let(:contact_list) { ContactList.new }

  describe "#view_numbers" do
    it "returns an empty array when there are no contacts" do
      expect(contact_list.view_numbers).to be_empty
    end
  end
end