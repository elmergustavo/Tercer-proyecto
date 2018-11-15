require 'terminal-table'
def limpiar_pantalla
  system'clear'
end
conta=0
def imcrementar(conta)
  tabla = Terminal::Table.new do |a|
  a.title= 'Ordenar todos los datos'
  a.headings = [{value:'No.', alignment: :center}]
  for i in 1..conta
  a.add_row([i])
  end
end
return tabla
end

conta=0
loop do
  limpiar_pantalla
  print 'ingrese 1 para aumentar 2 para salir: '
  num = gets.chomp
    if num=='1'
      puts imcrementar(conta+=1)
      gets
    else
      break
    end
end
