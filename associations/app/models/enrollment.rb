class Enrollment < ActiveRecord::Base
  belongs_to :courses,
  class_name: :Course,
  primary_key: :id,
  foreign_key: :course_id

  belongs_to :users,
  class_name: :User,
  primary_key: :id,
  foreign_key: :student_id
end
