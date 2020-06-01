class ClickBaitValidator < ActiveModel::Validator
    def validate(record)
        if !record.title.include?("Won't Believe", "Secret", "Top [number]", "Guess")
            record.errors[:title] << "Title is not click-baity"
        end
    end
end