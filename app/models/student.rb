class Student < ActiveRecord::Base
  belongs_to :profession
  has_many :student_books
  has_many :books, :through => :student_books

  has_many :student_diaries
  has_many :diaries, :through => :student_diaries
  #has_and_belongs_to_many :book_observations, join_table: :student_books

  validates_presence_of :name
  validates_uniqueness_of :name
  validates_numericality_of :age, only_integer: true

  def self.searchStudentsInWorkshop(workshop_id)
    Student.joins(:books).where(:books => { :workshop_id => workshop_id})
  end

  def self.searchStudentsInYear(year_id)
    Student.joins(books: :year).where(:years => { :id => year_id })
  end

  def self.searchStudentsInObservation(observation_id)
    Student.joins(student_books: :book_observation).where(:book_observations => {:id=>observation_id})
  end

  #parametros
  # bairro - Logradouro do Aluno
  # observation_id - Id da observação de exclusão do aluno de um livro
  # year_id - Ano de matricula do aluno do livro. Ex: 1o elementar
  # turn - Turno da turma que compoe o livro. Ex: Tarde
  # book_id - Id do livro ao qual o aluno está vinculado
  def self.searchGeneral(bairro, observation_id, year_id, turn, workshop_id, book_id)
    query = "SELECT s.*, b.* FROM students s "
    query = query + " INNER JOIN student_books sb ON s.id = sb.student_id INNER JOIN books b ON sb.book_id = b.id "

    #busca a observação caso tenha sido selecionada
    if(defined? observation_id && !observation_id.nil?)
      query = query + " INNER JOIN book_observations bo ON sb.book_observation_id = bo.id "
    end

    #busca pelo bairro
    query = query + " WHERE s.neighborhood ILIKE '%#{bairro}%' "

    #busca a observação caso tenha sido selecionada, caso não tenha sido selecionada, busca por estudantes sem observações
    if(!observation_id.nil? && observation_id != "")
      query = query + " AND sb.book_observation_id = #{observation_id} "
    else
      query = query + " AND sb.book_observation_id = null"
    end

    #busca pelo ano do livro, caso tenha sido selecionado
    if(!year_id.nil? && year_id != "")
      query = query + " AND b.year_id = #{year_id}"
    end

    #busca pelo turno do livro, caso tenha sido selecionado
    if(!turn.nil? && turn != "")
      query = query + " AND b.turn ILIKE '%#{turn}%'"
    end

    #busca pelo curso da turma
    if(!workshop_id.nil? && workshop_id != "")
      query = query + " AND b.workshop_id = #{workshop_id}"
    end

    #busca pelo livro
    if(!book_id.nil? && book_id != "")
      query = query + " AND b.id = #{book_id}"
    end

    Student.find_by_sql(query)

  end

end
