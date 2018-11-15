require 'terminal-table'
class Lista
  def initialize
    @lista ={
      tope: nil,
      fondo: nil,
      size: 0,
      esta_vacia: true
    }
    @cadenaL=""
    @pasoL=[]
  end
  def obtener_anterior(conta)
    elemento=@lista[:tope]
    for i in 1..conta
      elemento=elemento[:siguiente]
    end
    return elemento
  end
  #condiciones para inserciones
  def condiciones_de_insercion(nodo,num)
    if num>@lista[:fondo][:valor]
      fondo = @lista[:fondo]
      fondo[:siguiente]=nodo
      @lista[:fondo]=nodo
      @lista[:size]+=1
      @pasoL.push(mostrar_lista())
    elsif num<@lista[:tope][:valor]
      tope = @lista[:tope]
      nodo[:siguiente]=tope
      @lista[:tope]=nodo
      @lista[:size]+=1
      @pasoL.push(mostrar_lista())
    elsif num==@lista[:tope][:valor]
      tope = @lista[:tope]
      nodo[:siguiente]=tope
      @lista[:tope]=nodo
      @lista[:size]+=1
      @pasoL.push(mostrar_lista())
    else
      conta=1
      elemento = @lista[:tope][:siguiente]
      for i in 1..@lista[:size]
        if num<elemento[:valor] || num==elemento[:valor]
          i = @lista[:size]+1
        else
          elemento=elemento[:siguiente]
          conta+=1
        end
      end
      nodo_anterior=obtener_anterior(conta-1)
      nodo_anterior[:siguiente]=nodo
      nodo[:siguiente]=elemento
      @lista[:size]+=1
      @pasoL.push(mostrar_lista())
  end
end
      def ordenar_lista(array=[])
        size = array.size
        for i in 0..size-1
          @pasoL.push("ingresa: "+"#{array[i]}")#paso..
          nodo ={
            valor: array[i],
            siguiente: nil
          }
          if @lista[:esta_vacia]
            @lista[:tope]=nodo
            @lista[:fondo]=nodo
            @lista[:esta_vacia]=false
            @lista[:size]+=1
            @pasoL.push(mostrar_lista())#paso..
          else
              condiciones_de_insercion(nodo,array[i])

          end
        end
        array.clear
      end

      def mostrar_lista
          elemento=@lista[:tope]
            @cadenaL=""
            if elemento ==nil
              @cadenaL=""
              @cadenaL
            elsif elemento[:siguiente]==nil
                @cadenaL+="#{elemento[:valor]}"
                @cadenaL
            else
                @cadenaL+="#{elemento[:valor]}"
                begin
                    elemento = elemento[:siguiente]
                    @cadenaL+=" => #{elemento[:valor]}"
                end while elemento[:siguiente]!=nil
                @cadenaL
            end
        end
end
