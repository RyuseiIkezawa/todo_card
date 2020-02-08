# frozen_string_literal: true

class Todo < ApplicationRecord
  belongs_to :card
end
