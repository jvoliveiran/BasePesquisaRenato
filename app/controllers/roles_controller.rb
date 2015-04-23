class RolesController < ApplicationController
  before_action :authenticate_user!

  def index
    @roles = Role.order(:name).page(params[:page]).per(10)
  end

  def show
    @role = Role.find(params[:id])
  end

  def new
    @role = Role.new
  end

  def create
    role = Role.new(role_params)

    if role.save
      redirect_to roles_path, :notice => "Cargo salvo com sucesso!"
    else
      @role = Role.new
      flash.now[:notice] = "O cargo não foi salvo! Verifique os dados e tente novamente!"
      render action: :new
    end
  end

  def edit
    @role = Role.find(params[:id])
  end

  def update
    role = Role.find(params[:id])

    if role.update(role_params)
      redirect_to role, :notice => "Cargo Atualizado com sucesso!"
    end
  end

  def destroy
    role = Role.find(params[:id])

    if role.destroy
      redirect_to roles_path, :notice => "Cargo excluído com sucesso!"
    end
  end

  private

  def role_params
    params.require(:role).permit(
        :name
    )
  end
end
