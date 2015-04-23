class DisciplinesController < ApplicationController
  before_action :authenticate_user!

  def index
    @disciplines = Discipline.order(:name).page(params[:page]).per(10)
  end

  def new
    @discipline = Discipline.new
  end

  def create
    discipline = Discipline.new(discipline_params)

    if discipline.save
      redirect_to disciplines_path, :notice => "Disciplina Salva com Sucesso!"
    else
      @discipline = Discipline.new
      flash.now[:error] = "A Disciplina não foi salva! Verifique os dados e tente novamente!"
      render action: :new
    end
  end

  def show
    @discipline = Discipline.find(params[:id])
  end

  def edit
    @discipline = Discipline.find(params[:id])
  end

  def update
    @discipline = Discipline.find(params[:id])

    if @discipline.update(discipline_params)
      redirect_to discipline_path(params[:id]), :notice => "Disciplina atualizada com sucesso!"
    end
  end

  def destroy
    @discipline = Discipline.find(params[:id])
    if @discipline.destroy
      redirect_to disciplines_path, :notice => "Disciplina excluída com sucesso!"
    end
  end

  def discipline_params
    params.require(:discipline).permit(
        :name
    )
  end
end
