object paquete {
  var estaPago = true
  var peso=100 
  var mensajero= roberto
  method puedeSerEntregado(unDestino) = self.estaPago() and  unDestino.puedeLlegar(mensajero)

  method precio() = 50
  method mensajero(nuevo){
    mensajero = nuevo
  }
  method mensajero()= mensajero
  method estaPago()= estaPago

  method cambiarPago(unPago) {
    estaPago = unPago
    
  }

  method peso()= peso

  method cambiarPeso(unPeso){
    peso= unPeso
  }
}
//DESTINOS

object puenteBrooklyn {
   method puedeLlegar(unMensajero) = paquete.peso() <= 1000 
  
}

object laMatrix{
  method puedeLlegar(unMensajero) = unMensajero.puedeLlamar()
}
// MENSAJEROS
object roberto{
  var vehiculo= bici
  method peso()= 90 + vehiculo.peso() 
  method cambiarVehiculo(unVehiculo){
    vehiculo = unVehiculo
  }
  method puedeLlamar() = false

  
}

object  chuckNorris{
  method peso()= 80 
  method puedeLlamar() = true
}

object neo {
  var credito = 0
  method puedeLlamar() = 0 < credito
  method peso()= 0
  method credito(nuevo) {
    credito = nuevo
    
  }

  
}
//VEHICULOS
object bici {
 method peso()= 5
  
}

object camion {
  var cantAcoplados= 0 
  method peso()= cantAcoplados  * 500

  method cantAcoplados(nuevo) {
    cantAcoplados = nuevo
    
  }

  
}

object empresa{
  const mensajeros = []
  
  method contratar(nuevo) {
    mensajeros.add(nuevo)
    
  }

  method despedir(nuevo){
    mensajeros.remove(nuevo)
  }

  method despedirTodos()= mensajeros.clear()

  method empresaGrande() = mensajeros.size() > 2 


  
   
}

object paquetito{
  var mensajero = roberto
  method estaPago() = true
  method precio() = 0
  method puedeSerEntregado(destino) {
    return destino.puedeLlegar(mensajero) and self.estaPago()
  }
  method mensajero(unMensajero) {
    mensajero = unMensajero
  }
}

object paquetonViajero{
  const destino = []
  var estaPago = true
  var mensajero = roberto

  method mensajero(unMensajero) {
    mensajero = unMensajero
  }

  method estaPago() = estaPago

  method agregar(unDestino){
    destino.add(unDestino)
  }

  method quitar(unDestino){
    destino.remove(unDestino)
  }
  method precio() = 100 * destino.size()

  method puedeSerEntregado(unDestino) {
    return destino.last().puedeLlegar(mensajero) and self.estaPago() and self.mensajeroPuedePasar()
  }

  method mensajeroPuedePasar() = destino.all({m => m.puedeLlegar(mensajero)})


}

