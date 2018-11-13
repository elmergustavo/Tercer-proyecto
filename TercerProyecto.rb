require 'rubygems'
require 'terminal-table'
require_relative 'ordenarpila'

def limpiar_pantalla
    system('clear')
end
#Ingresar datos
def ingreso_de_datos(array,lol)
  if lol[:aux]
    print 'Ingrese los numeros: '
    cadena = gets.chomp
    cadena1 = cadena.split(',')
    cadena1.each do |x|
    array.push(x)
  end
  size=array.size
  for i in 0..size-1
    array[i] = array[i].to_i
  end

  else
    array=[]
    print 'Ingrese los numeros: '
    cadena = gets.chomp
    cadena1 = cadena.split(',')
    cadena1.each do |x|
    array.push(x)
  end
  size=array.size
  for i in 0..size-1
    array[i] = array[i].to_i
  end
  lol[:aux] = true
  end
  gets
end
#ORDENAR TODOS LOS DATOS
def ordenar_todos_los_datos(pila,lol,array=[])
  limpiar_pantalla
  begin
  tabla = Terminal::Table.new do |a|
  a.title= 'Ordenar todos los datos'
  a.headings = [{value:'No.', alignment: :center},{value:'Estructura', alignment: :center}]

  a.add_row([{value:'1', alignment: :center},'Cola.' ])
  a.add_row([{value:'2', alignment: :center},'Pila.'])
  a.add_row([{value:'3', alignment: :center},'Lista.'])
  a.add_row([{value:'4', alignment: :center},'Salir.' ])
end 
  puts tabla
  puts "Ingrese una estructura: " 
  opc = gets.chomp
  limpiar_pantalla()
  lol[:aux]=false
  case opc
  when '1'
  when '2'
    pila.ordenar_pila(array)
  when '3'
  else
    'La opcion no es valida vuelva a ingresar'
  end
end while opc!='4' #fin begin
end


#ORDENAR PASO A PASO
def ordenar_paso_a_paso()
limpiar_pantalla
  begin
  tabla = Terminal::Table.new do |a|
  a.title= 'Ordenar paso a paso'
  a.headings = [{value:'No.', alignment: :center},{value:'Estructura', alignment: :center}]

  a.add_row([{value:'1', alignment: :center},'Cola.' ])
  a.add_row([{value:'2', alignment: :center},'Pila.'])
  a.add_row([{value:'3', alignment: :center},'Lista.'])
  a.add_row([{value:'4', alignment: :center},'Salir.' ])
end 
  puts tabla
  puts "Ingrese una estructura: " 
  opc = gets.chomp
  limpiar_pantalla()
  case opc
  when '1'
  when '2'
  when '3'
  else
    'La opcion no es valida vuelva a ingresar'
  end
end while opc!='4' 
end

#Menu Principal

lol ={
  aux: true
}
pila = Pila.new
array =[]
begin
  limpiar_pantalla
  tabla = Terminal::Table.new do |a|
  a.title= 'Lista De Valores Enteros'
  a.headings = ['No.',{value:'Opciones', alignment: :center}]

  a.add_row([{value:'1', alignment: :center},'Ingreso de Datos.' ])
  a.add_row([{value:'2', alignment: :center},'Odernar todos los datos.'])
  a.add_row([{value:'3', alignment: :center},'Ordenar paso a paso.'])
  a.add_row([{value:'4', alignment: :center},'Salir.' ])
end
    #uso de case para crear el menu

  puts tabla
  print 'Ingrese una opcion: '
    opciones = gets.chomp

    #uso de case para crear el menu
    limpiar_pantalla()

    case opciones
    when '1'
      ingreso_de_datos(array,lol)
    when '2' 
      ordenar_todos_los_datos(pila,lol,array)
    when '3'
        ordenar_paso_a_paso()
    when '4'
        puts "Programa Terminado"
    else 
      puts 'Esta opcion no es valida vuelva a intentar'
      gets
    end
  end while (opciones!='4')
  pila.mostrar_pila
