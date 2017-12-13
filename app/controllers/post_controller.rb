class PostController < ApplicationController
  #INDEX
  get '/posts' do
    @posts = Post.all
    erb :"posts/index"
  end

  #CREATE
  get '/posts/new' do
    erb :"posts/new"
  end

  post '/posts' do
    Post.create(params)
    redirect "/posts"
  end

  #UPDATE
  get '/posts/:id/edit' do
    @post = Post.find(params[:id])
    erb :"posts/edit"
  end

  patch '/posts/:id' do
    @post = Post.find(params[:id])
    @post.update(params["post"])
    redirect "/posts/#{@post.id}"
  end

  #READ
  get '/posts/:id' do
    @post = Post.find(params[:id])
    erb :"posts/show"
  end

  #DELETE
  delete '/posts/:id/delete' do
    @post = Post.find(params[:id])
    @name = @post.name
    @post.destroy
    erb :"posts/delete"
  end


end
