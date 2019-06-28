/*    						HUEVOS                            */

/*huevoRepostero: Esta hecho de chocolate blanco y aporta 750 calorias.*/
 
object huevoRepostero { 
	method calorias(){ 
		return 750 
	} 
	
	method tieneChocolateBlanco(){
		return true
	}
	
	method tieneChocolateAmargo(){
		return false
	}	

}

/*huevoMixto: Tiene 400 calorias de chocolate con leche y 500 calorias de chocolate blanco. */

object huevoMixto {
	const caloriasChocolateBlanco = 500
	const caloriasChocolateLeche = 400
	
	method calorias(){
		return caloriasChocolateBlanco + caloriasChocolateLeche
	}
	
	method tieneChocolateBlanco(){
		return true
	}
	
	method tieneChocolateAmargo(){
		return false
	}
	
}

/*conejoChocolate: Es de chocolate amargo y tiene diez veces su peso en calorias. */

object conejoChocolate {
	var peso = 5
	
	method peso(valor){
		peso = valor
	}
	
	method calorias(){
		return peso * 10
	}
	
	method tieneChocolateBlanco(){
		return false
	}
	
	method tieneChocolateAmargo(){
		return true
	}
	
}


/*huevoBlister: Trae un numero arbitrario de huevos de chocolate con leche
  que dan 100 calorias cada uno. Por cada 5 huevos de chocolate con leche se
  incluye de regalo uno de chocolate blanco que tiene 150 calorias.*/


object huevoBlister {
	var huevos = 0

	method huevos(x){
		huevos = x
	}
	
	method calorias(){
		return huevos*100 + huevos.div(5)*150 
	}
	
	method tieneChocolateBlanco(){
		return huevos >= 5 
	}
	
	method tieneChocolateAmargo(){
		return false
	}
}

/*matrioshka: De base, es chocolate amargo y tiene 3000 calorias.
  Viene con dos decoraciones posibles en chocolate con leche: 
  arbol o flor. El arbol tiene 150 calorias adicionales, mientras 
  que la flor viene en diferentes tamaños y tiene 100 calor�as por
  cada petalo. Ademas viene con otro huevo (de los descritos antes) adentro.*/
  
      
object matrioshka{
	
	var huevoInterior = huevoMixto  
	var decoracion = flor 
 
	method huevoInterior(huevo) {
		huevoInterior = huevo
	}
	method decoracion(deco) {
		decoracion = deco
	}
	
	method calorias(){
		return 3000 + decoracion.calorias() + huevoInterior.calorias()
	}	
		
	method tieneChocolateBlanco(){
		return huevoInterior.tieneChocolateBlanco() 
	}
	
	method tieneChocolateAmargo(){
		return true
	}
}

object flor {
	var petalos = 5
			
	method calorias(){
		return petalos * 100
	}
	method petalos(_petalos) {
		petalos = _petalos
	}	 
}

object arbol {
	method calorias(){
		return 150
	}	 
}

/*							INTREPIDOS PERSONAJES                       */
	
object ana{
	var huevos = []
	var caloriasConsumidas = 0
	
	method leGusta(huevo){
		return not huevo.tieneChocolateAmargo() 
	}
	
	method comer(huevo){
		huevos.add(huevo)
		caloriasConsumidas += huevo.calorias()
	}
	
	method enfermo(){
		return caloriasConsumidas > 5000 or self.comioChocolateBlanco() 
	}

	method comioChocolateBlanco() {
		return huevos.any({h=>h.tieneChocolateBlanco()})
	}
}

object tito{
	
	method leGusta(huevo){
		return true 
	}
	
	method comer(huevo){
	}
	
	method enfermo(){
		return false		
	}
}

object jose{
	var ultimoHuevo 
	
	method leGusta(huevo){
		return huevo.tieneChocolateBlanco() and huevo.calorias() < 400 
	}
	
	method comer(huevo){
		ultimoHuevo = huevo
	}
		  
	method enfermo(){
		return ultimoHuevo.tieneChocolateAmargo()
	}
}


/*	EL JUEGO */

object juego{
	var huevosBuscados = []
	
	method agregarHuevos(huevos){
		huevosBuscados.addAll(huevos)
	}
	
	method cuantosFaltan(){
		return huevosBuscados.size()
	}
	
	method huevoEsEncontrado(chico,huevo){
		chico.comer(huevo) 
		huevosBuscados.remove(huevo)
	}
	
	method encontrarPrimerHuevo(chico){
		self.huevoEsEncontrado(chico, huevosBuscados.first())
	}
	
	method encontrarHuevosRestantes(chico){
		huevosBuscados.forEach({huevo => self.huevoEsEncontrado(chico,huevo)})
	}
}


