class YearsController < ApplicationController
  before_action :authenticate_user!

  def index
    @years = Year.order(:name).page(params[:page]).per(10)
  end

  def show
    @year = Year.find(params[:id])
  end

  def new
    @year = Year.new
  end

  def create
    year = Year.new(year_params)

    if year.save
      redirect_to years_path, :notice => "Ano salvo com sucesso!"
    else
      @year = Year.new
      flash.now[:notice] = "O ano não foi salvo! Verifique os dados e tente novamente!"
      render action: :new
    end
  end

  def edit
    @year = Year.find(params[:id])
  end

  def update
    year = Year.find(params[:id])

    if year.update(year_params)
      redirect_to year, :notice => "Ano Atualizado com sucesso!"
    end
  end

  def destroy
    year = Year.find(params[:id])

    if year.destroy
      redirect_to years_path, :notice => "Ano excluído com sucesso!"
    end
  end

  private

  def year_params
    params.require(:year).permit(
        :name
    )
  end

end
