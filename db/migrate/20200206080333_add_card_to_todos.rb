class AddCardToTodos < ActiveRecord::Migration[6.0]
  def change
    add_reference :todos, :card, null: false, index: true, foreign_key: true 
  end
end

