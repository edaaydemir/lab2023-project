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
      
      private
      
      def card_params
        params.require(:card).permit(:title, :content, :type)
      end

      def set_card
        @card = Card.find(params[:id])
      end
      
      private

       def card_params
           params.require(:card).permit(:title, :content, :type)
       end

       def detail
        @card = Card.find(params[:id])
      end
      
      
      
  end
  