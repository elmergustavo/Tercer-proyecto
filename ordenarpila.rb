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
        def ordenar_pila(array=[])
            size = array.size
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
        end
        def mostrar_pila
        puts @pila
            puts @pila_aux
        end
end