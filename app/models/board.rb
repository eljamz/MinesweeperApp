class Board < ApplicationRecord
  validates :width, :height, :mines_count, :name, :email, presence: true
  serialize :board_state, JSON
end
