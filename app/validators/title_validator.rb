class TitleValidator < ActiveModel::Validator
    def validate(record)
      if record.title
        arr = %w(Won't Believe Secret Top [number] Guess)
        if arr.detect { |e| record.title.include?(e) }.nil?
        record.errors[:title] << "This title isn't clickbait-y enough!"
        end
      end
    end
end