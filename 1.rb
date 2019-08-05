class Table
  attr_accessor :mesa, :recaudaciones

  def initialize(mesa, *recaudaciones)
    @mesa = mesa
    @recaudaciones = recaudaciones.map(&:to_i)
  end

  def mayor
    @recaudaciones.max
  end

  def dia
    @recaudaciones.index(@recaudaciones.max)+1
  end

  def promedio
    @recaudaciones.sum / @recaudaciones.size.to_f
  end
end

arreglo = []
data = []
File.open('casino.txt', 'r') {|file| data = file.readlines}
data.each do |mesa|
  ls = mesa.split(', ')
  table = Table.new(*ls)
  arreglo << table
  puts "la mesa #{table.mesa} el dia #{table.dia} con valor #{table.mayor}"
end

total = arreglo.map(&:promedio)

print "promedio total #{total.sum / total.size.to_f} "
