class PostsController < ApplicationController
  def index
    if params[:term]
      @posts = Post.search(params[:term]).page params[:page]
    else
      @posts = Post.all.page params[:page]    
    end
    @posts 
  end

  def show
    @post = Post.find(params[:id])
  end
end
