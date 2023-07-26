class CardsController < ApplicationController
  before_action :set_card, only: [:show, :edit, :update, :destroy]

  def index
    @cards = Card.all
  end

  def new
    if current_user.nil?
      flash[:notice] = "Please log in to add a card."
      redirect_to login_path
    else
      @card = Card.new
      @user = current_user
    end
  end

  def create 
    @card = Card.new(card_params)
    @card.user = current_user
      
    respond_to do |format|
      if @card.save
        format.turbo_stream do
          render turbo_stream:
           turbo_stream.prepend(
            "#{@card.status}_cards",
            partial: "cards/card",
            locals: { card: @card }
          )
        end
        format.html { redirect_to cards_path, notice: 'The card was added successfully.' }
      else
        format.html { render :new }
      end
    end
  end
 
  def show
    @card = Card.find(params[:id])
    
  end

  def destroy 
    @card = Card.find(params[:id])
    @card.destroy
    redirect_to cards_path, notice: 'The card was deleted successfully.'

  end
  
  def edit
  end

  def update
    @card = Card.find(params[:id])
  

    respond_to do |format|
      if  @card.update(card_params)
        format.turbo_stream do
          render turbo_stream:
           turbo_stream.replace(
            @card,
            partial: "cards/card",
            locals: { card: @card }
          )
        end
        format.html { redirect_to cards_path, notice: 'The card was updated successfully.' }
      else
        format.html { render :edit }
      end
    end
  end

  private

  def card_params
    params.require(:card).permit(:title, :content, :status, user_ids: [])
  end
  

  def set_card
    @card = Card.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to cards_path, alert: 'The card was not found.'
  end


  
end
