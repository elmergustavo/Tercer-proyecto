require 'terminal-table'
def limpiar_pantalla
system('clear')
end
class Pila
        def initialize
            @pila = {
                tope: nil,
                size: 0,
                esta_vacia: true,
                imprecion: false
            }
            @pila_aux = {
                tope: nil,
                size:0,
                esta_vacia: true
            }
            @pasos=[]
            @cadena=""
        end
        #insertar los menores del valor actual en aux
        def insertar_en_aux(valor)

            nodo = {
                valor: valor,
                siguiente: nil,
            }
            if @pila_aux[:esta_vacia]
                @pila_aux[:tope]=nodo
                @pila_aux[:esta_vacia]=false
                @pila_aux[:size]+=1
            else
                tope=@pila_aux[:tope]
                nodo[:siguiente]=tope
                @pila_aux[:tope]=nodo
                @pila_aux[:size]+=1
            end
        end
    #ingresar los menores a la pila
        def ingresar_menores
            if @pila_aux[:tope]!=nil
            for i in 1..@pila_aux[:size]
            valor = @pila_aux[:tope][:valor]
            nodo = {
                valor:valor,
                siguiente: nil
            }
            tope = @pila[:tope]
            nodo[:siguiente]=tope
            @pila[:tope]=nodo
            siguiente = @pila_aux[:tope][:siguiente]
            @pila_aux[:tope]=siguiente
            @pasos.push(mostrar_pila())#pasos
            end
        end
        end
        #apartar los menores al valor actual.
        def apartar_menores(num)
            nodo ={
                valor: num,
                siguiente: nil
            }
            conta=1
            while conta<=@pila[:size]
                valor = @pila[:tope][:valor]
                if num>valor && @pila[:tope][:siguiente]==nil
                    insertar_en_aux(valor)
                    @pasos.push("eliminar #{valor}")#paso..
                    @pila[:tope]=nodo
                    @pila[:size]+=1
                    conta=@pila[:size]+1
                    @pasos.push(mostrar_pila())#pasos..
                elsif num ==valor
                    tope = @pila[:tope]
                    nodo[:siguiente]=tope
                    @pila[:tope]=nodo
                    @pila[:size]+=1
                    conta=@pila[:size]+1
                    @pasos.push(mostrar_pila())#pasos..
                elsif num>valor
                    insertar_en_aux(valor)
                    @pasos.push("eliminar #{valor}")#pasos
                    @pila[:tope]=@pila[:tope][:siguiente]
                    @pasos.push(mostrar_pila())#pasos..
                elsif num<valor
                    tope = @pila[:tope]
                    nodo[:siguiente]=tope
                    @pila[:tope]=nodo
                    @pila[:size]+=1
                    conta=@pila[:size]+1
                    @pasos.push(mostrar_pila())#pasos..
                end
                conta+=1
            end
            ingresar_menores()
            @pila_aux[:tope]=nil
            @pila_aux[:size]=0
            @pila_aux[:esta_vacia]=true
        end
        #ordenar principal
        def ordenar_pila(array=[])
            size = array.size
            for i in 0..size-1
              @pasos.push("ingresar #{array[i]}")#paso..
                nodo = {
                    valor: array[i],
                    siguiente: nil
                }
                if @pila[:esta_vacia]
                    @pila[:tope]=nodo
                    @pila[:esta_vacia]=false
                    @pila[:size]+=1

                else
                    apartar_menores(array[i])
                end
            end
        end
        #mostrar la pila
        def mostrar_pila
            elemento=@pila[:tope]
            @cadena=""
            if elemento ==nil
              @cadena=""
              @cadena
            elsif elemento[:siguiente]==nil
                @cadena+="#{elemento[:valor]}"
                @cadena
            else
                @cadena+="#{elemento[:valor]}"
                begin
                    elemento = elemento[:siguiente]
                    @cadena+=" => #{elemento[:valor]}"
                end while elemento[:siguiente]!=nil
                @cadena
            end
        end
        def mostrar_tabla(array_antes)
  tabla = Terminal::Table.new do |a|
  a.title= 'Ordenar todos los datos - Pila'
  a.headings = [{value:array_antes, alignment: :center}]
  a.add_row([{value:mostrar_pila(), alignment: :center}])
  end
  puts tabla
      end

      def tabla_pasos(conta,array_antes)
        aux=0
  tabla = Terminal::Table.new do |a|
  a.title= "Elementos a ordenar (PILA): #{array_antes} "
  a.headings = [{value:'Interaccion', alignment: :center},{value:'Estructura de datos', alignment: :center}]
  for i in 0..conta-1
  a.add_row([
  aux+=1,
  @pasos[i]
  ])
end
  end
  return tabla
      end

      def mostrar_pasos(array_antes)
          size=@pasos.size
          conta=0
        while conta<size
          limpiar_pantalla
          print 'Ingrese (p) para ir paso a paso o (f) para mostrar todos los pasos: '
          opc=gets.chomp
          if opc == 'p'
          puts tabla_pasos(conta+=1,array_antes)
          gets
          elsif opc == 'f'
            conta=size
            puts tabla_pasos(size,array_antes)
            puts 'Fin de la estructura'
            gets
          else
            puts 'opcion icorrecta, vuelva a intentar'
          end
        end
        #@pasos.clear
      end
      def pasos_pila
        size = @pasos.size
        return size
      end
      def limpiar_pila
        @pila[:tope]=nil
        @pila[:size]=0
        @pila[:esta_vacia]=true
        @pasos.clear
      end
end
