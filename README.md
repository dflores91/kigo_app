# Kigo App

Bienvenido a la documentación de la última versión de nuestra aplicación desarrollada con Flutter.

## Descripción

Esta aplicación es un mock que incluye varias pantallas esenciales para una experiencia de usuario básica. A continuación, se describe la funcionalidad principal:

1. **Splash Screen:**
   - La aplicación comienza con una pantalla de presentación que proporciona una experiencia visual atractiva al usuario 

   - Para versiones de Android anteriores a 12 (API nivel 31), se utiliza el enfoque tradicional del tema `@style/Theme.Splash`.

    - Para versiones de Android 12 y superiores, se implementa el nuevo Splash Screen API (`@style/Theme.SplashScreen`), aprovechando las mejoras de rendimiento y personalización que proporciona.

2. **Validación del Número de Teléfono:**
   - En la siguiente pantalla, el usuario puede ingresar su número de teléfono, limitado a un máximo de diez dígitos (al ser un mock solo funciona la validación con el numero 2222222222). Esta información es esencial para la validación del usuario.

3. **Validación del Código por SMS:**
   - Después de ingresar el número de teléfono, se enviará un código por SMS al número proporcionado (al ser un mock solo debe ingresarse una secuencia de numero del 1 al 6). En esta pantalla, el usuario deberá ingresar el código recibido para la verificación. Si el código es correcto, se redirigirá al usuario a la pantalla principal (Home); de lo contrario, se mostrará un mensaje de error.

## Diseño en Figma

El diseño de esta aplicación fue creado previamente en Figma. Puedes encontrar el diseño [aquí](https://www.figma.com/file/8U1eAP9Y8WSuIhoJ8JiYXa/Kigo-Test?type=design&node-id=0-1&mode=design&t=5HvoWVmvBQ9fM6FR-0). Utilizamos este diseño como base para garantizar una interfaz coherente y atractiva.

## Requisitos del Sistema

- Flutter: [Versión 3.16.0](https://docs.flutter.dev/get-started/install) (asegúrate de tener la última versión instalada).

## Guía de Instalación

1. Clona este repositorio en tu máquina local.

    ```bash
    git clone https://github.com/dflores91/kigo_app.git
    ```

2. Accede al directorio del proyecto.

    ```bash
    cd kigo_app
    ```

3. Instala las dependencias.

    ```bash
    flutter pub get
    ```

4. Ejecuta la aplicación.

    ```bash
    flutter run
    ```

¡Listo! Ahora puedes explorar y probar la aplicación en tu dispositivo o emulador.

## Contribuciones

Siéntete libre de contribuir a este proyecto. Puedes abrir problemas (issues) o enviar solicitudes de extracción (pull requests).
