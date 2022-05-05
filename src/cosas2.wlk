// Resolver "total de bultos" y "consecuencia de la carga" sobre camion2.wlk y cosas2.wlk. 
//Así queda limpia la resolución de los puntos previos.

//Si hacen tests de "total de bultos" y "consecuencia de la carga", hacerlos en un archivo aparte, 
//que haga import de camion2.wlk y cosas2.wlk. Así los tests también nos quedan separados.

object knightRider {
	
	method peso()= 500
	method peligrosidad()= 10
	method bultos()= 1
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
	method bultos()= 2
}

object paqueteLadrillos{
	var ladrillos = 0
	
	method peso()= 2 * ladrillos
	method peligrosidad()= 2
	method setLadrillos(numero) { ladrillos += numero }
	method bultos() {
		if (ladrillos <= 100) { return 1 }
		else if (ladrillos.between(101, 300)) { return 2 }
		else { return 3 }
	}
}

object arena {
	var peso = 0
	
	method peso()= peso
	method peligrosidad()= 1
	method setPeso(numero) { peso += numero }
	method bultos()= 1
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
	method bultos() {
		if (self.tieneMisiles()) { return 2 } 
		else { return 1 }
	}
}

object contenedor {
	var cosas = []
	
	method peso()= 100 + cosas.sum({ c => c.peso() })
	method peligrosidad() {
		if (cosas.isEmpty()) { return 0 } 
		else { return cosas.max({ c => c.peligrosidad() }).peligrosidad() }
	}
	method meterAlContenedor(cosa) { cosas.add(cosa) }
	method bultos()= 1 + cosas.sum({ c => c.bultos() })
}

object residuosRadioactivos {
	var peso = 0
	
	method peso()= peso
	method peligrosidad()= 200
	method setPeso(numero) { peso += numero }
	method bultos()= 1
}

object embalajeSeguridad {
	var cosaAEnvolver
	
	method peso()= cosaAEnvolver.peso()
	method peligrosidad()= cosaAEnvolver.peligrosidad() * 0.5
	method cosaAEnvolver(cosa) { cosaAEnvolver = cosa }
	method bultos()= 2
}
