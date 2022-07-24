class Organisation < ApplicationRecord
  has_many :shifts
  has_many :employments
  has_many :users, through: :employments

  validates :name, :hourly_rate, presence: true
  validates :name, uniqueness: true
  validates :hourly_rate, numericality: { greater_than: 0.0 }
  
end
