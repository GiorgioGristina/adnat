class Shift < ApplicationRecord
  belongs_to :user
  belongs_to :organisation

  validates :start, :finish, :break, presence: true

end
