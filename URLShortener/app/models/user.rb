class User < ActiveRecord::Base
  validates :email, presence: true, uniqueness: true

  has_many :submitted_urls,
  class_name: :ShortenedURL,
  primary_key: :id,
  foreign_key: :user_id

  has_many :visits,
  class_name: :Visit,
  primary_key: :id,
  foreign_key: :user_id

  has_many :visited_urls,
  through: :visits,
  source: :visit_urls


end


# has_many :enrolled_courses,
# through: :enrollments,
# source: :courses
