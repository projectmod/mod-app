class Outlet < ActiveRecord::Base
  belongs_to :merchant
  has_many :bookings

  def self.within_range(user_lon, user_lat, outlets)
    rgeo_factory = RGeo::Geographic.spherical_factory(:srid => 4326)
    # "101.123123 3.123123" in lon lat format
    user_point = rgeo_factory.point(user_lon, user_lat)
    # distance in meters
    final = []
    outlets.each do |outlet|
      if rgeo_factory.point(outlet.longitude, outlet.latitude).distance(user_point) < 5000000
        final << outlet
      end 
    end
    binding.pry
    
  end
end
