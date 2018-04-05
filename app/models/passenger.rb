class Passenger < ApplicationRecord
  has_many :trips

  validates :name, presence: true, uniqueness: true
  validates :phone_num, presence: true

  def calculate_total_charged
    total_amount = 0
    self.trips.each { |trip| total_amount += trip.cost }
    ((total_amount.to_f)/100).round(2)
  end

  def check_for_unrated_trip
    no_current_trips = true
    self.trips.each { |trip| no_current_trips = false if trip.rating.nil? }
    no_current_trips
  end
end
