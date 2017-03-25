class History < ActiveRecord::Base
  belongs_to :user
  belongs_to :room
#  validate :verify_booking_possible?

  # attr_accessible :room_id, :user_id, :start_time
  validates :user, :presence => true
  validates :room, :presence => true

  def verify_booking_possible?
    puts "test"
    puts (DateTime.now - 2.hours)
    merged_datetime = DateTime.new(self.date.year, self.date.month, self.date.day, self.slot,0,0)
    puts merged_datetime
    errors.add :base, "Room cannot be booked in the past" if (DateTime.now - 2.hours) > merged_datetime
    raise "Room Booking  is not allowed for more than one week in the future" if(DateTime.now + 7.days < merged_datetime)
  end
rescue => e
  self.errors.add(:base, e.message)
  return false
end
