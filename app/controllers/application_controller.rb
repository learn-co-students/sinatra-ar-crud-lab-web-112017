require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do

  end

  post '/posts' do
    #binding.pry
    Post.create(params)
    redirect '/posts'
  end

  get '/posts' do
    @posts = Post.all
    erb :index
  end

  get '/posts/new' do

    erb :new
  end

  patch '/posts/:id' do
    #binding.pry
    @post = Post.find(params[:id])
    @post.name = params[:name]
    @post.content = params[:content]
    @post.save
    redirect "posts/#{@post.id}"
  end

  get '/posts/:id' do
    #binding.pry
    @post = Post.find(params[:id])
    erb :show
  end

  get '/posts/:id/edit' do
    @post = Post.find(params[:id])
    erb :edit
  end

  delete '/posts/:id/delete' do
    @post = Post.find(params[:id])
    #binding.pry
    @post_name = @post.name
    @post.destroy
    erb :deleted
  end

end
