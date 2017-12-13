require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  # CREATE
  get '/posts/new' do
    erb :new
  end

  post '/posts' do
    Post.create(params)
    redirect "/posts"
  end

  # READ
  get '/posts' do
    @posts = Post.all
    erb :index
  end

  get '/posts/:id'do
    @post = Post.find(params[:id])
    erb :show
    # binding.pry
  end

  # UPDATE
  get '/posts/:id/edit' do
    @post = Post.find(params[:id])
    erb :edit
  end

  patch '/posts/:id' do
    @post = Post.find(params[:id])
    @post.update(params[:post])
    redirect "/posts/#{@post.id}"
  end

  # DELETE

  delete '/posts/:id/delete' do
    @post = Post.find(params[:id])
    @post.destroy
    erb :delete
  end

end
