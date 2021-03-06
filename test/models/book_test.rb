require File.expand_path(File.dirname(__FILE__) + '/../test_config.rb')
describe "Book" do
  before do
    @valid_book = BookHelper.book
    @other_book = BookHelper.other_book
  end

  it "should create an instance of a valid book" do
    book = Book.new(@valid_book)
    book.valid?.must_equal true
  end
  
  it "should have an autogenerated ID" do
    book = Book.create(@valid_book)
    book.id.wont_be_nil
  end

  it "should have a title" do
    @valid_book[:title] = ""
    book = Book.new(@valid_book)
    book.valid?.wont_equal true
  end

  it "should have an ISBN" do
    @valid_book[:isbn] = ""
    book = Book.new(@valid_book)
    book.valid?.wont_equal true
  end

  describe "synopsis" do
    it "should exist" do
      @valid_book[:synopsis] = ""
      book = Book.new(@valid_book)
      book.valid?.wont_equal true
    end

    it "should be at least 10 characters long" do
      @valid_book[:synopsis] = "c"*9
      book = Book.new(@valid_book)
      book.valid?.wont_equal true
    end
    
    it "should be unique" do
      Book.create(@valid_book)
      @other_book[:synopsis] = @valid_book[:synopsis]
      book = Book.new(@other_book)
      book.valid?.wont_equal true
    end
  end
  
  it "should have a published_on date" do
    @valid_book[:published_on] = ""
    book = Book.new(@valid_book)
    book.valid?.wont_equal true
  end
 
  describe "associations" do 
    it "should have an author" do
      @valid_book[:authors] = []
      book = Book.new(@valid_book)
      book.valid?.wont_equal true
    end
=begin
    it "should have at least one format" do
      @valid_book[:formats] = []
      book = Book.new(@valid_book)
      book.valid?.wont_equal true
    end
    
=end
    it "should have at least one genre" do
      @valid_book[:genres] = []
      book = Book.new(@valid_book)
      book.valid?.wont_equal true
    end
  end
end
