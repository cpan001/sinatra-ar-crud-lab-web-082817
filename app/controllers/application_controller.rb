require_relative '../../config/environment'
require 'pry'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/posts/new' do
    erb :new
  end

  post "/posts" do
    @new_post = Post.create(name: params[:name], content: params[:content])
    erb :index
  end

  get "/posts" do
    erb :index
  end

  get "/posts/:id" do
    erb :show
  end

  get "/posts/:id/edit" do
    erb :edit
  end

  patch "/posts/:id" do
    @post = Post.find(params[:id])
    @post.update(name: params[:name], content: params[:content])
    erb :show
  end

  delete "/posts/:id/delete" do
    erb :delete
  end


end
