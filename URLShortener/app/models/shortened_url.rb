class ShortenedURL < ActiveRecord::Base
  include SecureRandom

  validates :short_url, presence: true, uniqueness: true
  validates :long_url, :user_id, presence: true

  belongs_to :submitter,
  class_name: :User,
  primary_key: :id,
  foreign_key: :user_id




  def self.construct(user, long_url)
    ShortenedURL.create!(user_id: user.id, long_url: long_url, short_url: ShortenedURL.random_code)
  end


  def self.random_code
     loop do
       code = SecureRandom.urlsafe_base64(16)
       return code unless ShortenedURL.exists?(short_url: code)
     end
   end
end
