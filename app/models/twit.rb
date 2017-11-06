class Twit < ApplicationRecord
    belongs_to :user #create a method to go from tweet to user
    validates :message, presence:true, length: { maximum:120 }
    has_many :twit_tags
    has_many :tags, through: :twit_tags
    
    after_create do
        twit = Twit.find_by(id: self.id)
        hashtags = self.message.scan(/#\w+/)
        hashtags.uniq.map do |hashtag|
            tag = Tag.find_or_create_by(message_tag: hashtag.downcase.delete('#'))
            twit.tags << tag
        end
    end
    
    before_update do
        twit = Twit.find_by(id: self.id)
        twit.tags.clear
        hashtags = self.message.scan(/#\w+/)
        hashtag.uniq.map do |hashtag|
            tag = Tag.find_or_create_by(message_tag: hashtag.downcase.delete('#'))
            twit.tags << tag
        end
    end
end
