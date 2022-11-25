class Post < ApplicationRecord
    validates :title, presence: true
    validates :content, length: { minimum: 250 } 
    validates :summary, length: { maximum: 250 } 
    validates :category, inclusion: { in: ["Fiction", "Non-Fiction"] }
    validate :title_must_be_clickbait


    
    def title_must_be_clickbait
        clickbait_words = ["Won't Believe", "Secret", "Top [number]", "Guess"]
        if title.present? && title.include?(clickbait_words[0] || clickbait_words[1] || clickbait_words[2] || clickbait_words[3]) == false
            errors.add(:title, "is not clickbait-y!")
        end
    end
end
