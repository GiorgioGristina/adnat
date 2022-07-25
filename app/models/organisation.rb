class Organisation < ApplicationRecord
  has_many :shifts, dependent: :destroy
  has_many :employments, dependent: :destroy
  has_many :users, through: :employments

  validates :name, :hourly_rate, presence: true
  validates :name, uniqueness: true
  validates :hourly_rate, numericality: { greater_than: 0.0 }
  
end
