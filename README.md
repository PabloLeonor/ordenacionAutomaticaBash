# ordenacionAutomaticaBash
Un script de bash que permite ordenar rápidamente un directorio

Imagine por un momento su directorio descargas, seguro que ha descargado fotos, videos, música, tal vez algún documento, puede ser lo que sea, y su directorio de descargas está llena.
Es un problema común que los directorios de descargas de multitud de usuarios se llenen hasta la saciedad y luego cueste tiempo clasificar cada cosa.
Ahí es donde entra en juego este script, que permite llevar ficheros generales a los directorios predefinidas de LINUX (porque sí, esto es bash para linux).

¿cómo se ejecuta?

En primer lugar, copie el código de "ordenacion.sh" en su propio fichero .sh o descárguelo.
Abra su terminal de linux en el directorio donde se encuentre el fichero .sh  y ejecute el script escribiendo "./ordenacion.sh" o cualquier otro nombre que le haya puesto.
A continuación, verá lo siguiente escrito:

<pre>
<span style="background-color:#06989A"><b>Bienvenido al sistema de ordenación de ficheros</b></span>
Por favor, introduzca un directorio a ordenar: 
</pre>

Justo aquí debería escribir la dirección del directorio a ordenar, por ejemplo, si es Descargas(como se pensó al diseñar este script) debería escribir algo así

/home/nombre de su usuario/Descargas

si el directorio existe, empezará calsificar los diferentes ficheros y al terminar le mostrará el siguiente mensaje:

<pre>
<span style="background-color:#4E9A06"><font color="#2B2B2B">Ficheros ordenados</font></span>
¿Quieres ordenar otro directorio? (S/N): 
</pre>

Al escribir S, usted puede seleccionar otro directorio que clasificar, si no, se cerrará el script.
