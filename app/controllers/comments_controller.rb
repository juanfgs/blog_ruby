class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:comment][:post_id])
    @comment = Comment.new
    @comment.name =  params[:comment][:name]
    @comment.comment = params[:comment][:comment]
    if @comment.save
      @post.comments << @comment
      redirect_to :back, flash: {message: "Thank you for your comment "}
    else
      @comment.errors.each do |attribute, error|
        flash[attribute] = error
      end
      redirect_to :back
    end

  end
end
