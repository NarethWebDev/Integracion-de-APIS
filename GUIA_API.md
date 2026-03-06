# 🚀 Guía de Ejecución - Disney+ Clone con API

## Resumen de Cambios Realizados

✅ **Servidor Dart (bin/server.dart)**
- Endpoints JSON en `/api/movies` y `/api/characters`
- Middleware CORS habilitado
- Corre en http://localhost:8080

✅ **Servicio API (lib/services/api_service.dart)**
- Clase `ApiService` que consume los endpoints del servidor
- Métodos: `getMovies()`, `getCharacters()`, `getMovieById(id)`
- Convierte JSON a modelos Dart

✅ **Actualización Flutter App**
- `HomeScreenWithCarousel` → ahora carga películas desde la API
- `CharactersPage` → ahora carga personajes desde la API
- FutureBuilder para estados de carga y errores
- Botón de reintentar si hay errores

---

## Pasos para Ejecutar

### 1️⃣ SERVIDOR (Terminal 1)

```bash
# Navega a la raíz del proyecto
cd "c:\Users\DELL\Downloads\Trabajos\Ejercicios HTML, CSS, JS y BD\tercer trimestre\cristian ejercicios\Integracion-de-APIS"

# Instala dependencias (si no lo hiciste)
dart pub get

# Ejecuta el servidor
dart run bin/server.dart
```

**Deberías ver:**
```
Servidor escuchando en http://127.0.0.1:8080
Endpoints disponibles:
  GET /api/movies
  GET /api/characters
  GET /api/movies/<id>
```

### 2️⃣ APLICACIÓN FLUTTER (Terminal 2)

```bash
# En la misma carpeta raíz

# Ejecuta la app
flutter run
```

---

## ⚙️ Configuración de IP

**Importante:** Si ejecutas en emulador/simulador, necesitas la IP correcta:

### Android Emulator
- **Emulator:** IP es `10.0.2.2` (acceso a localhost del host)
- ✅ Esto YA está configurado en [lib/services/api_service.dart](lib/services/api_service.dart#L6)

### iOS Simulator
- **Cambiar en `api_service.dart`:**
  ```dart
  static const String baseUrl = 'http://localhost:8080';
  ```

### Dispositivo Físico en la Misma Red
- **Cambiar IP por la de tu PC:**
  ```bash
  # En terminal: ipconfig (Windows) => busca "IPv4 Address"
  # Ejemplo: 192.168.1.100
  
  static const String baseUrl = 'http://192.168.1.100:8080';
  ```

---

## 🧪 Probar Endpoints

### Con Postman o cURL:

```bash
# Obtener todas las películas
curl http://localhost:8080/api/movies

# Obtener un personaje
curl http://localhost:8080/api/characters

# Obtener película específica
curl http://localhost:8080/api/movies/1
```

### En el navegador:
- http://localhost:8080/api/movies
- http://localhost:8080/api/characters

---

## 🔧 Solución de Problemas

**Error: "Failed to connect to..."**
- ✅ Verifica que el servidor está corriendo en Terminal 1
- ✅ Revisa la IP configurada en `api_service.dart`
- ✅ En Android Emulator: asegúrate que es `10.0.2.2`

**Error: "Connection refused"**
- Espera unos segundos después de iniciar el servidor

**La app carga pero no ve datos**
- Revisa los logs en la Terminal de Flutter
- Presiona `X` para ver el error completo

---

## 📊 Estructura de la API

```json
// GET /api/movies
[
  {
    "id": "1",
    "title": "Frozen II",
    "year": "2019",
    "poster": "https://...",
    "backdrop": "https://...",
    "type": "movie",
    "description": "...",
    "genres": ["Animación", "Aventura"],
    "rating": 7.2,
    "director": "Chris Buck"
  }
]

// GET /api/characters
[
  {
    "id": "c1",
    "name": "Elsa",
    "imageUrl": "https://...",
    "movieTitle": "Frozen II"
  }
]
```

---

## 🎯 Próximos Pasos Opcionales

1. **Agregar más datos al servidor** → edita `bin/server.dart`
2. **Persistencia en BD** → añade base_datos en el servidor
3. **Autenticación** → implementa tokens JWT
4. **Búsqueda y filtros** → crea endpoints `/api/movies/search?q=...`

¡Listo! Ahora la app conecta con tu servidor Dart. 🚀
