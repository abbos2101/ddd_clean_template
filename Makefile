# Flutter Development Makefile

.PHONY: clean fix-ios fix-ios-clean gen-clean gen fix fmt build-apk-dev build-apk-prod run-dev run-prod res translate prompt add-all add-android add-ios add-web

# Variables from YAML
PACKAGE_NAME = $(shell grep '^name:' pubspec.yaml | sed 's/name: *//' | tr -d '[:space:]')
ORG_NAME = $(shell grep '^organization_domain:' pubspec.yaml | sed 's/organization_domain: *//' | tr -d '[:space:]')
VERSION = $(shell grep '^version:' pubspec.yaml | sed 's/version: *//' | tr -d '[:space:]' | sed 's/+.*//')

# Platform management
add-all:
	flutter create --platforms android,ios,web,windows --org $(ORG_NAME) .

add-android:
	flutter create --platforms android --org $(ORG_NAME) .

add-ios:
	flutter create --platforms ios --org $(ORG_NAME) .

add-web:
	flutter create --platforms web --org $(ORG_NAME) .

splash-clean:
	dart run flutter_native_splash:remove

splash-create:
	dart run flutter_native_splash:create

icon-create:
	dart run icons_launcher:create

# Basic cleanup
clean:
	flutter clean
	flutter pub get

# iOS troubleshooting
fix-ios:
	cd ios && \
	pod cache clean --all && \
	pod clean && \
	pod deintegrate && \
	sudo gem install cocoapods-deintegrate cocoapods-clean && \
	pod repo update && \
	pod install

# Complete iOS reset
fix-ios-clean:
	sudo gem uninstall cocoapods && \
	sudo gem install cocoapods && \
	pod setup && \
	cd ios && \
	rm -rf Pods Podfile.lock Runner.xcworkspace && \
	pod cache clean --all && \
	pod install --repo-update && \
	flutter clean && \
	flutter pub get

# Code formatting and fixes
fix:
	dart fix --apply
	dart format lib

fmt:
	dart format lib

# Code generation
gen-clean:
	dart run build_runner clean

gen:
	dart run build_runner watch

gen-one:
	dart run build_runner build

# Resource generators
res:
	dart run res_generator:generate

tr:
	dart run res_generator:translate

prompt:
	dart run prompt_generator:generate

# APK builds
build-dev:
	flutter clean
	flutter build apk --dart-define-from-file=.env.dev.json --release --obfuscate --split-debug-info=debug-info/
	mv ./build/app/outputs/flutter-apk/app-release.apk "./build/app/outputs/flutter-apk/$(PACKAGE_NAME)_dev_$(VERSION)_$(shell date +%d.%m.%Y).apk"
	open ./build/app/outputs/flutter-apk/

build-prod:
	flutter clean
	flutter build apk --dart-define-from-file=.env.prod.json --release --obfuscate --split-debug-info=debug-info/
	mv ./build/app/outputs/flutter-apk/app-release.apk "./build/app/outputs/flutter-apk/$(PACKAGE_NAME)_$(VERSION).apk"
	open ./build/app/outputs/flutter-apk/

# Run configurations
run-dev:
	flutter run --dart-define-from-file=.env.dev.json --release

run-prod:
	flutter run --dart-define-from-file=.env.prod.json --release

# Debug: Show loaded environment variables
print:
	@echo "PACKAGE_NAME: $(PACKAGE_NAME)"
	@echo "ORG_NAME: $(ORG_NAME)"
	@echo "VERSION: $(VERSION)"

# ─── Source replacements (lib/**/*.dart) ──────────────────────────────────────
# Format: "FIND|||REPLACE"  (FIND is a sed-compatible regex)
# Nuqta (.) regex xususiyatini yo'qotish uchun \. bilan escape qilinadi.

DART_FILES   := $(shell find lib -name "*.dart" -type f)
REPLACEMENTS := \
	'MapType.\.|||.'             \
	'VarStatus.\.|||.'           \
	'UpdateType.\.|||.'          \
	'DialogStyle.\.|||.'         \
	'SnackBarType.\.|||.'        \
	'ToastType.\.|||.'           \
	'SelectItemMode.\.|||.'      \
	'EdgeInsets\.|||.'           \
	'MainAxisSize\.|||.'         \
	'MainAxisAlignment\.|||.'    \
	'CrossAxisAlignment\.|||.'   \
	'TextAlign\.|||.'            \
	'FontWeight\.|||.'           \
	'Alignment\.|||.'            \
	'BoxFit\.|||.'               \
	'BoxShape\.|||.'             \
	'Axis\.|||.'                 \
	'Clip\.|||.'                 \
	'BorderRadius\.|||.'         \
	'Border\.|||.'               \
	'Radius\.|||.'

replace:
	@echo "→ $(words $(DART_FILES)) ta dart faylda replacement boshlanmoqda..."
	@for pair in $(REPLACEMENTS); do \
		find="$$(echo $$pair | cut -d'|' -f1)"; \
		repl="$$(echo $$pair | cut -d'|' -f4)"; \
		echo "  s/$$find/$$repl/g"; \
		sed -i '' "s/$$find/$$repl/g" $(DART_FILES); \
	done
	@echo "✓ Tayyor."