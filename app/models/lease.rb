class Lease < ActiveRecord::Base
  belongs_to :landlord
  belongs_to :tenant

  validates :signature_month, presence: true
  validates :signature_year, presence: true
  validates :start_month, presence: true
  validates :start_year, presence: true
  validates :indexation_year, presence: true
  validates :region, presence: true
  validates :rent, presence: true
end
