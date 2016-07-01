require File.expand_path(File.dirname(__FILE__) + '/../test_config.rb')

describe "BookGenre Model" do
  it 'can construct a new instance' do
    @book_genre = BookGenre.new
    refute_nil @book_genre
  end
end
