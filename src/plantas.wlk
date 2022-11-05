/*
 * OK
 */
import parcelas.*

class Planta {
	var property anioObtencionSemilla
	var property altura
	
	method horasDeSolToleradas()
	method esFuerte() = self.horasDeSolToleradas() > 10
	method daNuevasSemillas() = self.esFuerte()
	method espacioOcupado()
	
	method lePareceIdeal(unaParcela) 
	
}

class Menta inherits Planta {
	
	override method horasDeSolToleradas() = 6
	override method daNuevasSemillas() = super() || altura > 0.4
	override method espacioOcupado() = altura * 3
	override method lePareceIdeal(unaParcela) = unaParcela.superficie() > 6
}

class Hierbabuena inherits Menta {
	override method espacioOcupado() = super() * 2
}

class Soja inherits Planta {
	
	
	override method horasDeSolToleradas(){return
		if(altura<0.5){
			6
		}
		else if(altura.between(0.5, 1)){
			7
		}
		else 9
	}	
	override method daNuevasSemillas() = super() || (anioObtencionSemilla > 2007 && altura > 1)
	override method espacioOcupado() = altura / 2
	override method lePareceIdeal(unaParcela) = unaParcela.horasDeSol() == self.horasDeSolToleradas()
}

class SojaTrangenica inherits Soja {
	override method daNuevasSemillas() = false
	override method lePareceIdeal(unaParcela) = unaParcela.capacidadMaxDePlantas() == 1
}

class Quinoa inherits Planta {
	var property horasDeSolToleradas
	
	override method horasDeSolToleradas() = horasDeSolToleradas
	override method daNuevasSemillas() = super() ||anioObtencionSemilla < 2005
	override method espacioOcupado() = 0.5
	override method lePareceIdeal(unaParcela) = unaParcela.noHayPlantasGrandes()	
}

