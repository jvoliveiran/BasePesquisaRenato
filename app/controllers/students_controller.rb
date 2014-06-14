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
      flash.now[:error] = "O estudante não foi salvo! Verifique os dados e tente novamente!"
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

  #Métodos para Relatórios

  def search_workshops
    @workshops = Workshop.all.order(:name)

    if(params[:idworkshop])
      @students = Student.searchStudentsInWorkshop(params[:idworkshop])
      @valorPesquisa = Workshop.find(params[:idworkshop]).name
    else
      @students
      @valorPesquisa
    end
  end

  def search_years
    @years = Year.all.order(:name)

    if(params[:idyear])
      @students = Student.searchStudentsInYear(params[:idyear])
      @valorPesquisa = Year.find(params[:idyear]).name
    else
      @students
      @valorPesquisa
    end

  end

  def search_observations
    @observations = BookObservation.all.order(:name)

    if(params[:idobservation])
      @students = Student.searchStudentsInObservation(params[:idobservation])
      @valorPesquisa = BookObservation.find(params[:idobservation]).name
    else
      @students
      @valorPesquisa
    end
  end

  def search_general

    @observations = BookObservation.all.order(:name)
    @years = Year.all.order(:name)
    @workshops = Workshop.all.order(:name)
    @books = Book.all.order(:yearbook)

    if(params[:nomelogradouro] || params[:idobservation] || params[:idyear] || params[:nometurno] || params[:idworkshop] || params[:idbook])
      @students = Student.searchGeneral(params[:nomelogradouro],params[:idobservation],params[:idyear],params[:nometurno],params[:idworkshop], params[:idbook])
      @nomelogradouro = params[:nomelogradouro]
      @idobservation = params[:idobservation]
      @idyear = params[:idyear]
      @nometurno = params[:nometurno]
      @idworkshop = params[:idworkshop]
      @idbook = params[:idbook]
    else
      @students
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

end
