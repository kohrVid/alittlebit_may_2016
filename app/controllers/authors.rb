Alittlebit::App.controllers :authors do
  before except: [:create, :new, :root, :index] do
    @author = Author.find(params[:id])
  end
  
  get :index, map: "/authors/" do
    @authors = Author.all
    render :index
  end

  get :new, map: "/authors/new" do
    @author = Author.new
    render :new
  end

  get :edit, map: "/authors/:id/edit" do
    render :edit
  end

  get :show, map: "/authors/:id" do
    render :show
  end

  post :create, map: "/authors/" do
    @author = Author.create(params[:author])
    redirect url_for(:authors, :show, id: @author.id)
  end

  put :update, map: "/authors/:id" do
    @author.update(params[:author])
    redirect url_for(:authors, :show, id: @author.id)
  end

  delete :destroy, map: "/author/:id" do
    @author.destroy
    redirect url_for(:authors, :index)
  end

end
