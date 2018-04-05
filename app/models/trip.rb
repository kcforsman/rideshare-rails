class Trip < ApplicationRecord
  belongs_to :driver
  belongs_to :passenger

  validates :rating, numericality: { allow_nil: true }

  def self.create_new_trip(passenger)
    driver = Driver.find_available_driver
    return nil if driver.nil?
    date = Date.today.to_s
    rating = nil
    cost = rand(500..10000)
    Trip.new(driver: driver, passenger: passenger, date: date, rating: rating, cost: cost)
  end
end
