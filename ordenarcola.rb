require 'terminal-table'
require_relative 'ingresar_apartados_cola'

class Cola
  def initialize
    @cola = {
    tope: nil,
    fondo: nil,
    size: 0,
    esta_vacia: true
  }
  @cola_mayor ={
    tope: nil,
    fondo: nil,
    size: 0,
    esta_vacia: true
  }
  @cola_menor={
    tope: nil,
    fondo: nil,
    size: 0,
    esta_vacia: true
  }
  @cola_igual={
    tope: nil,
    fondo: nil,
    size: 0,
    esta_vacia: true
  }
  @paso=[]
  @cadena1=""
    end

      def ingresar_mayores #ingresar los mayores en la cola principal
      for i in 1..@cola_mayor[:size]
            valor = @cola_mayor[:tope][:valor]
            nodo = {
                valor:valor,
                siguiente: nil
            }
            fondo = @cola[:fondo]
            fondo[:siguiente]=nodo
            @cola[:fondo]=nodo
            @cola_mayor[:tope]=@cola_mayor[:tope][:siguiente]
            @paso.push(mostrar_cola())#paso
          end
  end
#ingresar los menores
def ingresar_menores #ingresar los menores en la cola principal
      for i in 1..@cola_menor[:size]
        if @cola[:tope]==nil
          valor = @cola_menor[:tope][:valor]
            nodo = {
                valor:valor,
                siguiente: nil
            }
            @cola[:tope]=nodo
            @cola[:fondo]=nodo
            @cola[:esta_vacia]=false
            @paso.push("cuando cola es nil"+mostrar_cola())
            @cola_menor[:tope]=@cola_menor[:tope][:siguiente]
        else
            valor = @cola_menor[:tope][:valor]
            nodo = {
                valor:valor,
                siguiente: nil
            }
            fondo = @cola[:fondo]
            fondo[:siguiente]=nodo
            @cola[:fondo]=nodo
            siguiente = @cola_menor[:tope][:siguiente]
            @cola_menor[:tope]=siguiente
            @paso.push(">>>"+mostrar_cola())#paso
          end
        end
    end


    def ingresar_cola_mayor(valor) #ingresar al auxiliar menor
        nodo = {
                valor: valor,
                siguiente: nil,
            }
            if @cola_mayor[:esta_vacia]
                @cola_mayor[:tope]=nodo
                @cola_mayor[:fondo]=nodo
                @cola_mayor[:esta_vacia]=false
                @cola_mayor[:size]+=1
            else
                fondo=@cola_mayor[:fondo]
                fondo[:siguiente]=nodo
                @cola_mayor[:fondo]=nodo
                @cola_mayor[:size]+=1
            end
    end
    def ingresar_cola_menor(valor)#ingresar al auxiliar menor.
      @paso.push("ingresar en aux menor"+mostrar_cola())
        nodo = {
                valor: valor,
                siguiente: nil,
            }
            if @cola_menor[:esta_vacia]
                @cola_menor[:tope]=nodo
                @cola_menor[:fondo]=nodo
                @cola_menor[:esta_vacia]=false
                @cola_menor[:size]+=1
            else
                fondo=@cola_menor[:fondo]
                fondo[:siguiente]=nodo
                @cola_menor[:fondo]=nodo
                @cola_menor[:size]+=1
            end
            @paso.push("--"+mostrar_cola)
    end

    #vaciar cola
    def vaciar(nodo,num)
            menor=0
            @paso.push(num)#paso..
            while @cola[:tope]!=nil
                valor = @cola[:tope][:valor]
                  if num>valor
                    menor+=1
                    ingresar_cola_menor(valor)
                    @paso.push("apartar menor: #{valor}")
                  elsif num<valor
                    ingresar_cola_mayor(valor)
                    @paso.push("apartar mayor: #{valor}")
                  elsif num == valor

                    ingresar_cola_mayor(valor)
                    @paso.push("aparatar igual: #{valor}")
                  end
                  @paso.push(@cola[:tope][:valor])
                @cola[:tope]=@cola[:tope][:siguiente]

                end
                @paso.push("*"+mostrar_cola())
                @cola[:fondo]=nil
                @cola[:tope]=nil
                @cola[:esta_vacia]=true
                @paso.push("+"+mostrar_cola())
                if menor>0
                  ingresar_menores()
                  @paso.push("*"+mostrar_cola())
                  fondo=@cola[:fondo]
                  fondo[:siguiente]=nodo
                  @cola[:fondo]=nodo
                  @cola[:size]+=1
                  ingresar_mayores()
                  @paso.push("-"+mostrar_cola())
                else
                  @cola[:tope]=nodo
                  @cola[:fondo]=nodo
                  @cola[:size]+=1
                  @cola[:esta_vacia]=false
                  ingresar_mayores()
                end
                @paso.push("*"+mostrar_cola())#paso
                @cola_mayor[:tope]=nil
                @cola_mayor[:fondo]=nil
                @cola_mayor[:size]=0
                @cola_mayor[:esta_vacia]=true

                @cola_menor[:tope]=nil
                @cola_menor[:fondo]=nil
                @cola_menor[:size]=0
                @cola_menor[:esta_vacia]=true

    end
    #primer paso...Insertar primer elemento...
    def ordenar_cola(array=[])
            size = array.size
            for i in 0..size-1
              @paso.push("ingresar #{array[i]}")#paso..
                nodo = {
                    valor: array[i],
                    siguiente: nil
                }
                if @cola[:esta_vacia]
                    @cola[:tope]=nodo
                    @cola[:fondo]=nodo
                    @cola[:esta_vacia]=false
                    @cola[:size]+=1

                else
                  if array[i]>@cola[:fondo][:valor]
                    fondo = @cola[:fondo]
                    fondo[:siguiente]=nodo
                    @cola[:fondo]=nodo
                    @cola[:size]+=1
                  else
                    vaciar(nodo,array[i])
                  end
                end
            end
            array.clear
        end
        def mostrar_cola
          elemento=@cola[:tope]
            @cadena1=""
            if elemento ==nil
              @cadena1=""
              @cadena1
            elsif elemento[:siguiente]==nil
                @cadena1+="#{elemento[:valor]}"
                @cadena1
            else
                @cadena1+="#{elemento[:valor]}"
                begin
                    elemento = elemento[:siguiente]
                    @cadena1+=" => #{elemento[:valor]}"
                end while elemento[:siguiente]!=nil
                @cadena1
            end
        end
        def mostrar_paso
          puts @cola
          #puts @cola_mayor
          #puts @cola_menor
          #@paso.each do |x|
           # puts x
          #end
        end

end
