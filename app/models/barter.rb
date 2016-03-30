class Barter < ActiveRecord::Base
  belongs_to :users
  # validates :zip, numericality: { only_integer: true }
  validates :category, presence: true
  validates :expiration, presence: true
  validates :product, presence: true
  validates :description, presence: true
  validates :neighborhood, presence: true
end
