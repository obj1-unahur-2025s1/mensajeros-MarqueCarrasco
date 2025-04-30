object paquete {
  var estaPago = true
  var peso=100 
  //var mensajero= roberto
  method puedeSerEntregado(unMensajero,unDestino) = self.estaPago() and  unDestino.puedeLlegar(unMensajero)

  method precio() = 50
 // method mensajero(nuevo){
  //  mensajero = nuevo
 // }
 // method mensajero()= mensajero
  method estaPago()= estaPago

  method cambiarPago(unPago) {
    estaPago = unPago
    
  }

  method peso()= peso

  method cambiarPeso(unPeso){
    peso= unPeso
  }
}

object paquetito{
  method puedeSerEntregado(unMensajero,unDestino) = self.estaPago() and  unDestino.puedeLlegar(unMensajero)
  method estaPago() = true
  method precio() = 0
  
 
}

object paquetonViajero{
  const destino = []
  var estaPago = true

  method estaPago(nuevo){
    estaPago= nuevo
  }

  method estaPago() = estaPago

  method agregar(unDestino){
    destino.add(unDestino)
  }

  method quitar(unDestino){
    destino.remove(unDestino)
  }
  method precio() = 100 * destino.size()

  method puedeSerEntregado(mensajero,unDestino) {
    return  self.estaPago() and self.mensajeroPuedePasar(mensajero)
  }

  method mensajeroPuedePasar(mensajero) = destino.all({m => m.puedeLlegar(mensajero)})


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

// empresas

object empresa{
  const mensajeros = []
  const paquetesEnviados= []
  const paquetesPendientes=[]
  
  method contratar(nuevo) {
    mensajeros.add(nuevo)
    
  }

  method despedir(nuevo){
    mensajeros.remove(nuevo)
  }

  method despedirTodos()= mensajeros.clear()

  method empresaGrande() = mensajeros.size() > 2 

  method elPaquetePuedeSerEntregado(unPaquete,unDestino){
    return mensajeros.any({m=>unPaquete.puedeSerEntregado(m , unDestino)})
  }

  method obtenerTodosLosMensajeros(unPaquete,unDestino){
    return mensajeros.filter({m=>unPaquete.puedeSerEntregado(m , unDestino)})
  }

  method sobrecarga(){
    return mensajeros.sum({m=>m.peso()}) / mensajeros.size()  > 500 
  }



  


  
   
}



