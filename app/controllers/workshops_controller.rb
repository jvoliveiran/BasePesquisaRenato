class WorkshopsController < ApplicationController
  before_action :authenticate_user!

  def index
    @workshops = Workshop.order(:name).page(params[:page]).per(10)
  end

  def show
    @workshop = Workshop.find(params[:id])
  end

  def new
    @workshop = Workshop.new
  end

  def create
    workshop = Workshop.new(workshop_params)

    if workshop.save
      redirect_to workshops_path, :notice => "Oficina Salva com Sucesso!"
    else
      @workshop = Workshop.new
      flash.now[:error] = "A oficina não foi salva! Verifique os dados e tente novamente!"
      render action: :new
    end
  end

  def edit
    @workshop = Workshop.find(params[:id])
  end

  def update
    @workshop = Workshop.find(params[:id])

    if @workshop.update(workshop_params)
      redirect_to workshop_path(params[:id]), :notice => "Oficina Atualizada com Sucesso!"
    end
  end

  def destroy
    @workshop = Workshop.find(params[:id])

    if @workshop.destroy
      redirect_to workshops_path, :notice => "Oficina removida com sucesso!"
    end
  end

  private

  def workshop_params
    params.require(:workshop).permit(
      :name
    )
  end

end
