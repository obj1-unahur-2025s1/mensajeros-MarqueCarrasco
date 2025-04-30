object paquete {
  var estaPago = true
  var peso=100 
  var destino= puenteBrooklyn
 
  method puedeSerEntregado(unMensajero) = self.estaPago() and  destino.puedeLlegar(unMensajero)

  method precio() = 50

  method estaPago()= estaPago

  method cambiarPago(unPago) {
    estaPago = unPago
    
  }

  method peso()= peso

  method cambiarPeso(unPeso){
    peso= unPeso
  }

  method cambiarDestino(nuevo){
    destino = nuevo
  }

  method destino() = destino 
}

object paquetito{
  method puedeSerEntregado(unMensajero) = true
  method estaPago() = true
  method precio()= 0

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

  method puedeSerEntregado(mensajero) {
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

  method entregaRapida() = paquete.puedeSerEntregado(mensajeros.head()) 

  method pesoFinal() = mensajeros.last().peso()

  method elPaquetePuedeSerEntregado(unPaquete){
    return mensajeros.any({m=>unPaquete.puedeSerEntregado(m)})
  }

  method obtenerTodosLosMensajeros(unPaquete){
    return mensajeros.filter({m=>unPaquete.puedeSerEntregado(m)})
  }

  method sobrecarga(){
    return mensajeros.sum({m=>m.peso()}) / mensajeros.size()  > 500 
  }

  method enviar(unPaquete){
    if(self.elPaquetePuedeSerEntregado(unPaquete))
       paquetesEnviados.add(unPaquete)
    else 
      paquetesPendientes.add(unPaquete)
  }

  method facturacioTotal()= paquetesEnviados.sum{p=>p.precio()}

  method enviarTodos(paquetesAEnviar){
    paquetesAEnviar.forEach{p=>self.enviar(p)}
  }

  method pendienteMasCaro(){
    return paquetesPendientes.max{p=>p.precio()}
  }

  method reenviarPendiente() {
    self.enviar(self.pendienteMasCaro())
    paquetesPendientes.remove{self.pendienteMasCaro()}
    
  }





}



