require File.expand_path(File.dirname(__FILE__) + '/../../test_config.rb')
=begin
describe "/books" do
  before do
    get "/books"
  end

  it "should return hello world text" do
    assert_equal "Hello World", last_response.body
  end
end
=end

describe "GET to new" do
  before do
    get "/books/new"
  end

  it "should give a 200 OK" do
    last_response.status.must_equal 200
  end

  describe "POST to /books" do
    before do
      @params = {
	title: "The Epic of Gilgamesh",
	isbn: "hbjbjkhj8676383",
	synopsis: "Gilgamesh makes a new friend.",
	author: "An ancient Sumerian person",
	published_on: Date.new(1990, 01, 01),
	genre: "Mythology"
      }
    end

    it "should post a book" do
      count = Book.all.count
      post "/books/", @params
      last_response.redirect?
      Book.all.count.must_equal count + 1
    end
  end
end
