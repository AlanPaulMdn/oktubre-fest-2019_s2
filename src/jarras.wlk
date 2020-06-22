import marcas.*

class Jarras {
	var property cantLitros=0
	var property marca
	var property servidaEn
	
	
	method contenidoDeAlcohol()=
		cantLitros * marca.nivelDeAlcohol()
		
	method paisOrigen()= marca.paisOrigen()
	
	
}