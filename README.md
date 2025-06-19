# 📡 GameVault API – Backend en Vapor

---

## 📌 Descripción del proyecto

Este repositorio contiene la **API REST** desarrollada con **Vapor (Swift)** que alimenta la aplicación **GameVault** para macOS. Expone endpoints que permiten obtener información de **videojuegos** y **empresas** desarrolladoras. La API está desplegada en la nube y lista para ser consumida por cualquier cliente compatible con HTTP.

---

## 🌐 URL pública de la API (DigitalOcean)

- 🔗 **GET /videojuegos**  
  [https://whale-app-f76gv.ondigitalocean.app/videojuegos](https://whale-app-f76gv.ondigitalocean.app/videojuegos)

- 🔗 **GET /companies**  
  [https://whale-app-f76gv.ondigitalocean.app/companies](https://whale-app-f76gv.ondigitalocean.app/companies)

---

## 🛠️ Tecnologías utilizadas

- 💻 **Vapor** – Framework web en Swift
- 🧱 **Swift 5+**
- ☁️ **DigitalOcean** – Despliegue en la nube
- 🐳 **Docker** – Contenedores para despliegue
- 🗃️ **MySQL** – Base de datos relacional

---

## 🧪 Endpoints disponibles

### Videojuegos
| Método | Endpoint                  | Descripción                      |
|--------|---------------------------|----------------------------------|
| GET    | `/videojuegos`           | Lista todos los videojuegos     |
| GET    | `/videojuegos/{id}`      | Obtiene un videojuego por ID    |
| POST   | `/videojuegos`           | Crea un nuevo videojuego        |
| PUT    | `/videojuegos/{id}`      | Actualiza un videojuego         |
| DELETE | `/videojuegos/{id}`      | Elimina un videojuego           |

### Empresas
| Método | Endpoint               | Descripción                     |
|--------|------------------------|---------------------------------|
| GET    | `/companies`          | Lista todas las empresas        |
| GET    | `/companies/{id}`     | Obtiene una empresa por ID      |
| POST   | `/companies`          | Crea una nueva empresa          |
| PUT    | `/companies/{id}`     | Actualiza una empresa           |
| DELETE | `/companies/{id}`     | Elimina una empresa             |

---

## ▶️ Instrucciones para correr localmente

### 🔧 Requisitos previos

- Swift 5.9+
- Vapor Toolbox (`brew install vapor`)
- Docker (para base de datos)
- MySQL (opcional si usas tu propio entorno)

### 🚀 Pasos para ejecución local:

```bash
git clone https://github.com/SinckCode/gameVault-Api.git
cd gameVault-Api

# Crea archivo .env con tus credenciales de base de datos
cp .env.example .env

# Construye y corre el proyecto
vapor build
vapor run
