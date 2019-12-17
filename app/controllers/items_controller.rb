class ItemsController < App
  
  get '/items' do
   if logged_in?
      @items = Item.all
      erb :'items/items'
    else
      redirect '/login'
   end
  end
  
  get '/items/new' do
    if logged_in?
      erb :'items/new'
    else
      redirect '/login'
    end
  end
  
  post '/items' do
     params[:name] != ""
     @item = Item.create(content: params[:name], user: current_user)
      redirect "/items/#{@item.id}"
    else
     redirect '/items/new'
    end
  end
  
  get '/items/:id' do
    @item = Item.find(params[:id])
      erb :'items/show_item'
  end


  get '/items/:id/edit' do
    
  end
  
  patch '/items/:id' do
  end
  
  delete '/items/:id' do
  end

end