class Barter < ActiveRecord::Base
  belongs_to :users
  validates :zip, numericality: { only_integer: true }
end
