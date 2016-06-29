require File.expand_path(File.dirname(__FILE__) + '/../test_config.rb')

describe "AuthorBook Model" do
  it 'can construct a new instance' do
    @author_book = AuthorBook.new
    refute_nil @author_book
  end
end
