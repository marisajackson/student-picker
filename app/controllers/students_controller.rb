class StudentsController < ApplicationController
  def chosen
    @chosen_one = Student.pick_student
    if @chosen_one
      render :index
    else
      redirect_to students_path, notice: "There are currently no students."
    end
  end

  def create
    @student = Student.new(student_params)
    if @student.save
      redirect_to students_path, notice: "#{@student.name} has been added to the students."
    else
      flash.now[:alert] = "Student could not be added."
      render :index
    end
  end

  def index
    @students = Student.all
  end

  private

     def student_params
      params.require(:student).permit(:name)
    end
end