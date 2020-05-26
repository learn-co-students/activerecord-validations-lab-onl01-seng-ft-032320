class Post < ActiveRecord::Base
    validates :title, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: { in: %w(Fiction Non-Fiction),
        message: "%{value} is not a valid size" }
        validate :click_baity

        def click_baity
            if !self.title.nil?
                unless self.title.match(/Won't Believe/) || self.title.match(/Secret/) || self.title.match(/Top \d/) || self.title.match(/Guess/)
                    errors.add(:title, 'Title is not click baity enough')
                end
            end
        end
    end
