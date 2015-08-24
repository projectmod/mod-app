class Outlet < ActiveRecord::Base
  belongs_to :user
  has_many :bookings
  has_many :images, dependent: :destroy
  has_many :working_hours

  before_create :search_address

  accepts_nested_attributes_for :images
  accepts_nested_attributes_for :working_hours, allow_destroy: true,
    reject_if: proc { |attr| attr['days'].blank? || attr['time'].blank? }

  validates_presence_of :business_registration, uniqueness: true

  def self.within_range(user_lon, user_lat, outlets)

    rgeo_factory = RGeo::Geographic.spherical_factory(srid: 4326)

    # "101.123123 3.123123" in lon lat format
    user_point = rgeo_factory.point(user_lon, user_lat)

    # Distance in meters
    outlets.select { |outlet| rgeo_factory.point(outlet.longitude, outlet.latitude).distance(user_point) < 2000 }
  end

  def confirmation_code
    SecureRandom.urlsafe_base64(6)
  end

  private

  def search_address
    res = Geokit::Geocoders::MultiGeocoder.geocode(address)
    return if !res

    self.latitude, self.longitude = res.lat, res.lng
  end
end
