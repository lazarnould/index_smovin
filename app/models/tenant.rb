class Tenant < ActiveRecord::Base
  has_one :lease
end
