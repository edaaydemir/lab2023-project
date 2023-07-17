# comments_controller.rb
class CommentsController < ApplicationController
    def create
      @card = Card.find(params[:card_id])
      @comment = @card.comments.build(comment_params.merge(user_id: 2))
      if @comment.save
        redirect_to @card, notice: "Yorumunuz başarıyla eklendi."
      else
        render "cards/show"
      end
    end
  
    private
  
    def comment_params
      params.require(:comment).permit(:content)
    end
  end
  