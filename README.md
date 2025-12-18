# Flutter DDD Clean Architecture Template

Production-ready Flutter template - DDD (Domain-Driven Design) va Clean Architecture asosida.

## 🎯 Maqsad

Har safar yangi loyiha boshlaganda takrorlanadigan sozlamalarni avtomatlashtirish:
- Tez-tez ishlatiladigan packagelar
- Theme, localization, DI, routing
- Network layer (Dio + cache + interceptors)
- State management (BLoC/Cubit)
- Helper funksiyalar
- AI bilan ishlash uchun promptlar

## 🚀 Quick Start

### 1. Fork va Clone
```bash
# GitHub'dan fork qiling
git clone https://github.com/YOUR_USERNAME/YOUR_PROJECT.git
cd YOUR_PROJECT
```

### 2. Loyiha nomini sozlash

`pubspec.yaml` da:
```yaml
name: your_app_name
organization_domain: com.yourcompany
```

### 3. Platformalarni qo'shish
```bash
make add-android    # Android qo'shish
make add-ios        # iOS qo'shish
make add-web        # Web qo'shish
```

### 4. Package name yangilash

IDE'da **Replace All** orqali:
- `ddd_clean_template` → `your_app_name`
- `uz.digitagro` → `com.yourcompany`

### 5. Environment sozlash

`.env.dev.json` va `.env.prod.json` fayllarini to'ldiring:
```json
{
  "BASE_URL": "https://api.yourapp.uz",
  "ONE_ID_URL": "https://sso.egov.uz/...",
  "USERNAME": "dev_user",
  "PASSWORD": "dev_pass",
  "DEV_MODE": "true",
  "ONLY_PORTRAIT": "true"
}
```

`lib/common/constants/app_env.dart` da yangi fieldlar qo'shing (agar kerak bo'lsa).

### 6. Dependencies o'rnatish va ishga tushirish
```bash
make get           # Dependencies
make gen           # Code generation
make run-dev       # Dev rejimda ishga tushirish
```

## 📁 Loyiha strukturasi

```
lib/
├── main.dart                    # Entry point
├── di.dart                      # Dependency Injection (GetIt + Injectable)
├── common/
│   ├── constants/
│   │   └── app_env.dart         # Environment variables
│   ├── extensions/              # Dart extensions
│   ├── helpers/                 # Utility funksiyalar
│   ├── theme/                   # AppColors, AppTheme
│   ├── widgets/                 # Qayta ishlatiladigan widgetlar
│   └── words/                   # Localization
├── application/                 # BLoC/Cubit
│   ├── locale/
│   ├── theme/
│   ├── network_info/
│   └── device_info/
├── domain/
│   ├── models/                  # Freezed modellar
│   └── facades/                 # Abstract interfaces
├── infrastructure/
│   ├── datasources/             # API implementatsiyalari
│   └── services/
│       ├── cache/               # Hive + SecureStorage
│       ├── db/                  # SQLite
│       └── http/                # Dio + Interceptors
└── presentation/
    ├── pages/                   # Sahifalar
    └── routes/                  # AutoRoute
```

## 🛠 Makefile Buyruqlari

| Buyruq | Tavsif |
|--------|--------|
| `make get` | `flutter pub get` |
| `make gen` | Build runner (code generation) |
| `make watch` | Build runner watch rejimda |
| `make clean` | Tozalash va qayta build |
| `make res` | Resurslarni generatsiya (icons, images) |
| `make tr` | Tarjimalarni generatsiya |
| `make run-dev` | Dev rejimda ishga tushirish |
| `make run-prod` | Prod rejimda ishga tushirish |
| `make build-dev` | Dev APK yaratish |
| `make build-prod` | Prod APK yaratish |
| `make add-android` | Android platforma qo'shish |
| `make add-ios` | iOS platforma qo'shish |
| `make splash` | Splash screen generatsiya |
| `make icon` | App icon generatsiya |
| `make prompt` | AI uchun prompt generatsiya |

## 🌐 Localization

### Yangi til qo'shish

1. `assets/tr/` ga fayl qo'shing: `en-US.json`

2. `res_generator.yaml` yangilang:
```yaml
words:
  supported_locales: ['uz-UZ', 'en-US']
  translated_locales: ['uz-UZ', 'en-US']
```

3. `main.dart` da localesni qo'shing

4. Generatsiya:
```bash
make tr
```

### Ishlatish
```dart
Text(Words.hello.str)
// yoki
Text(str(Words.hello))
```

## 🎨 Theme

```dart
// Ranglarni olish
final colors = context.appColors;
final primary = colors.primary;

// Dark mode tekshirish
if (context.isDark) { ... }

// Theme o'zgartirish
context.read<ThemeCubit>().toggle();
```

## 📦 Resurslar bilan ishlash

### Rasm qo'shish

1. `assets/images/` ga rasm qo'shing
2. `make res` ishga tushiring
3. Kodda ishlatish:
```dart
AppImages.logo
```

### Icon qo'shish

1. `assets/icons/` ga SVG qo'shing
2. `make res` ishga tushiring
3. Kodda ishlatish:
```dart
AppIcons.home
```

## 🔐 Environment & Xavfsizlik

Maxfiy ma'lumotlar `.env.*.json` fayllarida saqlanadi:

```dart
// Ishlatish
final baseUrl = AppEnv.baseUrl;
final isDevMode = AppEnv.devMode;
```

**Muhim:** `.env.*.json` fayllarni `.gitignore` ga qo'shing!

## 🤖 AI bilan ishlash

### Prompt generatsiya
```bash
make prompt
```

Bu buyruq `prompt_generator.yaml` konfiguratsiyasi bo'yicha loyiha kodini AI uchun tayyorlaydi.

### AI Rules

`ai_rules/` papkasida tayyor promptlar:

| Fayl | Maqsad |
|------|--------|
| `models_rule.md` | Freezed model yaratish qoidalari |
| `update_packages.md` | Packagelarni yangilash |

## 📱 Build

### Development
```bash
make build-dev
# Natija: build/app/outputs/flutter-apk/app-dev-1.0.0+1.apk
```

### Production
```bash
make build-prod
# Natija: build/app/outputs/flutter-apk/app-prod-1.0.0+1.apk
```

## 🧩 Asosiy Packagelar

| Package | Maqsad |
|---------|--------|
| `flutter_bloc` | State management |
| `auto_route` | Navigation |
| `get_it` + `injectable` | Dependency Injection |
| `dio` | HTTP client |
| `freezed` | Immutable modellar |
| `hive_ce` | Local storage |
| `easy_localization` | Localization |

## 📋 Package-specific Konfiguratsiyalar

Ba'zi packagelar qo'shimcha sozlash talab qiladi:

- **image_picker**: iOS `Info.plist`, Android permissions
- **url_launcher**: iOS `Info.plist` queries, Android intent filters

Batafsil: [pub.dev](https://pub.dev) dan tegishli package sahifasiga qarang.

## 🔄 Yangilanishlar

Template muntazam yangilanadi:
- Package versiyalari
- Yangi helper funksiyalar
- AI rules
- Bug fixlar

## 📚 Qo'shimcha Resurslar

- [prompt_generator](https://pub.dev/packages/prompt_generator) - AI prompt generatsiya
- [res_generator](https://pub.dev/packages/res_generator) - Resurs generatsiya

## 📄 Litsenziya

MIT License

---

**Muallif:** Abbos Bobomurodov
**Aloqa:** [Linkedin](https://www.linkedin.com/in/abbos2101/)