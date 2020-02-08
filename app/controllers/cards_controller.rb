# frozen_string_literal: true

class CardsController < ApplicationController
  def top
    cards = Card.all
    render json: cards, each_serializer: CardSerializer, include: '**'
  end

  def create_or_update
    card = Card.find_or_initialize_by(id: card_params[:id])
    if card.new_record?
      card.build_todo(card_params)
      card.save!
    else
      card.todo.update!(card_params)
    end
  end

  def destroy
    card = Card.find(params[:id])
    card.delete!
  end

  private

  def card_params
    params[:card].permit(:title, :description, :id)
  end
end
