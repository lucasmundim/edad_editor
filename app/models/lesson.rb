class Lesson
  include Mongoid::Document
  field :title, :type => String
  field :course, :type => String
  field :course_code, :type => String
  field :professor, :type => String
end
