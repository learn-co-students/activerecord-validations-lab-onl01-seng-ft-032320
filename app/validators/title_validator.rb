class TitleValidator < ActiveModel::Validator 
    def validate(record)
        if record.title
            accept = ["Won't Believe", "Secret", "Top [number]", "Guess"]
            if accept.detect {|phrase| record.title.include?(phrase)}.nil?
            record.errors[:title] << "Not Click bait-y"
            end
        end
    end
end