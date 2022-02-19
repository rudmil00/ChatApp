class User < ApplicationRecord
      
  validates :username, presence: true, length: { minimum: 6, maximum: 20 },
            uniqueness: { case_sensitive: false }
    
             has_many :porukas
  has_secure_password
  
  # scope :online, ->{ where("last_seen_at > ?", 10.minutes.ago) }

  def self.online
    where("last_seen_at > ?", 10.minutes.ago)
  end
end
