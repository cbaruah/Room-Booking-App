class Room < ActiveRecord::Base

  def self.search(search)
    puts search
      search0 = search[:search0]
      search1 = search[:search1]
      search2 = search[:search2]
      search3 = search[:search3]
      search4 = search[:search4]
      search5 = search[:search5]
      if search4.nil? || search4.empty?
        search4 = Date.current
      end

    if ((search1.nil? || search1.empty?) && (search2.nil? || search2.empty?) && (search3.nil? || search3.empty?) && (search4.nil?) || search0 == '0')
        rooms = Room.all
    else
      if search0 == '1'
        rooms = Room.where("room_no= :search1", search1: "#{search1}")
      elsif search0 == '2'
        rooms = Room.where("size = :search2", search2: "#{search2}")
      elsif search0 == '3'
        rooms = Room.where("building = :search3", search3: "#{search3}")
      elsif search0 == '4'
         #rooms = Room.joins("LEFT JOIN histories on rooms.id = histories.room_no ").where("histories.date != :search4 AND histories.slot != :search5", search4: "#{search4}", search5: "#{search5}")
       # rooms = Room.joins{:histories.outer}.where("histories.date != :search4 AND histories.slot != :search5", search4: "#{search4}", search5: "#{search5}")
        listOfRooms = Room.all
        rooms = []
        listOfRooms.each do |r|
         # binding.pry
            r.histories.each do |h|
              puts "*****"
              puts h.date.to_s
              puts search4
              puts h.date.to_s == search4.to_s
              puts h.slot.to_s == search5
              if h.date.to_s == search4.to_s && h.slot.to_s == search5 && h.status == 1
                rooms.push r
              end
            end

        end
        puts rooms
        listOfRooms - rooms
      end
    end
  end

  def to_s
    return self.building + ", Room " + self.room_no.to_s
  end

  def self.booked?(search)
    date = search[:search4]
    slot = search[:search5]
    if date.nil?
      date = Date.current
    end
      reserved = Room.joins(:histories).where("histories.date = :date AND histories.slot = :slot", date: "#{date}", slot: "#{slot}")
    return reserved.any?
  end

  has_many :users, through: :histories
  has_many :histories
end
