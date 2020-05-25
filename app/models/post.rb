class Post < ActiveRecord::Base
    validates :title, presence: true
    validates :content, length: {minimum: 250 }
    validates :summary, length: {maximum: 250 }
    validates :category, inclusion: { in: ["Fiction", "Non-Fiction"]}
    validate :click_bate_check

    def click_bate_check
        hooks = ["Won't Believe", "Secret", "Guess" "Top"]
        unless title && hooks.any?{|hook| title.include?(hook) } 
            errors.add(:title, "Needs more click bate")
        end
    end
end
