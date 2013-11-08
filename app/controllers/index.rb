get '/' do
  erb :index
end

post '/login' do
  user = User.find_by_name(params[:name])
  if user != nil
    if params[:password] == user.password
      session[:id] = user.id
      session[:login] = true
      redirect "/"
    else
      session[:login] = false
      redirect '/login'
    end
  end
  session[:login] = false
  redirect '/login'

end

get "/login" do
  erb :login
end

get "/signin" do
  erb :signin
end

post "/signin" do
  user = User.create(name: params[:name], email: params[:email], password: params[:password] )
  user = Album.create(name: "default", user_id: session[:id])
  session[:id] = user.id
  redirect '/'
end

get "/logout" do
  session.clear
  erb :index
end

get "/albums/:id" do
  @user_album_id = params[:id]
  erb :album
end

get "/post/:userId" do
  Album.create(user_id: params[:userId], name: params[:album_name])
  @user_album_id = params[:userId]
  erb :album
end

get "/albums/:userId/:albumId" do
  @user_id = params[:userId]
  @album_id = params[:albumId]
  erb :photo
end

get "/post/:userId/:albumId" do
  Photo.create(album_id: params[:albumId], name: params[:photo_name], location: params[:photo_location])

  @user_id = params[:userId]
  @album_id = params[:albumId]
  erb :photo
end

post "/post/photo/:id" do
  current_user = User.find(session[:id])
  photo = Album.find(params[:id]).photos.new()
  photo.file = params[:filename]
  photo.save
  # uploader = AvatarUploader.new
  # uploader.store!(params[:filename])
  # uploader.retrieve_from_store!('my_file.png')
  redirect "/"
end



