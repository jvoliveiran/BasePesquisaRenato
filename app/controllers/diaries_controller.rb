class DiariesController < ApplicationController
  before_action :authenticate_user!

  def index
    @diaries = Diary.order(:year_id).page(params[:page]).per(10)
  end

  def show
    @diary = Diary.find(params[:id])
    @student_diaries = @diary.student_diaries
  end

  def new
    @diary = Diary.new
    @students = Student.order(:name).all
    @years = Year.order(:name).all
    @disciplines = Discipline.order(:name).all
    @servants = all_teacher_servant
  end

  def create
    diary = Diary.new(diary_params)
    if diary.save
      redirect_to diaries_path, :notice => "Diário cadastrado com sucesso!"
    else
      @diary = Diary.new
      @students = Student.order(:name).all
      @years = Year.order(:name).all
      @disciplines = Discipline.order(:name).all
      @servants = all_teacher_servant
    end
  end

  def edit
    @diary = Diary.find(params[:id])
    @students = Student.order(:name).all
    @years = Year.order(:name).all
    @disciplines = Discipline.order(:name).all
    @servants = all_teacher_servant
  end

  def update
    @diary = Diary.find(params[:id])

    if @diary.update(diary_params)
      redirect_to @diary, :notice => "Diario atualizado"
    else
      flash.now[:alert] = "Erro na atualização dos dados! Tente novamente!"
      render action: :index
    end
  end

  def destroy
    diary = Diary.find(params[:id])

    students = diary.student_diaries
    if diary.destroy
      students.each do |s|
        s.destroy
      end
      redirect_to diaries_path, :notice => "O diário foi excluído com sucesso!"
    end
  end

  private

  def diary_params
    params.require(:diary).permit(
      :year_id,
      :discipline_id,
      :servant_id,
      :student_ids => []
    )
  end

  def all_teacher_servant
    #Buscar servidores professores
    teacher_role = Role.where(name: "Professor")
    servants = Servant.order(:name).all

    servants.each do |serv|
      if !serv.disciplines.include?(teacher_role)
        servants.delete(serv)
      end
    end

    servants
  end
end
