require 'rubygems'
require 'terminal-table'

def limpiar_pantalla
    system('clear')
end
#INSERTA PILA
def insertar_pila(cadena,pila)
  cadena.each do |x|
    nodo = {
      valor: x,
      posicion: pila[:size], 
      siguiente: nil,
    }
    if pila[:vacia]
      pila[:tope] = nodo
      pila[:size]+=1
      pila[:vacia]=false
    else
      tope = pila[:tope]
      nodo[:siguiente] = tope
      pila[:tope] = nodo
      pila[:size]+=1
    end
  end
  puts pila
  gets
end
#INSERTAR COLA
def insertar_cola(cadena,cola)
  cadena.each do |x|
    nodo = {
      valor: x,
      posicion: cola[:size], 
      siguiente: nil,
    }
    if cola[:vacia]
      cola[:tope] = nodo
      cola[:final] = nodo
      cola[:size]+=1
      cola[:vacia]=false
    else
      final = cola[:final]
      final[:siguiente] = nodo
      cola[:final] = nodo
      cola[:size] +=1 
    end
  end
  puts cola
  gets
end
#INSERTAR LISTA
def insertar_lista(cadena,lista)
  cadena.each do |x|
    nodo = {
      valor: x,
      posicion: lista[:size], 
      siguiente: nil,
    }
    if lista[:vacia]
      lista[:tope] = nodo
      lista[:final] = nodo
      lista[:size]+=1
      lista[:vacia]=false
    else
      tope = lista[:tope]
      nodo[:siguiente] = tope
      lista[:tope] = nodo
      lista[:size]+=1
    end
  end
  puts lista
  gets
end

#INGRESE DE DATOS
def ingreso_de_datos(cola,pila,lista)
  puts 'Ingresar datos'
  cadena = gets.chomp
  cadena1 = cadena.split(',')
  insertar_pila(cadena1,pila)
  insertar_cola(cadena1,cola)
  insertar_lista(cadena1,lista)

  gets
end
#ORDENAR TODOS LOS DATOS
def ordenar_todos_los_datos()
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
  case opc
  when '1'
  when '2'
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
end while opc!='4' #fin begin
end

#Menu Principal
cola = {
  tope: nil,
  final: nil,
  size: 0,
  vacia: true
}
pila = {
  tope: nil,
  size: 0,
  vacia: true
}
lista = {
  tope: nil,
  final: nil,
  size: 0,
  vacia: true
}

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
      ingreso_de_datos(cola,pila,lista)
    when '2' 
      ordenar_todos_los_datos()
    when '3'
        ordenar_paso_a_paso()
    when '4'
        puts "Programa Terminado"
    else 
      puts 'Esta opcion no es valida vuelva a intentar'
      gets
    end
  end while (opciones!='4')
