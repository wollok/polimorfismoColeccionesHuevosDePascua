/*    						HUEVOS                            */

/*huevoRepostero: Está hecho de chocolate blanco y aporta 750 calorías.*/
 
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

/*huevoMixto: Tiene 400 calorías de chocolate con leche y 500 calorías de chocolate blanco. */

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

/*conejoChocolate: Es de chocolate amargo y tiene diez veces su peso en calorías. */

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


/*huevoBlister: Trae un número arbitrario de huevos de chocolate con leche
  que dan 100 calorías cada uno. Por cada 5 huevos de chocolate con leche se
  incluye de regalo uno de chocolate blanco que tiene 150 calorías.*/


object huevoBlister {
	var huevos = 0

	method huevos(x){
		huevos = x
	}
	
	method calorias(){
		return huevos*100 + huevos.div(5)*150 
	}
	
	method tieneChocolateBlanco(){
		return huevos > 5
	}
	
	method tieneChocolateAmargo(){
		return false
	}
}

/*matrioshka: De base, es chocolate amargo y tiene 3000 calorias.
  Viene con dos decoraciones posibles en chocolate con leche: 
  árbol o flor. El árbol tiene 150 calorías adicionales, mientras 
  que la flor viene en diferentes tamaños y tiene 100 calorías por
  cada pétalo. Además viene con otro huevo (de los descritos antes) adentro.*/
  
      
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
}

object arbol {
	method calorias(){
		return 150
	}	 
}

/*							INTREPIDOS PERSONAJES                       */
	
object ana{
	var huevos = []
	
	method leGusta(huevo){
		return not huevo.tieneChocolateAmargo() 
	}
	
	method comer(huevo){
		huevos.add(huevo)
	}
	
	method enfermo(){
		return self.totalCalorias() > 5000 or self.comioChocolateBlanco() 
	}
	
	method totalCalorias(){
		return huevos.sum({h=>h.calorias()}) 
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
	
	method encontrarUnHuevo(chico,huevo){
		chico.comer(huevo) 
		huevosBuscados.remove(huevo)
	}
	
	method encontrarPrimerHuevo(chico){
		self.encontrarUnHuevo(chico, huevosBuscados.first())
	}
	
	method encontrarHuevosRestantes(chico){
		huevosBuscados.forEach({huevo => chico.comer(huevo)})
		huevosBuscados.clear()
	}
}


