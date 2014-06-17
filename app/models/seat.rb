class Seat < ActiveRecord::Base

  belongs_to :flight
  validate :baggage_limit

  def baggage_limit
       if baggage > flight.baggage_allowance
         errors.add(:base, 'You have too much baggage')
       end
  end
end
