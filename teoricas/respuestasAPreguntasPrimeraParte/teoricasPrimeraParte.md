# Preguntas Teóricas - Primera Parte 

### Según Peter Naur el conocimiento del programador que tiene la teoría de un programa trasciende el de su documentación en al menos tres áreas. Citar brevemente esas 3 áreas.

Para Naur, la teoría del programador trasciende a la documentación en que permite:
- Explicar **cómo** el programa modela la realidad.
- Explicar **por qué** ese modelo es así y no de otra forma.
- **Modificar el programa** cuando la realidad cambia, gracias al entendimiento profundo que tiene el programador.


### Explique la psicología de la causalidad en torno al diseño de objetos cotidianos según Norman. Dé un ejemplo.

Norman explica que las personas generan **causalidad mental**: relacionan acciones con resultados.  
El diseño debe facilitar esa relación para que el usuario entienda qué acción produce qué efecto.

**Ejemplo:** una perilla con un ícono de volumen indica intuitivamente que rotarla lo sube o baja. Si no transmite esa causalidad (por ejemplo una perilla sin señalización), el usuario no sabe qué esperar.


### Explique cómo varía el acoplamiento al partir de una solución con un método principal en algún objeto, donde luego ese método se reifica en un Method Object.

El Method Object **reduce el acoplamiento del método con la clase original** porque:
- Las variables temporales y parámetros pasan a ser estado interno del nuevo objeto.
- El método deja de ser gigante y se divide en pasos más simples dentro del nuevo objeto.
- La clase original queda menos cargada y delega responsabilidad.

**Conclusión:** el acoplamiento baja, porque el comportamiento complejo se encapsula fuera del objeto principal.


### Explicar brevemente la noción de teoría según Ryle.

Para Ryle, la teoría implica no solo saber **hacer algo**, sino también **saber explicarlo**, **justificarlo** y **razonar sobre ello**.  
Naur retoma esta idea para definir que programar es construir teoría, no solo código.


### Según Norman ¿Para qué sirve un modelo conceptual?

El modelo conceptual es la idea mental del usuario sobre **cómo funciona el objeto**.  
Sirve para predecir el resultado de sus acciones y poder usarlo efectivamente sin instrucciones extensas.


### Nombre y explique las 3 ideas en las que se basa Self.

Self se basa en:
- **Concreción:** no hay diferencia entre clase e instancia; todo es objeto.
- **Economía conceptual:** pocos conceptos con gran poder expresivo.
- **Mensaje como mecanismo fundamental:** todo acceso se hace por envío de mensajes usando *slots*.


### En “Programming as Theory Building” ¿A qué concepción de la programación se opone Naur? ¿Qué alternativa plantea?

Se opone a la idea de programar como **solo escribir código y documentación**.  
Propone la visión alternativa de que programar es **construir teoría**, conocimiento profundo sobre el dominio y el programa que permite entenderlo, modificarlo y justificarlo.


### En “Programming as Theory Building” ¿Cómo define Peter Naur la vida, muerte y resurrección de un programa?

- **Vida:** cuando la teoría está viva en los programadores que lo desarrollan.
- **Muerte:** cuando los autores se van y la teoría no se transmite.
- **Resurrección:** cuando un nuevo grupo recupera la teoría contactando a los desarrolladores originales.


### Según Naur ¿Cuándo se considera que un programa está muerto? ¿Es posible revivirlo?

Está muerto cuando ningún programador conserva la teoría del sistema.  
Puede revivirse solo si alguien hereda dicha teoría de quienes la tenían.


### En “No Silver Bullet” ¿Qué potenciales balas de plata enumera y discute Brooks? Mencione 4.

Brooks dice que no existe una bala de plata para eliminar la complejidad esencial, pero discute tecnologías que ayudan parcialmente:

- **OOP:** mejora modularidad y reutilización, pero no resuelve esencia del software.
- **Prototipado rápido:** ayuda a lidiar con requisitos cambiantes, pero no elimina complejidad.
- **IA:** puede automatizar tareas específicas, pero no entiende conceptos complejos.
- **Program verification/testeo automático:** reduce errores accidentales, no la complejidad del diseño.


### En “No Silver Bullet” ¿Cuáles son las propiedades inherentes a la esencia del software según Brooks?

