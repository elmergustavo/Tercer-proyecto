require 'rubygems'
require 'terminal-table'
require_relative 'ordenarpila' #mandamos a llamar la clase pila
require_relative 'ordenarcola' #mandamos a llamar la clase Cola
require_relative 'ordenarlista'#mandamos a llamar la clase Lista

def limpiar_pantalla
    system('clear')
end

#Ingresar datos almacenado en un array
def ingreso_de_datos(array=[])
    print 'Ingrese los numeros: '
    cadena = gets.chomp
    cadena1 = cadena.split(',')
    cadena1.each do |x|       #almacenamos los valor en arreglo ignorando las comas
    array.push(x)
  end
  size=array.size     #los elemento los convertimos en un numero entero
  for i in 0..size-1
    array[i] = array[i].to_i
  end

end
#ORDENAR TODOS LOS DATOS
#esqume del contenido
def ordenar_todos_los_datos(pila,array=[],cola,lista)

  begin
    limpiar_pantalla
  tabla = Terminal::Table.new do |a|
  a.title= 'Ordenar todos los datos'
  a.headings = [{value:'No.', alignment: :center},{value:'Estructura', alignment: :center}]

  a.add_row([{value:'1', alignment: :center},'Cola.' ])
  a.add_row([{value:'2', alignment: :center},'Pila.'])
  a.add_row([{value:'3', alignment: :center},'Lista.'])
  a.add_row([{value:'4', alignment: :center},'Salir.' ])
end
  puts tabla
  print "Ingrese una estructura: " 
  opc = gets.chomp
  limpiar_pantalla()
  case opc
  when '1' #opc 1 ordenamiento por cola
    if array.size!=0
    array_antes=array.join(',')
    cola.ordenar_cola(array)
    cola.mostrar_tabla(array_antes)
    gets
    else
      puts 'Ingrese nuevos datos para ordenar' #luego de aver agregado una estructura y de aver escogido la opcion a llamar se reinicia y tiene que volver a insetar valores para escoger otro metodo de ordenar 
      gets
    end
  when '2' #opc 2 ordenamiento por pila
    if array.size!=0
    array_antes=array.join(' => ')
    pila.ordenar_pila(array)
    pila.mostrar_tabla(array_antes)
    gets
    else
      puts 'Ingrese nuevos datos para ordenar' #luego de aver agregado una estructura y de aver escogido la opcion a llamar se reinicia y tiene que volver a insetar valores para escoger otro metodo de ordenar 
      gets
    end
  when '3' #opc 3 ordenamiento por lista
    if array.size!=0
    array_antes=array.join(' => ')
    lista.ordenar_lista(array)
    lista.mostrar_tabla(array_antes)
    gets
    else
      puts 'Ingrese nuevos datos para ordenar' #luego de aver agregado una estructura y de aver escogido la opcion a llamar se reinicia y tiene que volver a insetar valores para escoger otro metodo de ordenar 
      gets
    end
  else
    'La opcion no es valida vuelva a ingresar'
  end
end while opc!='4' #fin begin
end #fin de la funcion


#ORDENAR PASO A PASO
def ordenar_paso_a_paso(pila,array=[],cola,lista)
  begin
    limpiar_pantalla
  tabla = Terminal::Table.new do |a| #muestra el menu en una tabla
  a.title= 'Ordenar paso a paso'
  a.headings = [{value:'No.', alignment: :center},{value:'Estructura', alignment: :center}]

  a.add_row([{value:'1', alignment: :center},'Cola.' ])
  a.add_row([{value:'2', alignment: :center},'Pila.'])
  a.add_row([{value:'3', alignment: :center},'Lista.'])
  a.add_row([{value:'4', alignment: :center},'Salir.' ])
end
  puts tabla
  print "Ingrese una estructura: "
  opc = gets.chomp
  limpiar_pantalla()
  case opc
  when '1' #opc 1 ordenamiento por cola paso a paso
    if array.size!=0
      array_antes=array.join(',')
      cola.ordenar_cola(array)
      cola.mostrar_paso(array_antes)
      gets
    else
    puts 'Ingrese nuevos datos para ordenar' #luego de aver agregado una estructura y de aver escogido la opcion a llamar se reinicia y tiene que volver a insetar valores para escoger otro metodo de ordenar 
    gets
    end
  when '2' #opc 2 ordenamiento por pila paso a paso
    if array.size!=0
      array_antes=array.join(',')
      pila.ordenar_pila(array)
      pila.mostrar_pasos(array_antes)
      gets
    else
    puts 'Ingrese nuevos datos para ordenar' #luego de aver agregado una estructura y de aver escogido la opcion a llamar se reinicia y tiene que volver a insetar valores para escoger otro metodo de ordenar 
    gets
    end
  when '3' #opc 3 ordenamiento por lista paso a paso
    if array.size!=0
      array_antes=array.join(',')
      lista.ordenar_lista(array)
      lista.mostrar_paso(array_antes)
      gets
    else
    puts 'Ingrese nuevos datos para ordenar' #luego de aver agregado una estructura y de aver escogido la opcion a llamar se reinicia y tiene que volver a insetar valores para escoger otro metodo de ordenar 
    gets
    end
  else
    'La opcion no es valida vuelva a ingresar'
    gets
  end
end while opc!='4'
end

#Menu Principal


pila = Pila.new
cola = Cola.new
lista = Lista.new
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
      ingreso_de_datos(array) #manda a llamar la funcion 
    when '2'
      ordenar_todos_los_datos(pila,array,cola,lista) #manda a llamar la funcion 
    when '3'
        ordenar_paso_a_paso(pila,array,cola,lista) #manda a llamar la funcion 
    when '4'
        puts "Programa Terminado"
    else
      puts 'Esta opcion no es valida vuelva a intentar'
      gets
    end
  end while (opciones!='4')

