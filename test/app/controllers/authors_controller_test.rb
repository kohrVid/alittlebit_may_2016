require File.expand_path(File.dirname(__FILE__) + '/../../test_config.rb')

describe "GET index" do
  it "should give a 200 OK" do
    get "/authors"
    last_response.status.must_equal 200
  end
end

describe "GET new" do
  before do
    get "/authors/new"
  end

  it "should give a 200 OK" do
    last_response.status.must_equal 200
  end

  describe "POST to /authors" do
    before do
      @params = AuthorHelper.author.attributes
    end

    it "should post a author" do
      count = Author.all.count
      post "/authors/", @params
      last_response.redirect?
      Author.all.count.must_equal count + 1
    end
  end
end

describe "GET edit" do
  before do
    @author = AuthorHelper.author
    @author.save
    get "/authors/#{@author.id}/edit"
  end

  it "should give a 200 OK" do
    last_response.status.must_equal 200
  end

  describe "PUT to /authors/:id" do
    before do
      @params = AuthorHelper.author.attributes
      @params[:biography] = "New Biography"
    end

    it "should update a author" do
      put "/authors/#{@author.id}", @params
      last_response.redirect?
      @author.authors.must_include @other_author
    end
  end
end

describe "GET show" do
  before do
    @author = AuthorHelper.author
    @author.save
    get "/authors/#{@author.id}"
  end

  it "should give a 200 OK" do
    last_response.status.must_equal 200
  end

  describe "DELETE to /authors/:id" do
    it "should destroy a author" do
      original_count = Author.count
      delete "/authors/#{@author.id}"
      last_response.redirect?
      Author.count.must_equal original_count - 1
    end
  end
end
