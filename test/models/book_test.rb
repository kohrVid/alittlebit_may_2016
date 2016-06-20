require File.expand_path(File.dirname(__FILE__) + '/../test_config.rb')

describe "Book Model" do
  it 'can construct a new instance' do
    @book = Book.new
    refute_nil @book
  end
end
