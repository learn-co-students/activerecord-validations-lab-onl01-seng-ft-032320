class TitleValidator < ActiveModel::Validator
    def validate(record)
      arr = ["Won't Believe", "Secret", "Top", "Guess"]
      arr.each do |hook|
        record.title.any?(hook)
      unless record.title.("Won't Believe", "Secret", "Top" "Guess")
        record.errors[:title] << "Title not sufficiently clickbait-y!"
      end
    end
  end
