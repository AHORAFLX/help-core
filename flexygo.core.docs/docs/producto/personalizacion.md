# Personalización

Flexygo Core permite personalizar la apariencia visual del producto sin modificar el núcleo de la plataforma. Las personalizaciones se realizan en archivos dentro del proyecto Frontend y **sobreviven a las actualizaciones de la aplicación**.

---

## Organización de archivos de personalización

```
{Nombre}.Frontend/
└── wwwroot/
    └── custom/
        ├── css/
        │   ├── skins/
        │   │   └── CssVars.less   ← Variables de color propias del producto
        │   └── account.css        ← Estilos de las páginas de autenticación
        └── images/
            └──                    ← Imágenes personalizadas (logo, marca de agua…)
```

Estos archivos están fuera del código de Flexygo Core y se mantienen intactos en cada actualización.

---

## Variables de color del producto

Las variables de color del producto se definen en:

```
{Nombre}.Frontend/wwwroot/custom/css/skins/CssVars.less
```

!!! warning "Ruta y nombre obligatorios"
    El archivo debe llamarse exactamente `CssVars.less` y estar en la ruta `wwwroot/custom/css/skins/`. Cualquier otra ubicación o nombre será ignorado por Flexygo Core.

Este archivo usa **Less** y la función `dbColor()` para leer colores almacenados en base de datos, exponiéndolos luego como variables CSS estándar para usarlos en todo el producto.

```less
// Mapeo de colores desde base de datos
@ad-mensajes-user:  dbColor(ADMessageUser);
@ad-mensajes-agent: dbColor(ADTicketsUser);
@ad-note:           dbColor(noteTickets);

// Exposición como variables CSS
:root {
    --ad-mensajes-user:  @ad-mensajes-user;
    --ad-mensajes-agent: @ad-mensajes-agent;
    --ad-note:           @ad-note;
}
```

Una vez definidas, las variables `--ad-*` están disponibles en cualquier hoja de estilos del producto.

### Registro de variables en base de datos

Para que `dbColor()` pueda resolver el valor de una variable, esta debe estar dada de alta en la tabla **`Skins_Variables`** de la base de datos de configuración. Puedes hacerlo de dos formas:

- **Directamente en la tabla** `Skins_Variables`, insertando la fila con el nombre de la variable y su valor.
- **Desde el apartado Skins** de la aplicación, abriendo el skin activo y añadiendo una nueva variable desde la interfaz.

!!! warning "Incluye las variables en los scripts del proyecto"
    Toda variable nueva que añadas debe estar scriptada en los archivos de base de datos del proyecto (`{Nombre}.Conf.Database`). Si no la incluyes en los scripts, se perderá al publicar la base de datos en otro entorno o al hacer una instalación limpia.

---

## Páginas de autenticación

Los estilos de las páginas de Login, Olvidé mi contraseña, 2FA y similares se controlan en:

```
{Nombre}.Frontend/wwwroot/custom/css/account.css
```

!!! warning "Ruta y nombre obligatorios"
    El archivo debe llamarse exactamente `account.css` y estar en la ruta `wwwroot/custom/css/`. Cualquier otra ubicación o nombre será ignorado por Flexygo Core.

Este archivo se carga automáticamente en todas las páginas de autenticación. Puedes sobrescribir cualquier aspecto visual: fondos, colores, logos, botones, etc.

Las variables CSS más habituales para personalizar son:

```css
:root {
  /* Imágenes */
  --ah-product-logo:  url('isotipo.png');       /* Icono circular del header */
  --ah-wordmark:      url('logo.png');           /* Logotipo de marca */
  --ah-watermark:     url('background_isotipo.png'); /* Marca de agua de fondo */

  /* Colores */
  --primary-color:    #2E64C2 !important;
  --ah-bg-1:          rgba(2, 30, 115, 1);       /* Color inicio del degradado */
  --ah-bg-2:          rgba(0, 183, 255, 1);       /* Color fin del degradado */
  --ah-btn:           #2e64c2;                    /* Color del botón principal */
  --ah-btn-hover:     #3b73d1;
}
```

!!! tip "Sobrescritura segura"
    Añade únicamente las reglas que quieras cambiar. No modifiques los archivos CSS del Core — esos cambios se perderán en la próxima actualización.