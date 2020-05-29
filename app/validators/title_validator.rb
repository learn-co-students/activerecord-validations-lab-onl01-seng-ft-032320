class TitleValidator < ActiveModel::Validator

    def validate(record)

        if !record.title
            record.errors[:title] << "cannot be blank"
        elsif !record.title.include?("Won't Believe") && !record.title.include?("Secret") && !record.title.include?("Top [number]") && !record.title.include?("Guess") 
            record.errors[:title] << "The title must contain: 'Won't Believe', 'Secret', 'Top [number]', or 'Guess'"
        end
    end
end