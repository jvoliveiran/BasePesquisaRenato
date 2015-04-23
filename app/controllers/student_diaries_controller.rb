class StudentDiariesController < ApplicationController
  before_action :authenticate_user!

  def edit
    @student_diary = StudentDiary.find(params[:id])
    @observations = BookObservation.order(:name).all
  end

  def update
    @observations = BookObservation.order(:name).all
    @student_diary = StudentDiary.find(params[:id])
    if @student_diary.update(student_diary_params)
      @diary = @student_diary.diary
      redirect_to diaries_path, :notice => "Diario atualizado"
    else
      flash.now[:alert] = "Erro na atualização dos dados! Tente novamente!"
      render action: :edit
    end
  end

  def destroy
    student_diary = StudentDiary.find(params[:id])
    @diary = student_diary.diary
    if student_diary.destroy
      redirect_to @diary, :notice => "Estudante removido do diário"
    end
  end

  private

  def student_diary_params
    params.require(:student_diary).permit(
        :value_amount_f,
        :value_amount_c,
        :average,
        :behavior,
        :book_observation_id,
        :diary_id,
        :student_id,
        :application,
        :absence
    )
  end

end
