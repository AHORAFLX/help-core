## Flujo de actualización

A continuación se muestra el flujo completo del proceso de actualización de Flexygo Core:

```mermaid
flowchart TD
    A[Usuario pulsa 'Actualizar versión' en Flexygo Core] --> B{¿Front y Back en mismo servidor?}
    B -- Sí --> C[Backend actualiza su Updater y el del Frontend]
    B -- No --> D[Backend avisa a Frontend para que actualice su Updater]
    C --> E[Updaters de Frontend y Backend notifica a sus aplicaciones]
    D --> E
    E --> F[Frontend y Backend validan requisitos]
    F --> G{¿Validaciones correctas?}
    G -- No --> H[Mostrar error y detener proceso]
    G -- Sí --> I[Descargar y preparar NuGets de la nueva versión]
    I --> J{Aplicación a actualizar}
    J -- Frontend --> K[Copiar nuevo contenido y personalizaciones]
    J -- Backend --> L[Copiar contenido, personalizaciones, backup BD y aplicar DACPAC]
    K & L --> M[Paso final: Configuración IIS, renombrar app y BD, mergear appsettings]
    M --> N[Aplicación lista en la nueva versión]
```
!!! tip "Resumen"
    Como vemos en el diagrama anterior, el proceso de actualización de Flexygo Core coordina Frontend y Backend para validar, descargar y preparar la nueva versión, realizar los backups necesarios y finalizar con la actualización de archivos, base de datos y configuración, asegurando así una actualización rápida y segura.