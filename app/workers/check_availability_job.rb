class CheckAvailabilityJob < ActiveJob::Base
  @queue = :availability_checker_queue

  def perform
    Outlet.all.each do |outlet|
      if outlet.bookings.where("created_at < ?", 1.hour.ago).empty?
        outlet.update(availability: false)
      end
    end
  end
end
