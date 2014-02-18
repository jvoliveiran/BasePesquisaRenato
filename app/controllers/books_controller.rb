class BooksController < ApplicationController
  before_action :authenticate_user!

  def index
    @books = Book.order(:yearbook).page(params[:page]).per(10)
  end

  def show
    @book = Book.find(params[:id])
    @students = @book.students
  end

  def new
    @book = Book.new
    @students = Student.order(:name).all
    @workshops = Workshop.order(:name).all
    @lessons = Lesson.order(:name).all
    @years = Year.order(:name).all
  end

  def create
    book = Book.new(book_params)

    if book.save
      redirect_to books_path, :notice => "Livro cadastrado com sucesso!"
    else
      @book = Book.new
      @students = Student.order(:name).all
      @workshops = Workshop.order(:name).all
      @lessons = Lesson.order(:name).all
      @years = Year.order(:name).all
      flash.now[:notice] = "O livro não foi salvo! Verifique os dados e tente novamente!"
      render action: :new
    end
  end

  def edit
    @book = Book.find(params[:id])
    @students = Student.order(:name).all
    @workshops = Workshop.order(:name).all
    @lessons = Lesson.order(:name).all
    @years = Year.order(:name).all
  end

  def update
    @book = Book.find(params[:id])

    if @book.update(book_params)
      redirect_to @book, :notice => "Livro atualizado"
    else
      flash.now[:alert] = "Erro na atualização dos dados! Tente novamente!"
      render action: :index
    end
  end

  def destroy
    book = Book.find(params[:id])
    if book.destroy
      redirect_to books_path, :notice => "O livro foi excluído com sucesso!"
    end
  end

  private

  def book_params
    params.require(:book).permit(
        :yearbook,
        :turn,
        :classname,
        :workshop_id,
        :lesson_id,
        :book_observation_id,
        :year_id,
        :student_ids => []
    )
  end
end
