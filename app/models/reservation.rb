class Reservation < ApplicationRecord
	belongs_to :guest, class_name: 'User'
	belongs_to :listing

	validate :start_must_be_before_end_time
	validate :overlaping_reservation?
	validates :start_date,
    presence: true
  validates :end_date,
    presence: true


	def start_must_be_before_end_time
    errors.add(:start_date, "must be before end time") unless
        start_date < end_date
	end 

	def duration
    end_date.to_i
    start_date.to_i
    return duration = ((end_date - start_date)*(1.1574E-8)).round(7).days
   end

  def overlaping_reservation?
    reservations = listing.reservations
    overlap = false
    reservations.each do |reservation|
      overlap = true if self.start_date.between?(reservation.start_date, reservation.end_date) 
    end 
    errors.add(:start_date, "The listing is already booked for those dates ") unless
      overlap == false
    # vérifie dans toutes les réservations du listing s'il y a une réservation qui tombe sur le datetime en entrée
  end
end
