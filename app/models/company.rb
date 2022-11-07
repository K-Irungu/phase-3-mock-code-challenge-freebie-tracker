class Company < ActiveRecord::Base
    has_many :freebies
    has_many :devs, through: :freebies

    def give_freebie(dev:, item_name:, value:)
        new_freebie = Freebie.create(item_name: item_name, value: value, company_id: self.id)
        dev.freebies << new_freebie
    end

    def self.oldest_company
        earliest_founding_year = self.minimum(:founding_year)
        Company.where("founding_year = ?", earliest_founding_year)
    end
end
