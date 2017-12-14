require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end


  get '/posts/new' do
    #now i want to create a new post (not interacting with database here)
    erb :new
  end

  post '/posts' do
    #now i want to save that new post.
    @post = Post.create(params)
    redirect to '/posts'
  end

  get '/posts' do
    #i want all the posts to be listed on the home (index page)
    @posts = Post.all
    erb :index

  end

#UPDATE

  get '/posts/:id' do
    #grab the post that you want to update and go to the edit page
    @post = Post.find(params[:id])
    erb :show
  end


  get '/posts/:id/edit' do #loads edit form
    @post = Post.find_by_id(params[:id])
    erb :edit
  end

  patch '/posts/:id' do
    @post = Post.find_by_id(params[:id])
    @post.name = params[:name]
    @post.content = params[:content]

    @post.save
    erb :show
  end

  delete '/posts/:id' do #delete action
    binding.pry
    @post = Post.find(params[:id])
    @post.delete
    erb :deleted
  end







end
