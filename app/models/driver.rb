class Driver < ApplicationRecord
  has_many :trips
  def calculate_total_earned
    total_earned = 0
    self.trips.each do |trip|
      total_earned+=((trip.cost-165)*(0.8))
    end
    return (total_earned/100).round(2)
  end
end
