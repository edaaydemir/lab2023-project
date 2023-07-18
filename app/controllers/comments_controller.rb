class CommentsController < ApplicationController
  before_action :require_login, only: [:create, :destroy]

  def new
    @card = Card.find(params[:card_id])
    @comment = Comment.new
  end

  def create
    @card = Card.find(params[:card_id])
    @comment = @card.comments.build(comment_params)
    @comment.user = current_user

    if @comment.save
      redirect_to @card, notice: 'Comment added successfully!'
    else
      redirect_to @card, notice: 'Failed to add comment!'
    end
  end

  def destroy
    @card = Card.find(params[:card_id])
    @comment = @card.comments.find(params[:id])
    @comment.destroy
    redirect_to @card, notice: 'Comment successfully deleted.'
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end

  def require_login
    unless current_user
      redirect_to login_path, alert: 'You must be logged in to perform this action.'
    end
  end
end
