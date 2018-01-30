#Ejercicio 11

#### 1. Instalar a partir de docker una imagen alternativa de Ubuntu y alguna adicional, por ejemplo de CentOS

Al igual que en el ejercicio 10 introducimos la orden "sudo docker pull ubuntu", de forma análoga se hace con centos:

	sudo docker pull centos

#### 2. Buscar e instalar una imagen que incluya MOngoDB

En el repertorio de imágenes de Docker, hay una que incluye mongodb (aunque siempre podríamos instalarlo automáticamente desde un Dockerfile).

Para descargarla, tecleamos la orden:

	docker pull dockerfile/mongodb