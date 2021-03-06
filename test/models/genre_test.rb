require File.expand_path(File.dirname(__FILE__) + '/../test_config.rb')

describe "Genre" do
  before do
    Genre.destroy_all
    @valid_genre = GenreHelper.genre
    @other_genre = GenreHelper.other_genre
  end

  it "should create an instance of a valid genre" do
    genre = Genre.new(@valid_genre)
    genre.valid?.must_equal true
  end
  
  it "should have an autogenerated ID" do
    genre = Genre.create(@valid_genre)
    genre.id.wont_be_nil
  end

  describe "name" do
    it "should exist" do
      @valid_genre[:name] = ""
      genre = Genre.new(@valid_genre)
      genre.valid?.wont_equal true
    end

    it "should be unique" do
      Genre.create(@valid_genre)
      new_genre = Genre.new(name: @valid_genre[:name])
      new_genre.valid?.wont_equal true
    end
  end

end
