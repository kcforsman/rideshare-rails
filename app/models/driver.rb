class Driver < ApplicationRecord
  has_many :trips

  validates :name, presence: true, uniqueness: true
  validates :vin, presence: true

  def calculate_total_earned
    total_earned = 0
    self.trips.each do |trip|
      total_earned+=((trip.cost-165)*(0.8))
    end
    return (total_earned/100).round(2)
  end

  def calculate_rating_average
    total_ratings = 0
    number_of_rating = 0
    self.trips.each do |trip|
      next if trip.rating.nil?
      total_ratings += trip.rating
      number_of_rating += 1
    end
    (total_ratings.to_f / number_of_rating).round(2)
  end

  def self.find_available_driver
    available_drivers = Driver.where(driver_status: nil)
    return if available_drivers.empty?
    available_drivers.sample
  end
end
