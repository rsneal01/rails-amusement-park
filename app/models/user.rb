class User < ApplicationRecord
    has_secure_password
    has_many :rides
    has_many :attractions, through: :rides
    # attribute :admin, :integer, default: false
    after_initialize :set_defaults, unless: :persisted?

    def set_defaults
        self.admin ||= false
    end

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
