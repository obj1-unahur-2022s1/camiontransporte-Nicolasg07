import cosas.*

object camion {
	var cosas = []
	
	method cargar(cosa) { cosas.add(cosa) }
	
	method descargar(cosa) { cosas.remove(cosa) }
	
	method hayAlgunoQuePesa(peso)= cosas.any({ c => c.peso() == peso })
	
	method elDeNivel(nivel)= cosas.find({ c => c.peligrosidad() == nivel })
	
	method pesoTotal()= 1000 + cosas.sum({ c => c.peso() })
	
	method excedidoDePeso()= self.pesoTotal() > 2500
	
	method objetosQueSuperanPeligrosidad(nivel)= cosas.filter({ c => c.peligrosidad() > nivel })
	
	method objetosMasPeligrososQue(cosa)= cosas.filter({ c => c.peligrosidad() > cosa.peligrosidad() })
	
	method puedeCircularEnRuta(nivelMaximoPeligrosidad) {
		return !self.excedidoDePeso() and cosas.all({ c => c.peligrosidad() < nivelMaximoPeligrosidad })
	}
	
	method tieneAlgoQuePesaEntre(min, max)= cosas.any({ c => c.peso() > min and c.peso() < max })
	
	method cosaMasPesada()= cosas.max({ c => c.peso() })
	
	method pesos()= cosas.map({ c => c.peso() })
}
