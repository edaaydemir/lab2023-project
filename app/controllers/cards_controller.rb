class CardsController < ApplicationController
  before_action :set_card, only: [:show, :edit, :update, :destroy]

  def index
    @cards = Card.all
  end

  def new
    @card = Card.new
  end

  def create
    
    @card = Card.new(card_params)

    if @card.save
      redirect_to cards_path, notice: 'Kart başarıyla eklendi.'
    else
      render :new
    end
  end

  def show
  end

  private

  def card_params
    params.require(:card).permit(:title, :content, :status)
  end
  

  def set_card
    @card = Card.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to cards_path, alert: 'Kart bulunamadı.'
  end
end
