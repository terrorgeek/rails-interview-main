class CompanyUser < ApplicationRecord
  belongs_to :user
  belongs_to :company

  validates :user, presence: true, uniqueness: true
  validates :company, presence: true
end
