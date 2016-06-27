Alittlebit::App.controllers :books do
  before except: [:create, :new, :root, :index] do
    @book = Book.find(params[:id])
  end
  
  get :root, map: "/" do
    @books = Book.all
    render "index"
  end

  get :index, map: "/books/" do
    @books = Book.all
    render "index"
  end

  get :new, map: "/books/new" do
    @book = Book.new
    render "new"
  end

  get :show, map: "/books/:id" do
    render "show"
  end

  post :create, map: "/books/" do
    @book = Book.create(params[:book])
    redirect url_for(:books, :show, id: @book.id)
  end

end
