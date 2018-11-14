require 'terminal-table'
  tabla = Terminal::Table.new do |a|
  a.title= 'Ordenar todos los datos'
  a.headings = [{value:'No.', alignment: :center}]

  a.add_row(["123" ])
  a.add_row(['Pila.'])
  a.add_row(['Lista.'])
  a.add_row(['Salir.' ])
end
puts tabla
