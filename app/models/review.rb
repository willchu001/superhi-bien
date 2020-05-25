class Review < ApplicationRecord

  has_many :comments 

  geocoded_by :address
  after_validation :geocode


  validates :title, presence: true
  validates :body, length: { minimum: 10 }
  validates :score, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 10 }
  validates :restaurant, presence: true
  # validates :ambience, presence:true
  validates :phone_number, format: { with: /\d{3}-\d{3}-\d{4}/, message: "bad format" }
  validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 3 }
  validates :address, presence: true

  def to_param
    id.to_s + "-" + title.parameterize
  end
end
