# Despliegue con Docker

Flexygo Core puede desplegarse fácilmente en contenedores Docker mediante un archivo `docker-compose.yml` que agrupa las tres imágenes necesarias:

- `flexygo-db` (base de datos SQL Server)
- `flexygo-backend` (Web API)
- `flexygo-frontend` (interfaz web)

---

## 🚀 Requisitos

Antes de empezar, asegúrate de tener instalado:

- [Docker](https://www.docker.com/products/docker-desktop)
- [Docker Compose](https://docs.docker.com/compose/)

---

## 🛠️ Paso 1: Crear el archivo `docker-compose.yml`

Copia este contenido en un archivo llamado `docker-compose.yml`:

```yaml
version: "3.8"

services:
  db:
    image: dockerbeta.ahorabh.com/flexygo-db
    container_name: flexygo-db
    ports:
      - "1433:1433"
    environment:
      - SA_PASSWORD=TuPasswordSegura123
      - ACCEPT_EULA=Y

  backend:
    image: dockerbeta.ahorabh.com/flexygo-backend
    container_name: flexygo-backend
    depends_on:
      - db
    ports:
      - "5000:80"
    environment:
      - ConnectionStrings__DefaultConnection=Server=db;Database=Flexygo;User=sa;Password=TuPasswordSegura123

  frontend:
    image: dockerbeta.ahorabh.com/flexygo-frontend
    container_name: flexygo-frontend
    depends_on:
      - backend
    ports:
      - "8080:80"
```

> **⚠️ Importante:** Cambia `TuPasswordSegura123` por una contraseña real y segura para SQL Server.

---

## ▶️ Paso 2: Levantar todo el entorno

En el mismo directorio donde tengas el archivo `docker-compose.yml`, ejecuta:

```bash
docker compose up -d
```

Esto descargará las imágenes necesarias y levantará todo automáticamente.

---

## 🧭 Acceder a la aplicación

Una vez finalizado el arranque:

- **Frontend**: [http://localhost:8080](http://localhost:8080)
- **Backend (API)**: [http://localhost:5000](http://localhost:5000)
- **Base de datos (SQL Server)**: puerto `1433`, usuario `sa`, contraseña la que hayas definido

---

## 🧹 Parar o reiniciar

Para detener y eliminar todos los contenedores:

```bash
docker compose down
```

Para ver los logs del backend:

```bash
docker logs flexygo-backend
```
