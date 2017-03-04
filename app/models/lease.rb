class Lease < ActiveRecord::Base
  belongs_to :landlord
  belongs_to :tenant

  def index(x, y, z)
    j = y.to_f
    k = z.to_f
    x * j / k
  end

end
