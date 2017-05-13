#Imagen de glasfish
FROM glassfish:latest

#Copiamos los war a la carpeta del glassfish para que se haga el autodeploy
COPY WSEsfera.war /usr/local/glassfish4/glassfish/domains/domain1/autodeploy/WSEsfera.war
COPY WSEsferaCliente.war /usr/local/glassfish4/glassfish/domains/domain1/autodeploy/WSEsferaCliente.war

#Indicamos cual es el directorio de trabajo en el contenedor para luego correr el comando cmd desde allí.
WORKDIR     /usr/local/glassfish4
#Iniciamos el servidor
CMD         asadmin start-domain --verbose
