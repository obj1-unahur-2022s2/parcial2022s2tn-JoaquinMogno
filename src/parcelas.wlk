import plantas.*

class Parcela{
	var ancho
	var largo
	var horasDeSol
	const property plantas = []
	
	method superficie() = ancho * largo
	method capacidadMaxDePlantas(){return
		if(ancho > largo)self.superficie()/ 5
		else self.superficie() / 3 + largo
	}
	method tieneComplicaciones() = plantas.any({p => p.horasDeSolToleradas() < horasDeSol})
	
	method plantar(unaPlanta){
		plantas.add(unaPlanta)
		if(self.capacidadMaxDePlantas() < plantas.size() || horasDeSol + 2 < unaPlanta.horasDeSolToleradas()){
			self.error("no se puede plantar una planta")
		}
	}
	
	
	method noHayPlantasGrandes() = plantas.all({altura =>altura < 1.5})
	method seAsociaBienCon(unaPlanta)
	method cantidadDePlantasEnParcela()= plantas.size()
	method cantidadDePlantasBienAsiciadas() = plantas.count({planta => self.seAsociaBienCon(planta)})
	
}

class ParcelaEcologica inherits Parcela{
	override method seAsociaBienCon(unaPlanta) = !self.tieneComplicaciones() && unaPlanta.lePareceIdeal(self)
}
class ParcelaIndustrial inherits Parcela{
	override method seAsociaBienCon(unaPlanta) = plantas.size() <= 2 && unaPlanta.esFuerte()
}


object inta{
	const property parcelas = []
	
	method promedioDePlantasPorParcela(){}
	
	method promedioDePlantasPorParela() = self.sumaDePlantasPorParcela() / parcelas.size()
	method sumaDePlantasPorParcela() = parcelas.sum({p=>p.plantas().size()}) 
	
	method parcelasConMasdeXPlantas(cantPlantas)= parcelas.filter({p => p.plantas().size() > cantPlantas})
	method parcelaMasAutosustentable() = self.parcelasConMasdeXPlantas(4).max({p=>p.cantidadDePlantasBienAsociadas()})
}