# frozen_string_literal: true

class Card < ApplicationRecord
  has_one :todo
end
