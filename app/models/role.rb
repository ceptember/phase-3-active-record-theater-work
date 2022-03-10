class Role < ActiveRecord::Base
    has_many :auditions

    def actors
        self.auditions.map do |a|
            a.actor
        end
    end

    def locations
        self.auditions.map do |a|
            a.location
        end
    end

    def lead
        if self.auditions.where(hired: true).exists?
            self.auditions.where(hired: true).first
        else
            'no actor has been hired for this role'
        end
    end

    def understudy
        if self.auditions.where(hired: true).second.exists?
            self.auditions.where(hired: true).second
        else
            'no actor has been hired for understudy for this role'
        end
    end

end