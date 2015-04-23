class LessonsController < ApplicationController
  before_action :authenticate_user!

  def index
    @lessons = Lesson.order(:name).page(params[:page]).per(10)
  end

  def show
    @lesson = Lesson.find(params[:id])
  end

  def new
    @lesson = Lesson.new
  end

  def create
    @lesson = Lesson.new(lesson_params)

    if @lesson.save
      redirect_to lessons_path, :notice => "Curso criado com sucesso!"
    else
      @lesson = Lesson.new
      flash.now[:error] = "O curso não foi salvo! Verifique os dados e tente novamente!"
      render action: :new
    end
  end

  def edit
    @lesson = Lesson.find(params[:id])
  end

  def update
    @lesson = Lesson.find(params[:id])

    if @lesson.update(lesson_params)
      redirect_to lesson_path(params[:id]), :notice => "Curso Atualizado com sucesso!"
    end
  end

  def destroy
    @lesson = Lesson.find(params[:id])
    if @lesson.destroy
      redirect_to lessons_path, :notice => "Curso removido com sucesso!"
    end
  end

  private

  def lesson_params
    params.require(:lesson).permit(
        :name
    )
  end

end