Son: **complejidad, capricho, modificabilidad e invisibilidad.**

### Según Brooks ¿Cómo se clasifican las dificultades en el desarrollo de software?

- **Esenciales:** propias de modelar conceptos complejos y abstractos del software, imposibles de eliminar totalmente.
- **Accidentales:** derivadas de la implementación (lenguaje, hardware, herramientas).


### Según Brooks ¿Cuáles son las propiedades inherentes a las dificultades esenciales del software? Descríbalas.

- **Complejidad:** el software crece irregularmente, no por repetición como en otras industrias.
- **Capricho (conformidad):** depende de requisitos humanos arbitrarios y no de las leyes naturales.
- **Modificabilidad:** siempre se espera que pueda cambiar fácilmente para satisfacer más usuarios.
- **Invisibilidad:** al ser abstracto, cuesta comprender su estructura.


### Explique la paradoja de la tecnología según Norman.

La complejidad de uso sigue una forma de U:
1. Al inicio es compleja y difícil de usar.
2. Luego madura y se vuelve simple y poderosa.
3. Finalmente, agregar funcionalidad extra la vuelve otra vez compleja.

Cuanto más poderosa, más probable que vuelva a ser difícil de usar.


### Mencione una ventaja y una desventaja del patrón Object Recursion.

**Ventaja:** distribuye responsabilidad, evita romper encapsulamiento y permite manejar estructuras complejas sin conocer su forma interna.  
**Desventaja:** puede volver el diseño difícil de entender si se usa sin control.


### Explique a qué se refiere Dan Ingalls cuando habla de que Smalltalk fue construido alrededor de una poderosa metáfora uniforme.

La metáfora es **"todo es un objeto"** y **todo ocurre por envío de mensajes**.  
Esto unifica el diseño y hace que el lenguaje sea coherente y comprensible en todos sus niveles.


### Según Polymorphic Hierarchy ¿qué es una jerarquía polimórfica y cuál es el rol de la Template Class?

Jerarquía polimórfica: conjunto de clases que responden a los mismos mensajes.  
La Template Class define el **qué** (propósito) y las subclases implementan el **cómo**.


### Explique la frase “Fortunately the solution to dealing with multiple polymorphism is available in all existing object-oriented languages”.

Significa que para manejar double dispatch **no hace falta un nuevo lenguaje**:  
se puede implementar en cualquier lenguaje OO mediante **crear una familia de métodos especializados y delegar la responsabilidad correctamente**, evitando `if` por tipo.


### Decida si las siguientes afirmaciones son verdaderas o falsas:

- **El “Handler” en Object Recursion siempre actúa como un “Terminator”.**  
  **Falso.** A veces actúa como terminador, pero otras solo delega la solicitud hacia sus hijos.

- **El Object Recursion requiere que todos los objetos sean del mismo tipo.**  
  **Verdadero.** Deben ser polimórficos y responder al mismo protocolo para recorrer la estructura.

### ¿Cuál es la motivación principal para utilizar un “Null Object”? Dar un pequeño ejemplo de uso.

La motivación es **evitar condicionales repetitivos para verificar null**, permitiendo que la ausencia de un objeto se trate como un objeto válido con comportamiento neutro. Además de que verificar si es nil puede traer errores. 
Simplifica el código, mejora la legibilidad y reduce errores.

**Ejemplo:**

Podemos hacer que un objeto haga algo que sea, por ejemplo, notificar. 
Sin el Null object tenemos que verificar si ese objeto es nil o si podemos enviar el mensaje.
Encambio con NullObject podemos simplemente mandar el mensaje, en caso de ser null no va a hacer nada.

### Describa la estructura de clases y la función que cada una cumple del patrón “Object Recursion”.

El patrón **Object Recursion** permite procesar estructuras recursivas delegando en los objetos mismos.

Estructura:
- Componente/Handler (interfaz): define el mensaje común al que todos los componentes tienen que saber responder.
- Nodo/Composite: tiene referencias a otros handlers y delega la operación para continuar la recursión.
- Terminator/Hoja/Null Handler: no delega, finaliza la recursión devolviendo caso base.

Cada objeto conoce cómo continuar sin lógica externa ni ifs por tipo.