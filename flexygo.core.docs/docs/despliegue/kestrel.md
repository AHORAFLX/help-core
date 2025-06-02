# Despliegue con Kestrel

Kestrel es el servidor web integrado que incluye .NET. Es ligero, rápido y multiplataforma, por lo que es ideal para **entornos de desarrollo**, pruebas o despliegues personalizados en entornos controlados.

Actualmente, **Flexygo Core puede ejecutarse directamente con Kestrel sin necesidad de configuraciones adicionales**, aunque en este momento **no contamos con un instalador específico para despliegues finales con Kestrel** como sí hacemos con IIS.

---

## ▶️ Ejecución básica (modo desarrollo)

Para iniciar las aplicaciones frontend y backend usando Kestrel, tienes dos opciones:

### Opción 1: Ejecutables `.exe`

Si has publicado el proyecto con `dotnet publish`, encontrarás archivos `.exe` para cada aplicación:

- Haz doble clic en `Flexygo.WebApp.Frontend.exe`
- Haz doble clic en `Flexygo.WebApp.Backend.exe`

Esto levantará las aplicaciones en sus respectivos puertos (por ejemplo `http://localhost:5000` y `http://localhost:5001`).

### Opción 2: Usar `dotnet run`

<!-- Aquí comienza un bloque de código bash -->
```bash
cd Ruta\Al\Proyecto\Frontend
dotnet run

cd Ruta\Al\Proyecto\Backend
dotnet run
```
<!-- Aquí termina el bloque -->

Esto compilará y levantará ambas aplicaciones directamente.

---

## 🌐 Despliegue con Proxy Inverso (modo producción)

Si quieres exponer las aplicaciones Flexygo a través de un dominio (por ejemplo `https://midominio.com`), lo recomendable es utilizar un **proxy inverso** delante de Kestrel. Esto añade soporte para certificados SSL, balanceo de carga y control de acceso.

Algunas opciones habituales:

- **Nginx** (Linux): muy extendido, eficiente y fácil de configurar
- **Apache** (Linux): clásico y con amplia documentación
- **IIS con ARR** (Windows): también se puede usar como proxy inverso para redirigir a aplicaciones Kestrel

⚠️ Por ahora no proporcionamos una guía oficial de despliegue con Kestrel + proxy, pero puedes consultar la documentación de Microsoft o tu proveedor de hosting para configurarlo.

---

## 🧭 Recomendación actual

- Para desarrollo local: **Kestrel** es ideal por su simplicidad.
- Para producción: **recomendamos usar el instalador con IIS**, que configura todo automáticamente y permite una experiencia más guiada para usuarios finales.

Estamos estudiando opciones para ofrecer en el futuro un despliegue simplificado con Kestrel como alternativa formal.
