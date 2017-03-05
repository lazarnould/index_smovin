class Landlord < ActiveRecord::Base
  has_many :leases
end
