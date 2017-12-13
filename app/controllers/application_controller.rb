require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end
# CREATE FORM
  get '/posts/new' do
    erb :new
  end
# SHOW
  get '/posts/:id' do
    @post = Post.find(params[:id])
    erb :show
  end
# READ
  get '/posts' do
    @posts = Post.all
    erb :index
  end
# CREATE
  post '/posts' do
    @post = Post.create(params)
    redirect '/posts'
  end
# UPDATE FORM
  get '/posts/:id/edit' do
    @post = Post.find(params[:id])
    erb :edit
  end
  # UPDATE
  patch '/posts/:id' do
    @post = Post.find(params[:id])
    @post.update(params[:post])
    redirect "/posts/#{@post.id}"
  end
# DELETE
  delete '/posts/:id/delete' do
    @post = Post.find(params[:id])
    @deleted = @post.destroy
    erb :deleted
  end

end
