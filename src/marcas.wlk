
class Marcas {
	var property cantLupulo
	var property paisOrigen
	var property graduacion
	//(cantLupulo= paisOrigen= graduacion=)
	
	method nivelAlcohol()=
		self.graduacion()/100

}

class Rubia inherits Marcas  { 
	
}

class Negra inherits Marcas{
	override method graduacion()=
		graduacionMundial.porcentaje().min(self.cantLupulo()*2)	
}
object graduacionMundial{
	var property porcentaje = 10
}

class Roja inherits Negra{
	override method graduacion()=
		super()*1.25
	
}