# Raven test
### Ambientación para el proyecto
Clonar un repositorio extrae una copia integral de todos los datos del mismo que tiene en ese momento, incluyendo todas las versiones para cada archivo y carpeta para el proyecto.
Clone el proyecto ejecutando el siguiente comando:

```git clone https://github.com/porrasalexis10/raven.git```

### Configuración inicial
Desde línea de comandos coloquese en la ubicación del proyecto clonado y ejecute el comando siguiente para instalar las dependencias de cocoapods.

```pod install```

### Estructura de archivos y directorios
El proyecto cuenta con una estructura de directorios. A continuación se ejemplifica:

 - Raven
   - Raven
     - Utilities (Extensiones, helpers y URLs)
     - Resources (Tipografias, imagenes, colores, db y localizables)
     - Project (Clases del proyecto)
     - Manager (Manager de APIs y DB)
   - Pods


### Requerimientos Funcionales
- [x] Autenticación
- [x] Consulta de Artículos Populares
- [x] Presentación de Datos
- [x] Detalle del Artículo

### Requerimientos No Funcionales
- [x] Codificación y ejecución
- [x] Diseño de Interfaz de Usuario
- [x] Gestión de Errores
- [x] Optimización de Rendimiento
- [x] Detalle del Artículo
- [ ] Pruebas Unitarias
- [x] Arquitectura (MVC ya que era un proyecto sencillo)

> [!NOTE]
> Puntos extras fuera de los requerimientos
> - [x] Pantalla login para ejemplificar el API_KEY proporcionada del servicio de login ( No existe un servicio, solo teniendo datos escritos pasa a la siguiente pantalla)
> - [x] Apartado de perfil para poder cerrar sesión y ejemplificar el uso de eliminado de datos como API_KEY y la información de core data
> - [x] Implementación de tabView para navegación
> - [x] Implementación de gesto "refresh" en pantalla principal para actualizar datos
> - [x] Implementación de link para abrir la noticia completa en pagina web
> - [x] Implementación de manejo de teclado (aunque no se puede editar datos, son hardcodeados)
> - [x] Implementación de condionales por medio de esquemas para datos hardcodeados en modo debug
> - [x] Imagen de raven como aplicativo (disculpa por la resolución, las encontre en internet) 


