class Post < ActiveRecord::Base
    validates :title, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
    # %w(#{foo} Bar Bar\ with\ space)
    # => ["\#{foo}", "Bar", "Bar with space"]

    validate :non_clickbait

    def non_clickbait
        if self.title && !self.title.include?("Won't Believe") && !self.title.include?("Secret") && !self.title.include?("Top [number]") && !self.title.include?("Guess")
            errors.add(:title, "not clickbait")
        end
    end
end
