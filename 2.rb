require 'date'

class Course

  def initialize(nombre, fechainicio, fechafinal)
    @nombre = nombre
    @fechainicio = Date.parse(fechainicio)
    @fechafinal = Date.parse(fechafinal)
  end

  def curso_antes(fecha = Date.today)
   puts "el curso #{@nombre} inicia el #{@fechainicio}" if @fechainicio < fecha

  end

  def curso_despues(fecha = Date.today)
    puts "el curso #{@nombre} finaliza el #{@fechafinal}" if @fechafinal > fecha

  end

end

course = []
data = []
File.open('curso.txt', 'r') {|file| data = file.readlines}
data.each do |lines|
  nombre, fechainicio, fechafinal = lines.split(', ')
  course << Course.new(nombre, fechainicio, fechafinal)
end

course.each do |course|
  course.curso_antes(Date.today)
  course.curso_despues(Date.today)
  end
