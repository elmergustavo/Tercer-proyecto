require 'rubygems'
require 'terminal-table'
require_relative 'ordenarpila'
require_relative 'ordenarcola'
require_relative 'ordenarlista'

def limpiar_pantalla
    system('clear')
end
#Ingresar datos
def obtener_rendimiento(pila,cola,lista)
  array=[]
  pila_1=pila.pasos_pila()
  cola_1=cola.pasos_cola()
  lista_1=lista.pasos_lista()
  if pila_1>cola_1 && pila_1>lista_1
    rendi_pila= 100
    rendi_cola = (pila_1/(cola_1*1.00))*100
    rendi_lista = (pila_1/(lista_1*1.00))*100
    array.push(rendi_pila)
    array.push(rendi_cola)
    array.push(rendi_lista)
  elsif cola_1>pila_1 && cola_1>lista_1
    rendi_pila= (cola_1/(pila_1*1.00))*100
    rendi_cola = 100
    rendi_lista = (cola_1/(lista_1*1.00))*100
    array.push(rendi_pila)
    array.push(rendi_cola)
    array.push(rendi_lista)
  elsif lista_1>cola_1 && lista_1>pila_1
     rendi_pila= (lista_1/(pila_1*1.00))*100
    rendi_cola = (lista_1/(cola_1*1.00))*100
    rendi_lista = 100
    array.push(rendi_pila)
    array.push(rendi_cola)
    array.push(rendi_lista)
  end
  return array
end
def ingreso_de_datos(array=[],ya_ordeno,pila,cola,lista)
  if ya_ordeno[:ordenar]
    array.clear
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
  ya_ordeno[:ordenar]=false
    pila.limpiar_pila()
    cola.limpiar_cola()
    lista.limpiar_lista()
else
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
  gets
end
end
#ORDENAR TODOS LOS DATOS
def ordenar_todos_los_datos(pila,array=[],cola,lista,ya_ordeno)
  if ya_ordeno[:ordenar]
    array_antes=array.join(',')
    array_rendi = obtener_rendimiento(pila,cola,lista)#obtener array con el rendimiento
    tabla = Terminal::Table.new do |a|
  a.title= "Ordenar todos los datos: #{array_antes} "
  a.headings = [{value:'Pasos', alignment: :center},{value:'Estructura', alignment: :center},{value:'Rendimiento %', alignment: :center},{value:'Ordenada', alignment: :center}]
  a.add_row([pila.pasos_pila(),{value:'pila', alignment: :center},{value:array_rendi[0], alignment: :center},pila.mostrar_pila()])
  a.add_row([cola.pasos_cola(),{value:'cola', alignment: :center},{value:array_rendi[1], alignment: :center},cola.mostrar_cola()])
  a.add_row([lista.pasos_lista(),{value:'lista', alignment: :center},{value:array_rendi[2], alignment: :center},lista.mostrar_lista()])
  end
  puts tabla
  gets
else
    array_antes=array.join(',')
    pila.ordenar_pila(array)
    cola.ordenar_cola(array)
    lista.ordenar_lista(array)
    array_rendi = obtener_rendimiento(pila,cola,lista)#obtener array con el rendimiento
  tabla = Terminal::Table.new do |a|
  a.title= "Ordenar todos los datos: #{array_antes} "
  a.headings = [{value:'Pasos', alignment: :center},{value:'Estructura', alignment: :center},{value:'Rendimiento %', alignment: :center},{value:'Ordenada', alignment: :center}]
  a.add_row([pila.pasos_pila(),{value:'pila', alignment: :center},{value:array_rendi[0], alignment: :center},pila.mostrar_pila()])
  a.add_row([cola.pasos_cola(),{value:'cola', alignment: :center},{value:array_rendi[1], alignment: :center},cola.mostrar_cola()])
  a.add_row([lista.pasos_lista(),{value:'lista', alignment: :center},{value:array_rendi[2], alignment: :center},lista.mostrar_lista()])
  end
  puts tabla
  ya_ordeno[:ordenar]=true
  gets
end
end



#ORDENAR PASO A PASO
def ordenar_paso_a_paso(pila,array=[],cola,lista,ya_ordeno)
  if ya_ordeno[:ordenar]
  begin
    limpiar_pantalla
  tabla = Terminal::Table.new do |a|
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
  when '1'
    if array.size!=0
      array_antes=array.join(',')
      cola.mostrar_paso(array_antes)
      gets
    else
    puts 'Ingrese nuevos datos para ordenar'
    gets
    end
  when '2'
    if array.size!=0
      array_antes=array.join(',')
      pila.mostrar_pasos(array_antes)
      gets
    else
    puts 'Ingrese nuevos datos para ordenar'
    gets
    end
  when '3'
    if array.size!=0
      array_antes=array.join(',')
      lista.mostrar_paso(array_antes)
      gets
    else
    puts 'Ingrese nuevos datos para ordenar'
    gets
    end
  else
    'La opcion no es valida vuelva a ingresar'
    gets
  end
end while opc!='4'
else
    array_antes=array.join(',')
    pila.ordenar_pila(array)
    cola.ordenar_cola(array)
    lista.ordenar_lista(array)
    ya_ordeno[:ordenar]=true
      begin
    limpiar_pantalla
  tabla = Terminal::Table.new do |a|
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
  when '1'
    if array.size!=0
      array_antes=array.join(',')
      cola.mostrar_paso(array_antes)
      gets
    else
    puts 'Ingrese nuevos datos para ordenar'
    gets
    end
  when '2'
    if array.size!=0
      array_antes=array.join(',')
      pila.mostrar_pasos(array_antes)
      gets
    else
    puts 'Ingrese nuevos datos para ordenar'
    gets
    end
  when '3'
    if array.size!=0
      array_antes=array.join(',')
      lista.mostrar_paso(array_antes)
      gets
    else
    puts 'Ingrese nuevos datos para ordenar'
    gets
    end
  else
    'La opcion no es valida vuelva a ingresar'
    gets
  end
end while opc!='4'
end
end

#Menu Principal
ya_ordeno={
    ordenar: false
}
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
      ingreso_de_datos(array,ya_ordeno,pila,cola,lista)
    when '2'
      ordenar_todos_los_datos(pila,array,cola,lista,ya_ordeno)
    when '3'
        ordenar_paso_a_paso(pila,array,cola,lista,ya_ordeno)
    when '4'
        puts "Programa Terminado"
    else
      puts 'Esta opcion no es valida vuelva a intentar'
      gets
    end
  end while (opciones!='4')

