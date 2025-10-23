# Fibo - E-Commerce Application

A full-featured e-commerce Flutter application with Stripe payment integration, shopping cart management, real-time product search, and multi-language support.

## Features

- Product catalog with real-time search
- Debounced search for optimal performance
- Shopping cart with add/remove/update functionality
- Secure payment processing via Stripe
- User authentication (Login/Register)
- Multi-language support (Arabic/English)

## Architecture & Tech Stack

**Architecture Pattern:** MVC (Model-View-Controller)

**Tech Stack:**
- **State Management:** Provider
- **HTTP Client:** Dio
- **Payment Gateway:** Stripe API
- **Localization:** Easy Localization
- **Real-time Search:** RxDart (debouncing)
- **Routing:** Flutter Navigator

**Data Source:**
- Dummy JSON APIs for product catalog
- Stripe API for payment processing
