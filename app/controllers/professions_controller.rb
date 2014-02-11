class ProfessionsController < ApplicationController
  before_action :authenticate_user!

  def index
    @professions = Profession.order(:name).page(params[:page]).per(10)
  end

  def new
    @profession = Profession.new
  end

  def create
     profession = Profession.new(profession_params)

     if profession.save
       redirect_to professions_path, :notice => "Profissão Salva com Sucesso!"
     else
       render action: :new
     end
  end

  def show
    @profession = Profession.find(params[:id])
  end

  def edit
    @profession = Profession.find(params[:id])
  end

  def update
    @profession = Profession.find(params[:id])

    if @profession.update(profession_params)
      redirect_to profession_path(params[:id]), :notice => "Profissão Atualizada com Sucesso!"
    end
  end

  def destroy

  end

  def profession_params
    params.require(:profession).permit(
        :name
    )
  end
end
