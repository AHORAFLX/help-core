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
services:
  flx-frontend:
    image: flexygo/flexygo-frontend
    restart: unless-stopped
    environment:
      ASPNETCORE_ENVIRONMENT: "Development"
    ports:
      - "${FRONTEND_PORT}:8080"
    volumes:
      - flx-front-conf:/app/conf
      - flx-front-custom:/app/custom
    networks:
      - flx-front-network
    depends_on:
      - flx-backend

  flx-backend:
    image: flexygo/flexygo-backend
    restart: unless-stopped
    environment:
      ASPNETCORE_ENVIRONMENT: "Development"
      MSSQL_SA_PASSWORD: "${SQL_PASSWORD}"
    ports:
      - "60952:8080"
    volumes:
      - flx-back-conf:/app/conf
      - flx-back-custom:/app/custom
    networks:
      - flx-front-network
      - flx-back-network
    depends_on:
      flx-db:
        condition: service_healthy

  flx-db:
    image: flexygo/flexygo-db
    restart: unless-stopped
    environment:
      ACCEPT_EULA: "Y"
      MSSQL_SA_PASSWORD: "${SQL_PASSWORD}"
      MSSQL_PID: "Evaluation"
    networks:
      - flx-back-network
    volumes:
      - flx-db-data:/var/opt/mssql/data/
      - flx-db-log:/var/opt/mssql/log/
      - flx-db-secrets:/var/opt/mssql/secrets/

networks:
  flx-front-network:
    driver: bridge
  flx-back-network:
    driver: bridge

volumes:
    flx-front-conf:
    flx-front-custom:
    flx-back-conf:
    flx-back-custom:
    flx-db-data:
    flx-db-log:
    flx-db-secrets:
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

- **Frontend**: [http://localhost:${FRONTEND_PORT}](http://localhost:${FRONTEND_PORT})
- **Backend (API)**: [http://localhost:60952/swagger](http://localhost:60952/swagger)
- **Base de datos (SQL Server)**: usuario `sa`, contraseña la que hayas definido

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
