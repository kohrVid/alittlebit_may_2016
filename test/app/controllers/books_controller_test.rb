require File.expand_path(File.dirname(__FILE__) + '/../../test_config.rb')

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
      @params[:authors] = BookHelper.book[:authors].map{ |author| author.id }
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
      @other_author = Author.create(AuthorHelper.mononym.attributes)
      @params = {}
      @params[:book] = BookHelper.book
      @params[:book].delete(:authors)
      @params[:authors] = [@other_author.id]
    end

    it "should update a book" do
      put "/books/#{@book.id}", @params
      last_response.redirect?
      @book.authors.must_include @other_author
    end
  end
end
