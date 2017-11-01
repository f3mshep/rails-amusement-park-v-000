class Ride < ActiveRecord::Base
  # write associations here
  belongs_to :user
  belongs_to :attraction

  def take_ride
    errors = []
    if user.tickets < attraction.tickets
      errors << "You do not have enough tickets to ride the #{attraction.name}."
    end
    if user.height < attraction.min_height
      errors << "You are not tall enough to ride the #{attraction.name}."
    end
    if errors.empty?
      ride_user = self.user
      ride_user.tickets = user.tickets - attraction.tickets
      ride_user.nausea = user.nausea + attraction.nausea_rating
      ride_user.happiness = user.happiness + attraction.happiness_rating
      ride_user.save
      "Thanks for riding the #{attraction.name}!"
    else
      errors.unshift("Sorry.")
      errors.join(" ")
    end
  end

end
