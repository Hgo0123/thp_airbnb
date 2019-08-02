class Reservation < ApplicationRecord
	belongs_to :guest, class_name: 'User'
	belongs_to :listing

	def duration
		self.end_date - self.start_date
	end
end
