class CommentsController < ApplicationController

  def create
    @blog = Blog.find(params[:blog_id])
    c = Comment.new(comment_params)
    c.user_id = current_user.id
    c.blog_id = @blog.id
    if c.save
      redirect_to "/blogs"
    end
  end

  def edit
    @comment = Comment.find(params[:id])
    @user = current_user
  end

  def update
    @comment = Comment.find(params[:id])
    @blog = @comment.blog
    if @comment.update(comment_params)
      redirect_to "/blogs"
    else
      render edit_blog_path
    end
  end

  def destroy
    # @blog = Blog.find(params[:blog_id])
    # @comment = @blog.comments.destroy(params[:id])
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to "/blogs"
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :user_id, :blog_id)
  end
end
