class IngresarApartados
  def initialize(mayores,menores,iguales)
    @mayores=mayores
    @menores=menores
    @iguales=iguales
  end
  def ingresar_mayores(cola_principal)
    if @mayores!=nil
      for i in 1..@mayores[:size]
            valor = @mayores[:tope][:valor]
            nodo = {
                valor:valor,
                siguiente: nil
            }
            fondo = cola_principal[:fondo]
            fondo[:siguiente]=nodo
            cola_principal[:fondo]=nodo
            siguiente = @mayores[:tope][:siguiente]
            @mayores[:tope]=siguiente

            end
            return cola_principal
    end
  end
end
