class Post < ActiveRecord::Base
    validates :title, presence: true
    validates :content, length: { minimum: 250}
    validates :summary, length: { maximum: 250}
    validates :category, inclusion: { in: %w(Fiction Non-Fiction),
    message: "%{value} is not a valid category" }

    validate :non_clickbait

    

    def non_clickbait
        clickbait_titles = [
        /Won't Believe/i,
        /Secret/i,
        /Top [0-9]*/i,
        /Guess/i
        ]
        
        if clickbait_titles.none? { |t| t.match title }
            errors.add(:title, "must be clickbait")
        end
    end

end
