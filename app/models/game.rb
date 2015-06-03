class Game < ActiveRecord::Base
  validates :query,
    presence: true

  validates :score,
    presence: true,
    numericality: { only_integer: true }
end
