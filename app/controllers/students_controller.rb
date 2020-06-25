class StudentsController < ApplicationController
  before_action :current_student, only: [:show, :update, :edit]

  def index
    @students = Student.all
  end

  def show
  end

  def new
    @instructors = Instructor.all
    @student = Student.new
  end

  def create
    student = Student.new(student_params)
    # redirect_to "/instructors/#{student_params[:instructor_id]}"
    if student.valid?
      student.save
      redirect_to "/instructors/#{student_params[:instructor_id]}"
    else
      flash[:errors] = student.errors.full_messages
      redirect_to new_student_path
    end
  end

  def edit
    @instructors = Instructor.all
  end

  def update 
    @student.update(student_params)
    redirect_to student_path
    # redirect_to edit_student_path
    # if @student.valid?
    #   @student.save
    #   redirect_to @student
    # else
    #   # flash[:errors] = @student.errors.full_messages
    #   redirect_to edit_student_path
    # end
  end
  
  private
  def current_student
    @student = Student.find(params[:id])
  end

  def student_params
    params.require(:student).permit(:name, :major, :age, :instructor_id)
  end
end
