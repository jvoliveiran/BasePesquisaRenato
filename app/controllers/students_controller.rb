class StudentsController < ApplicationController
  before_action :authenticate_user!
  #before_action :set_profession, only: [ :student_params ]

  def index
    @students = Student.all.order(:name)
  end

  def show
    @student = Student.find(params[:id])
  end

  def new
    @student = Student.new
    @professions = Profession.all.order(:name)
  end

  def create
    @student = Student.new(student_params)

    if @student.save
      redirect_to students_path, :notice => "Aluno salvo com sucesso"
    else
      render action: :new
    end

  end

  def edit

  end

  def update

  end

  def destroy

  end

  def student_params
    params.require(:student).permit(
        :name,
        :responsible,
        :age,
        :neighborhood,
        :street,
        :profession_id
    )
  end

  def set_profession

  end

end
