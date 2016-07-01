require File.expand_path(File.dirname(__FILE__) + '/../../test_config.rb')

describe "GET index" do
  it "should give a 200 OK" do
    get "/books"
    last_response.status.must_equal 200
  end
  
  it "should give a 200 OK" do
    get "/"
    last_response.status.must_equal 200
  end
end

describe "GET new" do
  before do
    get "/books/new"
  end

  it "should give a 200 OK" do
    last_response.status.must_equal 200
  end

  describe "POST to /books" do
    before do
      @params = {}
      @params[:book]= BookHelper.book
      @params[:book].delete(:authors)
      @params[:book].delete(:genres)
      @params[:authors] = BookHelper.book[:authors].map{ |author| author.id }
      @params[:genres] = BookHelper.book[:genres].map{ |genre| genre.id }
    end

    it "should post a book" do
      count = Book.all.count
      post "/books/", @params
      last_response.redirect?
      Book.all.count.must_equal count + 1
    end
  end
end

describe "GET edit" do
  before do
    @book = Book.create(BookHelper.book)
    get "/books/#{@book.id}/edit"
  end

  it "should give a 200 OK" do
    last_response.status.must_equal 200
  end

  describe "PUT to /books/:id" do
    before do
     # @other_author = Author.create(AuthorHelper.mononym.attributes)
      @params = {}
      @params[:book] = BookHelper.book
      @params[:book][:title] = "This is a new title. See here!"
      @params[:book].delete(:authors)
      @params[:book].delete(:genres)
      @params[:authors] = BookHelper.book[:authors].map{ |author| author.id }
      @params[:genres] = BookHelper.book[:genres].map{ |genre| genre.id }
    end

    it "should update a book" do
      put "/books/#{@book.id}", @params
      last_response.redirect?
      @book.title.must_include "This is a new title. See here!"
    end
  end
end

describe "GET show" do
  before do
    @book = Book.create(BookHelper.book)
    get "/books/#{@book.id}"
  end

  it "should give a 200 OK" do
    last_response.status.must_equal 200
  end

  describe "DELETE to /books/:id" do
    it "should destroy a book" do
      original_count = Book.count
      delete "/books/#{@book.id}"
      last_response.redirect?
      Book.count.must_equal original_count - 1
    end
  end
end
