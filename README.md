# AsistPoint

**Sistema de Asistencia con Geolocalización – Flutter + Firebase**

_AsistPoint_ es una aplicación móvil multiplataforma desarrollada en **Flutter**, diseñada para registrar asistencias laborales de forma eficiente y segura mediante **validación por geolocalización**. Ideal para empresas con múltiples sedes.

---

## 🚀 Funcionalidades

- 📍 Registro de asistencia con validación de ubicación GPS.
- 👤 Autenticación de usuarios con **Firebase Authentication**.
- 🏢 Control de sedes y gestión por roles (admin y empleados).
- ✅ Registro de entradas y salidas por día.
- 📊 Generación de reportes de asistencia por sede.
- 🔄 Activación y desactivación de usuarios desde el panel de administrador.

---

## 🛠️ Tecnologías Utilizadas

- **Frontend:** Flutter (Dart)
- **Backend-as-a-Service:** Supabase
  - Realtime Database (si aplica)
- **Geolocalización:** `geolocator` y `permission_handler` (Flutter packages)
- **Gestión de estado:** `provider`
- **Control de versiones:** Git + GitHub

---

## 📱 Requisitos

- Android Studio o VS Code con Flutter SDK
- Cuenta de Firebase y archivo `google-services.json` para Android
- Permisos de ubicación activados en el dispositivo

---

## ▶️ Cómo Ejecutar

1. Clona el repositorio:
   ```bash
   git clone https://github.com/JA-SB-DEV/asistponit.git

2. Abre el proyecto en Android Studio o VS Code.

3. Agrega el archivo google-services.json en android/app/.

4. Ejecuta el proyecto:
flutter pub get
flutter run

asistponit/
├── lib/
│   ├── screens/          # Pantallas (usuarios, asistencias, sedes, etc.)
│   ├── models/           # Modelos de datos
│   ├── services/         # Lógica Firebase y geolocalización
│   ├── widgets/          # Componentes reutilizables
│   └── main.dart         # Punto de entrada
├── android/
│   └── app/              # Configuración para Firebase Android
├── pubspec.yaml          # Dependencias

📌 Estado del Proyecto

✅ En desarrollo funcional.
📈 Se planea añadir exportación de reportes en PDF, notificaciones push y panel web administrativo.

👤 Autor
Juan Salcedo
Desarrollador Full Stack con experiencia en Flutter y Firebase
📧 juanandressalcedo909@gmail.com
🔗 GitHub: JA-SB-DEV
