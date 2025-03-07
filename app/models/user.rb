class User < ApplicationRecord
    has_secure_password
    has_many :rides
    has_many :attractions, through: :rides

    def mood
        # binding.pry
        if self.happiness && self.nausea
            if self.happiness > self.nausea
                "happy"
            else
                "sad"
            end
        end
      end

end
