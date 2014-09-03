class Student < ActiveRecord::Base
  validates_presence_of :name

  default_scope ->{ order("id ASC") }
  scope :not_called_on_today, ->{where("called_on < ?", Date.today)}

  def self.pick_student
    # This assumes the not_called_on_today is a named scope, defined elsewhere in the class
    possible_students = Student.not_called_on_today.all
    possible_students.sample # Gives us a random student from the list
  end
end
