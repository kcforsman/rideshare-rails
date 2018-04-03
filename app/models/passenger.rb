class Passenger < ApplicationRecord
  has_many :trips

  def calculate_total_charged
    total_amount = 0
    self.trips.each { |trip| total_amount += trip.cost }
    ((total_amount.to_f)/100).round(2)
  end
end
