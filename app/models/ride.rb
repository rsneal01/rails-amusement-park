class Ride < ActiveRecord::Base
    belongs_to :attraction
    belongs_to :user

    def take_ride
        # binding.pry
        if self.user.height < self.attraction.min_height && self.user.tickets >= self.attraction.tickets
            return "Sorry. You are not tall enough to ride the #{self.attraction.name}."
        elsif self.user.tickets < self.attraction.tickets && self.user.height >= self.attraction.min_height
            return "Sorry. You do not have enough tickets to ride the #{self.attraction.name}."
        elsif self.user.tickets < self.attraction.tickets && self.user.height < self.attraction.min_height
            return "Sorry. You do not have enough tickets to ride the #{self.attraction.name}. You are not tall enough to ride the #{self.attraction.name}."
        elsif self.user.height >= self.attraction.min_height && self.user.tickets >= self.attraction.tickets
            new_tickets = self.user.tickets - self.attraction.tickets
            new_happiness = self.user.happiness + self.attraction.happiness_rating
            new_nausea = self.user.nausea + self.attraction.nausea_rating
            self.user.update(:tickets => new_tickets, :happiness => new_happiness, :nausea => new_nausea)
            return "Thanks for riding the #{self.attraction.name}!"
        end
        self.user.save
    end


    # def is_tall_enough?
    #     if self.user.height >= self.attraction.min_height
    #         true
    #     else
    #         false
    #     end
    # end

    # def has_enough_tickets?
    #     if self.user.tickets >= self.attraction.tickets
    #         true
    #     else
    #         false
    #     end
    # end
    # def ride_requirements
    #     has_enough_tickets, is_tall_enough = false
    #     if self.user.tickets >= self.attraction.tickets
    #         has_enough_tickets = true
    #     elsif self.user.height >= self.attraction.min_height
    #         is_tall_enough = true
    #     end
        
    # end

end
