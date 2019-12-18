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
      erb :'items/new_item'
    else
      redirect '/login'
    end
  end
  
  post '/items' do
     if params[:item_name] != ""
     @item = Item.create(item_name: params[:item_name], user: current_user)
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
    if !logged_in?
      redirect '/login'
    else
      @item = Item.find(params[:id])
        if @item.user != current_user
          redirect "items/#{params[:id]}"
        else
          erb :'items/edit_item'
        end
    end
  end
  
  patch '/items/:id' do
    @item = Item.find(params[:id])
    if !params[:item_name].empty?
      @item.item_name = params[:item_name]
      @item.save
      redirect "/items/#{params[:id]}"
    else
      redirect "/items/#{params[:id]}/edit"
    end
  end
  
  delete '/items/:id' do
     @item = Item.find(params[:id])
    if logged_in? && @item.user == current_user
      @item.delete
    end
    redirect '/items'
  end

end