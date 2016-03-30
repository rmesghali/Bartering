class Barter < ActiveRecord::Base
  belongs_to :user
  # validates :zip, numericality: { only_integer: true }
  has_many :comments
end
