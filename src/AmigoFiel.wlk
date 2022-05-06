object andy{
	var juguetes = []
	var felicidad = 200
	
	method nivelFelicidad() = felicidad
	
	method jugar(){
		juguetes.forEach{j=>j.jugar(self)}
	}

//	method jugar2(){
//		juguetes.foreach{j=>self.jugarCon(j)}
//	}
//	method jugarCon(juguete){
//		felicidad += juguete.felicidadQueDaCuandoAlguienJuega()
//		juguete.sufriLosEfectosQueAlguienJugoConVos()
//	}
	
	method aumentarFelicidad(cantidad) {
		felicidad += cantidad
	}
	
	method aburrirse(minutos){
		felicidad -= 10*minutos
	}
	method dormir(){
		felicidad = 200
	}
	method pasarLaNoche() {
		var cantidad = juguetes.count{j=>j.buenEstado()} 
		self.dormir()
		self.aumentarFelicidad(cantidad * 20)
	}
	method agarrarJuguete(juguete){
		juguetes.add(juguete)
	}
	method perderJuguete(){
		juguetes.remove(juguetes.last())
	}
	method nombresJuguetes() {
		return juguetes.map{j=>j.nombreOriginal()}
	}
	
	method arreglarJuguetes() {
		juguetes.forEach( { j=>reparador.reparar(j)} )
	}
	method juegaConMuniecas() = false
}

object woody{
	var property pintura = 100
	const frasesDelCordon = ["Hay una serpiente en mi bota", "Alguien enveneno el abrevadero", "Corre como el viento Tiro al Blanco"]
	method nombreOriginal(){
		return "El Vaquero Woody"
	}
	method tirarDelCordon(){
		return frasesDelCordon.anyOne()
	}
	method hacerseElGalan(frase){
		frasesDelCordon.add(frase)
	}
	method jugar(persona){
		 pintura -= 10
		 persona.aumentarFelicidad(self.cantidadLetras())
	}
		
	method sufriLosEfectosQueAlguienJugoConVos() {
	   pintura -= 10
	}
	method felicidadQueDaCuandoAlguienJuega() {
	   return self.cantidadLetras()
	}
	 
	method buenEstado(){
		return pintura > 50
	}
	method cantidadLetras() {
		return frasesDelCordon.sum{frase=>frase.size()}
	}
	method reparar() {
		pintura = 100
	}
}

object buzz{
	var property energia = 100
	method nombreReal(){
		return "Buzz Lightyear"
	}
	method volar(persona){
		persona.aumentarFelicidad(2*energia)
		energia = energia / 2
	}
	method tirarRayos(cantidad){
		energia += cantidad*5
	}
	method jugar(persona){
		self.volar(persona)
		self.tirarRayos(10)
		self.volar(persona)
		self.tirarRayos(1)
	}
	method buenEstado(){
		return energia > 50
	}
	method reparar() {
		energia = 100
	}
}

object rex{
	var potenciador = 1
	var companiero = woody
	
	method nombreReal(){
		return "Rex"
	}
	method jugar(persona){
		persona.aumentarFelicidad(potenciador*2)
		companiero.jugar(persona)
	}
	method jugarVideojuegos(){
		potenciador *= 2
	}
	method cambiarCompaniero(juguete){
		companiero = juguete
	}
	method buenEstado(){
		return companiero.buenEstado()
	}
	method reparar() {
		companiero.reparar()
	}
}

object molly {
	var felicidad = 400
	
	method manotear(juguete) {
		juguete.jugar(self)
	}
	
	method aumentarFelicidad(cantidad) {
		felicidad += cantidad
		felicidad = felicidad.min(500)
	}
	method nivelFelicidad() {
		return felicidad 
	}
	method juegaConMuniecas() = true
	
}

object barbie {
	method buenEstado() = true
	
	method jugar(persona) {
		if(persona.juegaConMuniecas()) persona.aumentarFelicidad(50) 
	}
	
	method nombreOriginal() = "la barbie guia"
	
	method reparar() {}
}

object reparador {
	method reparar(juguete){
		juguete.jugar(self)
		juguete.reparar()
	}
	method aumentarFelicidad(cantidad) { }
	method juegaConMuniecas() = false
}