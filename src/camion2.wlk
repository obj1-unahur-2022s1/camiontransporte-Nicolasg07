// Resolver "total de bultos" y "consecuencia de la carga" sobre camion2.wlk y cosas2.wlk. 
//Así queda limpia la resolución de los puntos previos.

//Si hacen tests de "total de bultos" y "consecuencia de la carga", hacerlos en un archivo aparte, 
//que haga import de camion2.wlk y cosas2.wlk. Así los tests también nos quedan separados.

import cosas2.*

object camion {
	var cosas = []
	
	method cargar(cosa) { cosas.add(cosa) }
	
	method descargar(cosa) { cosas.remove(cosa) }
	
	method todoPesoPar()= cosas.all({ c => c.peso().even() })
	
	method hayAlgunoQuePesa(peso)= cosas.any({ c => c.peso() == peso })
	
	method elDeNivel(nivel)= cosas.find({ c => c.peligrosidad() == nivel })
	
	method pesoTotal()= 1000 + cosas.sum({ c => c.peso() })
	
	method excedidoDePeso()= self.pesoTotal() > 2500
	
	method objetosQueSuperanPeligrosidad(nivel)= cosas.filter({ c => c.peligrosidad() > nivel })
	
	/* Podias reutilizar  objetosQueSuperanPeligrosidad(nivel) */
	//method objetosMasPeligrososQue(cosa)= cosas.filter({ c => c.peligrosidad() > cosa.peligrosidad() })
	method objetosMasPeligrososQue(cosa)= self.objetosQueSuperanPeligrosidad(cosa.peligrosidad())
	
	method puedeCircularEnRuta(nivelMaximoPeligrosidad) {
		return !self.excedidoDePeso() and cosas.all({ c => c.peligrosidad() < nivelMaximoPeligrosidad })
	}
	
	method tieneAlgoQuePesaEntre(min, max)= cosas.any({ c => (c.peso() > min) and (c.peso() < max) })
	
	method cosaMasPesada()= cosas.max({ c => c.peso() })
	
	method pesos()= cosas.map({ c => c.peso() })
	
	method totalBultos()= cosas.sum({ c => c.bultos() })
}
