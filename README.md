Innovatech - Gestión de Ventas y Despachos

Integrantes:
 - Román Núñez
 - Katherinna Candia

# Descripción

Innovatech es una aplicación sencilla desarrollada como parte de la tercera evaluación de la asignatura de DevOps.
El sistema permite administrar ventas y despachos mediante una interfaz web. Para ello se desarrollaron dos microservicios independientes que trabajan sobre una 
base de datos MySQL y son consumidos desde un frontend realizado en React.
El principal objetivo de este proyecto no fue desarrollar una aplicación compleja, sino aplicar distintas herramientas utilizadas actualmente en procesos DevOps, 
automatizando el despliegue de toda la solución sobre AWS.

---

# Objetivos

Durante esta evaluación se buscó:

* Contenerizar cada componente de la aplicación utilizando Docker.
* Integrar la aplicación con una base de datos MySQL ejecutándose dentro del entorno contenerizado, reemplazando la base de datos que anteriormente se utilizaba directamente desde AWS.
* Publicar las imágenes en Amazon Elastic Container Registry (ECR).
* Desplegar la solución sobre un clúster de Amazon EKS.
* Administrar los contenedores mediante Kubernetes.
* Automatizar el proceso de integración y despliegue utilizando GitHub Actions, permitiendo que cada cambio enviado al repositorio se despliegue de forma automática.

# Tecnologías utilizadas

- Java 17
- Spring Boot
- React + Vite
- MySQL
- Docker
- Docker Compose
- Kubernetes
- Amazon EKS
- Amazon ECR
- GitHub Actions
- AWS CLI

# Arquitectura

La solución está compuesta por cuatro componentes principales:

* Frontend desarrollado con React.
* Microservicio de Ventas.
* Microservicio de Despachos.
* Base de datos MySQL.

Cada componente fue contenerizado mediante Docker y desplegado en Kubernetes utilizando Deployments y Services independientes.
A diferencia de la versión desarrollada anteriormente, en esta evaluación la base de datos también forma parte del despliegue, ejecutándose como un contenedor administrado por Kubernetes, permitiendo que toda la aplicación funcione de manera integrada dentro del clúster.
El frontend consume las APIs expuestas por los microservicios de Ventas y Despachos mediante los servicios publicados con LoadBalancer en Amazon EKS.


# Despliegue

Para desplegar la aplicación se realizaron las siguientes etapas:

- Creación de imágenes Docker para el frontend, ambos microservicios y la base de datos.
- Publicación de las imágenes en Amazon ECR.
- Creación y configuración del clúster de Amazon EKS.
- Configuración del Namespace del proyecto.
- Creación de Secrets para almacenar de forma segura las credenciales de MySQL.
- Creación de Deployments y Services para cada componente de la aplicación.
- Configuración del Horizontal Pod Autoscaler (HPA) para los microservicios.
- Validación del funcionamiento mediante métricas de Kubernetes y pruebas de acceso a la aplicación.



# Integración y Despliegue Continuo

Se implementó una pipeline utilizando GitHub Actions.
Cada vez que se realiza un push a la rama principal del repositorio:

- Se construyen nuevamente las imágenes Docker.
- Las imágenes son publicadas en Amazon ECR.
- Se actualizan los despliegues en Amazon EKS.
- Kubernetes reemplaza automáticamente los pods por la versión más reciente de la aplicación.

Con esto se evita realizar el proceso de despliegue manual cada vez que existe una modificación en el proyecto.


# Validaciones realizadas

Durante el desarrollo se comprobó el correcto funcionamiento mediante:

- Construcción de imágenes Docker.
- Publicación en Amazon ECR.
- Despliegue exitoso en Amazon EKS.
- Verificación del estado de Pods y Services.
- Validación de métricas utilizando `kubectl top`.
- Configuración y funcionamiento del HPA.
- Consumo de las APIs desde el frontend.
- Validación de los endpoints mediante Swagger.
- Ejecución exitosa del workflow de GitHub Actions.


# Observaciones

Durante el desarrollo surgieron distintos inconvenientes relacionados principalmente con la configuración de imágenes Docker, variables de entorno, comunicación entre servicios 
y despliegue sobre Kubernetes.
Cada uno de estos problemas fue solucionado durante la implementación, permitiendo finalmente desplegar la aplicación completa sobre Amazon EKS y automatizar su 
actualización mediante GitHub Actions.
Como trabajo futuro, aún es posible mejorar algunos aspectos del frontend, especialmente relacionados con la actualización automática de la información luego de realizar 
ciertas operaciones sobre los despachos.


# Conclusión

Este proyecto permitió aplicar de forma práctica los principales conceptos vistos durante la asignatura, integrando herramientas ampliamente utilizadas en entornos DevOps.
Además de aprender a contenerizar aplicaciones con Docker, fue posible desplegarlas sobre Kubernetes utilizando Amazon EKS, administrar imágenes mediante 
Amazon ECR y automatizar completamente el proceso utilizando GitHub Actions, logrando una solución funcional y cercana a un flujo de trabajo real.
