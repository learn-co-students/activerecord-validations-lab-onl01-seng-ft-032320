class TitleValidator < ActiveModel::Validator
   def validate(record)
      clickbait = [
         "Won't Believe",
         "Secret",
         "Top",
         "Guess"
       ]
       
      unless record.title && clickbait.any?{|c| record.title.include?(c)}
         record.errors[:title] << "Not clickbaity enough"
      end
   end

 end