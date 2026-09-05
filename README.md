# 🏠 Sufi

**Sufi** es una aplicación móvil para Android diseñada para facilitar la gestión del inventario doméstico.

La aplicación permite registrar productos del hogar, establecer cantidades óptimas y mínimas, controlar las existencias y visualizar rápidamente el estado de cada producto mediante un sistema de semáforo:

* 🟢 **Verde:** cantidad suficiente.
* 🟠 **Naranja:** cantidad baja.
* 🔴 **Rojo:** producto agotado.

Además, Sufi calcula la cantidad necesaria para recuperar el nivel óptimo de inventario y estima el costo de la próxima compra.

## 🚀 Características principales

* 📦 Gestión de productos.
* 🏷️ Organización por categorías.
* 📊 Dashboard del estado del inventario.
* 🟢🟠🔴 Sistema visual de estado de existencias.
* 🛒 Lista de compras.
* 💰 Cálculo del costo estimado de reposición.
* 📜 Historial de movimientos de inventario.
* 🔔 Notificaciones locales.
* 📱 Funcionamiento sin conexión a Internet.
* 💾 Persistencia de datos mediante SQLite.

## 🛠️ Tecnologías

* **Flutter**
* **Dart**
* **SQLite**
* **Drift**
* **Riverpod**
* **GoRouter**
* **Git / GitHub**

## 🏗️ Arquitectura

Sufi utiliza una arquitectura basada en:

**Clean Architecture + Feature-Driven Architecture**

El proyecto separa las responsabilidades en:

```text
Data
Domain
Presentation
```

y organiza el código por funcionalidades:

```text
features/
├── products/
├── inventory/
├── categories/
├── shopping_list/
├── dashboard/
└── settings/
```

El objetivo es mantener un código limpio, modular, mantenible y preparado para futuras funcionalidades.

## 🎯 Objetivo

Crear una herramienta sencilla pero completa que permita conocer en todo momento qué productos hay en casa, cuáles están por agotarse y cuánto podría costar reponerlos.

## 📌 Estado del proyecto

🚧 **En desarrollo**

Sufi se encuentra actualmente en etapa de desarrollo inicial.

