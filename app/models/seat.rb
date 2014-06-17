class Seat < ActiveRecord::Base

  belongs_to :flight
  validate :baggage_limit

  def baggage_limit
       if baggage > flight.baggage_allowance
         errors.add(:base, 'You have too much baggage')
       end
       if flight.seats.size >= flight.capacity
         errors.add(:base, 'All seats are taken')
       end
  end
end
