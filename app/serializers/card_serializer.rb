# frozen_string_literal: true

class CardSerializer < ActiveModel::Serializer
  attributes :id

  has_one :todo, serializer: TodoSerializer
end
