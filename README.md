# Amigo Fiel: Una historia de juguetes

### Colecciones y bloques - Ejercicio para práctica de programación orientada a Objetos 1
 
[![Build Status](https://travis-ci.org/wollok/ColeccionesAmigoFiel.svg?branch=master)](https://travis-ci.org/wollok/ColeccionesAmigoFiel)

<img src="https://soydecine.com/wp-content/uploads/toy-story-personajes.jpg" width="800"/>

En esta historia, vamos a modelar algunos personajes conocidos (y sus interacciones) en nuestro entorno de programación Wollok. 


Presentamos a:

### andy

<img src="https://static.wikia.nocookie.net/toystory/images/0/03/Andy-woody-toy-story-pixar.jpg/revision/latest/top-crop/width/360/height/450?cb=20201013022612&path-prefix=es" width="100"/>
Un niño que le encanta jugar con sus juguetes, y de quién vamos a querer saber su nivel de felicidad, que va a ir cambiando según las distintas acciones que realice. Inicialmente comienza con 200 de felicidad.<br>
Nuestro amigo tiene en su cuarto varios juguetes que los irá agarrando para luego jugar con todos ellos. A veces decide agarrar 1 juguete, y otras veces 2 o más juguetes. Todos sabemos que estos juguetes también juegan y eso es muy importante en este modelo, ya que pasarán diferentes cosas con esos juguetes cuando jueguen con Andy.

Primero vamos a conocer las cosas que puede hacer Andy:
- `agarrarJuguete(juguete]`: Lo toma de su cuarto para usarlo en su aventura.
- `perderJuguete(juguete)`: Lo pierde de vista en su cuarto y ya no puede jugar con él.
- `aburrirse(minutos)`: Según la cantidad de minutos, la felicidad de Andy disminuye en 10 por cada minuto de aburrimiento. Su felicidad no puede ser menos que cero. 
- `dormir()`: Cuando Andy duerme, su felicidad se restaura a su valor inicial.
- `jugar()`: Andy juega con todos los juguetes que agarró de su cuarto sin importar su estado.
- `pasarLaNoche()`: Andy duerme y además aumenta su felicidad 20 veces por cada juguete que agarró de su cuarto y que esté en buen estado.

En el cuarto de Andy podemos encontrarnos con los siguientes juguetes que él podría agarrar:

- _woody_: Conoce su nivel de pintura, que comienza en 100, y cada vez que juega con alguien pierde 5 unidades de pintura. Al `tirarDelCordon()` que está en su espalda, sabe decir *alguna* de las `frasesDelCordon` que tiene guardada en su memoria. También sabe `hacerseElGalan(frase)` incorporando frases nuevas en su casi infinita memoria de frases. Cada vez que woody juega con alguien, le aporta una cantidad de felicidad igual a la cantidad de letras de todas las frases que tiene memorizadas. Vamos a considerar que woody está en `buenEstado()` si su nivel de pintura es mayor a 50. 
- _buzz_: Tiene un nivel de energía, que inicialmente es 100. Cuando un niño o niña juega con él, ejecuta su acto programado que tiene la siguiente secuencia: `volar`, `tirarRayosLaser` en cantidad = 10, volver a `volar` y `tirarRayosLaser` una última vez (cantidad=1). Cada vez vez que buzz vuela, le otorga al niño o niña que juega con él, el doble de su energía actual en felicidad, y a continuación pierde la mitad de su energía. Al tirarRayosLaser recupera 20 puntos de energía por la cantidad de rayos que emite. Vamos a considerar que buzz está en `buenEstado()` cuando su nivel de energía sea mayor a 100. 
- _rex_: Tiene un potenciador que comienza en 1, y puede duplicarlo cada vez que juega a un videojuego. También conoce en todo momento a su companiero de juego que es otro de los juguete del cuarto de Andy. Inicialmente su companiero es woody, pero puede cambiar.  Cuando un niño o niña juega con rex, aumenta su felicidad en un valor que es el doble del valor del potenciador de rex, y además, juega también con ellos el companiero actual de rex. Consideramos que rex está en `buenEstado()` cuando su companiero también lo está. 
<br>

Incorporamos a la hermana de andy:
<br>
### molly
<img src="https://static.miraheze.org/drawnfeetwiki/8/80/367230_1264713620292_full.jpg" width="150"/>
Molly, la hermana de Andy, también posee su nivel de felicidad que comienza con 400. Como todavía es una beba, y le encanta llevar de un lado a otro de la casa sus juguetes, suele dejarlos en el cuarto de Andy y además puede `manotear` alguno de los juguetes que Andy eligió para su aventura o que están en el cuarto aunque no los haya elegido Andy, pero solo puede jugar con 1 juguete a la vez. Cada vez que Molly manotea un juguete, se produce el mismo efecto que si jugara Andy con ese juguete. <br>

Vamos a agregar al modelo un juguete más que es de Molly, aunque le gusta dejarlo en el cuarto de Andy:
- _barbie_: No nos interesa saber su nivel de pintura ya que está fabricado con un material que no se deteriora. No posee nivel de energía ni potenciador. Y puede ser seleccionado por Andy para su juego y también lo puede usar Molly. (Ayudita: revisar si hay métodos polimórficos)
<br>
Además todos los juguetes saben decir cual es su `nombreOriginal()` según corresponda: 
"El vaquero Woody","Buzz Lightyear","Rex","La Barbie Guia" <br>

Entonces, también podemos preguntarle a Andy que nos diga el nombre de todos los juguetes que eligió para jugar su aventura `nombresJuguetes()`

<br>
<br>
Con el paso del tiempo y los juegos, Andy se dan cuenta que algunos de los juguetes necesitan algo de mantenimiento. <br>
Entonces vamos a recurrir a un nuevo personaje:
<br>

### reparador
<img src="https://mx.web.img3.acsta.net/r_1280_720/newsv7/19/06/21/01/24/33183820.jpg" width="150"/>

No necesitamreos conocer su nivel de felicidad, pero si podremos pedirle lo siguiente:
- `reparar(juguete)`: Antes de aplicar la reparación correspondiente para cada juguete, juega con él para diagnosticar apropiadamente el tipo de reparación a realizar. Luego se pone a trabajar y como resultado, cada juguete queda casi como nuevo, recuperando sus valores iniciales.

