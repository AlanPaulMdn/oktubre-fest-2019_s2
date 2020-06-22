import marcas.*
import jarras.*
import carpas.*

class Personas {
	var property peso
	const property jarrasCompradas = []
	var property leGustaMusicaTradi
	var property nivelDeAguante=0
	
	method leGustaMarca(marca)
	
	method estaEbria()=
		self.totalAlcoholInterido() * peso > nivelDeAguante
		
	method totalAlcoholInterido()=
		jarrasCompradas.sum({litros => litros.contenidoDeAlcohol()})
		
	method quiereEntrarA(carpa)=
		self.leGustaMarca(carpa.marca()) and
		leGustaMusicaTradi == carpa.bandaTradi()
	
	method puedeEntrarA(carpa)=
		self.quiereEntrarA(carpa) and
		carpa.dejaIngresarA(self)
	
	method entrarA(carpa) {
		if (self.puedeEntrarA(carpa)){ carpa.entrarA(self) }
		else { console.println("Exception raised!") }
	}	
	
	method compra(jarra){
		jarrasCompradas.add(jarra)
	}
	
	method esEbriaEmpedernida()= jarrasCompradas.all({jarra => jarra.cantLitros()>=1})
	
	method esPatriota()= jarrasCompradas.all({jarra => jarra.paisOrigen() == self.paisOrigen() })
	
	method paisOrigen()
	
	method escompatible(persona){
		const compatibles = self.marcasCompradas().intersection( persona.marcasCompradas() ).size()
		//const compatibles = self.marcasCompradas().count({ marca => persona.marcasCompradas().contains(marca)})
		return self.marcasCompradas().size() - compatibles > compatibles
	}
	
	method marcasCompradas()= 
		jarrasCompradas.filter({jarra => jarra.marca()}).asSet()
	
	method carpasVendedoras()=
		jarrasCompradas.map({jarra => jarra.servidaEn() })
	
	method estaEntrandoEnElVicio() {
		var pos = new Range(start = 1, end = jarrasCompradas.size())
		pos.forEach({ i => jarrasCompradas.get(pos).cantLitros() >= jarrasCompradas.get(pos-1).cantLitros()}).all()
		/*	var pos = 1
		 * jarrasCompradas.forEach({ i =>
			if (pos <= jarrasCompradas.size()){
			jarrasCompradas.get(pos).cantLitros() >= jarrasCompradas.get(pos-1).cantLitros()
			pos+=1
			}
		}) 
		 */
	}
		
}

	
class Belgas inherits Personas {
	override method leGustaMarca(marca)=
		marca.cantLupulo() > 4
	
	override method paisOrigen()= "Belgica" 
}

class Checos inherits Personas {
	override method leGustaMarca(marca)=
		marca.graduacion() > 8
	
	override method paisOrigen()= "RepCheca" 
}

class Alemanes inherits Personas {
	override method leGustaMarca(marca)= true
	
	override method quiereEntrarA(carpa)=
		super(carpa) and carpa.capacidadEsPar()
	
	override method paisOrigen()= "Alemania" 
}