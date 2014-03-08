class ServantsController < ApplicationController
  before_action :authenticate_user!

  def index
    @servants = Servant.order(:name).page(params[:page]).per(10)
  end

  def show
    @servant = Servant.find(params[:id])
    @role_servants = @servant.role_servants
    @discipline_servants = @servant.discipline_servants
  end

  def new
    @servant = Servant.new
    @roles = Role.order(:name).all
    @disciplines = Discipline.order(:name).all
  end

  def create
    servant = Servant.new(servant_params)
    if servant.save
      redirect_to servants_path, :notice => "Servidor cadastrado com sucesso!"
    else
      @servant = Servant.new
      @roles = Role.order(:name).all
      @disciplines = Discipline.order(:name).al
      flash.now[:notice] = "O servidor não foi salvo! Verifique os dados e tente novamente!"
      render action: :new
    end
  end

  def edit
    @servant = Servant.find(params[:id])
    @roles = Role.order(:name).all
    @disciplines = Discipline.order(:name).all
  end

  def update
    @servant = Servant.find(params[:id])

    if @servant.update(servant_params)
      redirect_to @servant, :notice => "Servidor atualizado"
    else
      flash.now[:alert] = "Erro na atualização dos dados! Tente novamente!"
      render action: :index
    end
  end

  def destroy
    servant = Servant.find(params[:id])
    if servant.destroy
      redirect_to servants_path, :notice => "O servidor foi excluído com sucesso!"
    end
  end

  private

  def servant_params
    params.require(:servant).permit(
        :name,
        :year_born,
        :place_of_birth,
        :civil_state,
        :year_in,
        :year_out,
        :obs,
        :role_ids => [],
        :discipline_ids => []
    )
  end
end
