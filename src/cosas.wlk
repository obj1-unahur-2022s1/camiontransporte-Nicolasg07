object knightRider {
	
	method peso()= 500
	method peligrosidad()= 10
}

object bumblebee {
	var esAuto = true
	
	method peso()= 800
	method peligrosidad() {
		if (self.esAuto()) { return 15 } 
		else { return 30 }
	}
	method esAuto()= esAuto
	method setAuto(unBool) { esAuto = unBool }
}

object paqueteLadrillos{
	var ladrillos = 0
	
	method peso()= 2 * ladrillos
	method peligrosidad()= 2
	method setLadrillos(numero) { ladrillos += numero }
}


object arena {
	var peso = 0
	
	method peso()= peso
	method peligrosidad()= 1
	method setPeso(numero) { peso += numero }
}

object bateriaAntiarea {
	var tieneMisiles = true
	
	method peso() {
		if (self.tieneMisiles()) { return 300 } 
		else { return 200 }
	} 
	method peligrosidad() {
		if (self.tieneMisiles()) { return 100 } 
		else { return 0 }
	} 
	method tieneMisiles()= tieneMisiles
	method setMisiles(unBool) { tieneMisiles = unBool }
}

object contenedor {
	var cosas = []
	
	method peso()= 100 + cosas.sum({ c => c.peso() })
	method peligrosidad() {
		if (cosas.isEmpty()) { return 0 } 
		else { return cosas.max({ c => c.peligrosidad() }).peligrosidad() }
	}
	method meterAlContenedor(cosa) { cosas.add(cosa) }
}

object residuosRadioactivos {
	var peso = 0
	
	method peso()= peso
	method peligrosidad()= 200
	method setPeso(numero) { peso += numero }	
}

object embalajeSeguridad {
	var cosaAEnvolver
	
	method peso()= cosaAEnvolver.peso()
	method peligrosidad()= cosaAEnvolver.peligrosidad() * 0.5
	method cosaAEnvolver(cosa) { cosaAEnvolver = cosa }
}




