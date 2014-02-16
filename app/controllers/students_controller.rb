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
      @student = Student.new
      @professions = Profession.all.order(:name)
      flash.now[:error] = "O estudante não foi salva! Verifique os dados e tente novamente!"
      render action: :new
    end

  end

  def edit
    @student = Student.find(params[:id])
    @professions = Profession.all.order(:name)
  end

  def update
    @student = Student.find(params[:id])

    if @student.update(student_params)
      redirect_to student_path(params[:id]), :notice => "Estudante atualizado!"
    else
      flash.now[:alert] = "Erro na atualização dos dados! Tente novamente!"
      render action: :index
    end
  end

  def destroy
    @student = Student.find(params[:id])

    if @student.destroy
      redirect_to students_path, :notice => "Aluno excluído com sucesso!"
    end
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
