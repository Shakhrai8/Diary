require 'diary'

RSpec.describe Diary do
  let(:diary) { Diary.new }

  context "#list method" do
    it "returns an empty list when there are no entries" do
      expect { diary.list }.to output("").to_stdout
    end
  end
end
