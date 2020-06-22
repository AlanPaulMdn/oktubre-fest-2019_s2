import marcas.*
import jarras.*
import personas.*

class Carpas {
	var property limiteAdmitides
	var property bandaTradi
	const property jarrasDeCerveza = []
	const property marcaCarpa
	const property personasDentro = []
	const property cantPersonasDentro = personasDentro.size()
	
	method capacidadEsPar()= personasDentro.even()
	
	method dejaIngresarA(persona)=
		limiteAdmitides < cantPersonasDentro and
		not persona.estaEbria()
	
	method entrarA(persona){ personasDentro.add(persona) }
	
	method servirA_capacidad_(persona, capacidad){
		var jarra = new Jarras(cantLitros= capacidad, marca = marcaCarpa, servidaEn = self) //varOConst??
		if ( personasDentro.contains(persona) ) {
			persona.compra(jarra)
		} else { console.println("Exception raised!")} 
	}
	
	method ebriosEmpedernidos()=
		personasDentro.count({persona => persona.esEbriaEmpedernida() })
	
	method esHomogenea()=
		personasDentro.all({persona => persona.paisOrigen() == personasDentro.first().paisOrigen() })
	
	method asistentesSinVender()=
		personasDentro.filter({persona => not persona.carpasVendedoras().contains(self)})
	
		 
	
}