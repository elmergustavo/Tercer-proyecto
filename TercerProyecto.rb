require 'rubygems'



require 'terminal-table'



def limpiar_pantalla

    system('clear')

end

def novalido

    puts "LA OPCION INGRESADA NO EXISTE"

    #Limpiar pantalla y una pausa

    gets()

    limpiar_pantalla

end

def ingreso_de_datos()
  puts "\n"
  puts "+++++INGRESO DE DATOS+++++"
  puts "\n"
  puts "Ingrese los Numeros a Ordenar: "
  n = gets.chomp
  limpiar_pantalla
end

def ordenar_todos_los_datos()
  puts "\n"
  puts "+++++ORDENANR TODOS LOS DATOS+++++"
  puts "\n"
  puts "Ingrese los Elementos a Ordenar: "
  a = gets.chomp
  limpiar_pantalla
end

def ordenar_paso_a_paso()

    begin

      tabla = Terminal::Table.new do |t|


        t.title = "ORDENAR PASO A PASO "
        #Menu de ordenar paso a paso

        t.headings = ([

          ['\t¿En Cual Estructura desea Ordenar?'],

         ["1) Pila"],

         ["2) Cola"],

         ["3) Lista"],

         ["4) Salir"],

         ["Seleccione una opcion: "],

        ])

        #uso de case para crear el menu

      end

      puts tabla

      opciones = gets.chomp

        limpiar_pantalla

        case opciones

        when '1'
            puts "\n"
            puts"***Estructura Pila***"
            puts"\n"

            #Limpiar pantalla y una pausa

            gets()

            limpiar_pantalla

        when '2'
          puts "\n"
          puts"***Estructura Cola***"
          puts"\n"

            #Limpiar pantalla y una pausa

            gets()

            limpiar_pantalla

        when '3'

          puts "\n"
          puts"***Estructura Lista***"
          puts"\n"

            #Limpiar pantalla y una pausa

            gets()

            limpiar_pantalla

        when '4'

            puts"Progra Terminal"


        else novalido

      end

    end while (opciones!='4')

end

#Menu Principal

begin

  tabla = Terminal::Table.new do |t|

    t.title = "**********TERCER PROYECTO********** "

    t.headings = ([


     [ '1) Ingreso de Datos'],

     ['2) Ordenar todos los Datos'],

     ['3) Ordenar paso a paso'],

     ['4) Salir'],

     ['Seleccione una Opcion: '],

    ])


    #uso de case para crear el menu

  end

  puts tabla

    opciones = gets.chomp

    #uso de case para crear el menu

    case opciones
    when '1'

      limpiar_pantalla

      ingreso_de_datos()

    when '2'

      limpiar_pantalla
      ordenar_todos_los_datos()

    when '3'

        limpiar_pantalla

        ordenar_paso_a_paso()

    when '4'

        puts "Programa Terminado"

    else novalido

    end

  end while (opciones!='4')
