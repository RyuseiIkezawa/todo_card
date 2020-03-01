# frozen_string_literal: true

class CardsController < ApplicationController

  protect_from_forgery

  def top; end

  def all
    cards = Card.includes(:todo).all
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
    render :top, status: :created
  end

  def destroy
    card = Card.find(params[:id])
    card.destroy!
    redirect_to top_cards_path
  end

  private

  def card_params
    params[:card].permit(:title, :description, :deadline, :id)
  end
end
