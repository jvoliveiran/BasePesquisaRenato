class BookObservationsController < ApplicationController
  before_action :authenticate_user!

  def index
    @observations = BookObservation.order(:name).page(params[:page]).per(10)
  end

  def show
    @observation = BookObservation.find(params[:id])
  end

  def new
    @observation = BookObservation.new
  end

  def create
    observation = BookObservation.new(observation_params)

    if observation.save
      redirect_to book_observations_path, :notice => "Observação cadastrada com sucesso!"
    else
      @observation = BookObservation.new
      flash.now[:notice] = "A observação não foi salva! Verifique os dados e tente novamente!"
      render action: :new
    end
  end

  def edit
    @observation = BookObservation.find(params[:id])
  end

  def update
    observation = BookObservation.find(params[:id])

    if observation.update(observation_params)
      redirect_to observation, :notice => "Observação atualizada com sucesso!"
    end
  end

  def destroy
    observation = BookObservation.find(params[:id])
    if observation.destroy
      redirect_to book_observations_path, :notice => "Observação excluída com sucesso!"
    end
  end

  private

  def observation_params
    params.require(:book_observation).permit(
        :name
    )
  end
end
