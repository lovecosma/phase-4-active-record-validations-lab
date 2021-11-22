class Post < ApplicationRecord
    validates :title, presence: true
    validates :content, length: {:minimum => 250}
    validates :summary, length: {:maximum => 250}
    validates :category, inclusion: %w(Fiction Non-Fiction)
    validate :clickbait



    def clickbait
        unless %r(\bWon't Believe|Secret|Top \d+|Guess).match?(self.title)
            errors.add(:title, "This title is not clickbait-y enough")
        end
    end


end 