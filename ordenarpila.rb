require 'terminal-table'
class Pila
        def initialize
            @pila = {
                tope: nil,
                size: 0,
                esta_vacia: true
            }
            @pila_aux = {
                tope: nil,
                size:0,
                esta_vacia: true
            }
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
                if @pila_aux[:size]==nil
                nodo = {
                valor:valor,
                siguiente: nil
                }
                tope=@pila[:tope]
                nodo[:siguiente]=tope
                @pila[:tope]=nodo
                @pila_aux[:tope]=nil
                else
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
            end
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
                    @pila[:tope]=nodo
                    @pila[:size]+=1
                    conta=@pila[:size]+1
                elsif num ==valor
                    tope = @pila[:tope]
                    nodo[:siguiente]=tope
                    @pila[:tope]=nodo
                    @pila[:size]+=1
                    conta=@pila[:size]+1
                elsif num>valor
                    insertar_en_aux(valor)
                    @pila[:tope]=@pila[:tope][:siguiente]
                elsif num<valor
                    tope = @pila[:tope]
                    nodo[:siguiente]=tope
                    @pila[:tope]=nodo
                    @pila[:size]+=1
                    conta=@pila[:size]+1
                end
                conta+=1
            end
            ingresar_menores()
            @pila_aux[:tope]=nil
            @pila_aux[:size]=0
            @pila_aux[:esta_vacia]=true
        end
        #ordenar principal
        def ordenar_pila(array=[],array_antes)
            size = array.size
            if size==0
              puts 'Ingrese nuevos elementos a ordenar.'
            else
            for i in 0..size-1
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
            mostrar_tabla(array_antes)
            array.clear
          end
        end
        #mostrar la pila
        def mostrar_pila
            elemento=@pila[:tope]
            if elemento[:siguiente]==nil
                puts elemento[:valor]
            else
                @cadena=""
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
  a.title= 'Ordenar todos los datos'
  a.headings = [{value:array_antes, alignment: :center}]
  a.add_row([{value:mostrar_pila(), alignment: :center}])
  end
  puts tabla
      end
end
