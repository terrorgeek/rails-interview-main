class Customer < ApplicationRecord
  belongs_to :company

  validates :company, presence: true
  validates :email, presence: true, uniqueness: true
  validates :first_name, :last_name, presence: true
end
