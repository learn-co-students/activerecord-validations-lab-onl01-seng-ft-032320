class Post < ActiveRecord::Base
    #include ActiveModel::Validations
    #validates_with TitleValidator
    validates :title, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
    validate :non_clickbait

    def non_clickbait
        arr = [/Won't Believe/i,/Secret/i,/Top [0-9]*/i,/Guess/i]
        unless arr.any? {|t| t.match title}
            errors.add(:title, "Title not sufficiently clickbait-y!")
        end
    end
 end
