class Barter < ActiveRecord::Base
  belongs_to :user

  # validates :zip, numericality: { only_integer: true }

  has_many :comments

  validates :category, presence: true
  validates :expiration, presence: true
  validates :product, presence: true
  validates :description, presence: true
  validates :neighborhood, presence: true
  validates :interested_in, presence: true



  validates_date :expiration, :timeliness => {:on_or_after => lambda { Date.today }, :type => :date}
end
