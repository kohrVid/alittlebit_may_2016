Alittlebit::App.controllers :books do
  before except: [:create, :new, :root, :index] do
    @book = Book.find(params[:id])
  end

  before :create, :update do
    @book_params = params[:book]
      unless params[:authors].nil?
	@book_params[:authors] = params[:authors].map{ |i| Author.find(i.to_i) }
      end
      unless params[:genres].nil?
	@book_params[:genres] = params[:genres].map{ |i| Genre.find(i.to_i) }
      end
  end
  
  get :root, map: "/" do
    @books = Book.all
    @tweets = []
    @tweets += SocialMedia.twitter_search("A Little Bit of Knowledge", 5)
    render :index
  end

  get :index, map: "/books/" do
    @books = Book.all
    @tweets = []
    @tweets += SocialMedia.twitter_search("A Little Bit of Knowledge", 5)
    render :index
  end

  get :new, map: "/books/new" do
    @book = Book.new
    render :new
  end

  get :edit, map: "/books/:id/edit" do
    render :edit
  end

  get :show, map: "/books/:id" do
    render :show
  end

  post :create, map: "/books/" do
    @book = Book.create(@book_params)
    redirect url_for(:books, :show, id: @book.id)
  end
   
  put :update, map: "/books/:id" do
    @book.update(@book_params)
    redirect url_for(:books, :show, id: @book.id)
  end

  delete :destroy, map: "/books/:id" do
    @book.destroy
    redirect url_for(:books, :index)
  end

end
