class TitleValidator < ActiveModel::Validator
  def validate(record)
    #binding.pry
    if record.title
      clickbait = ["Won't Believe", "Secret", "Top[number]", "Guess"]
      unless clickbait.detect {|bait| record.title.include?(bait)}
        record.errors[:title] << "Must contain clickbait"
      end
    end
  end
end