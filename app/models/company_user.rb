class CompanyUser < ApplicationRecord
  belongs_to :user
  belongs_to :company

  validates :user, presence: true# uniqueness: true
  validates :company_id, presence: true
end
