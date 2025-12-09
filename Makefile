# Flutter Development Makefile

.PHONY: clean fix-ios fix-ios-clean gen-clean gen fix fmt build-apk-dev build-apk-prod run-dev run-prod res translate prompt add-all add-android add-ios add-web

# Variables from YAML
PACKAGE_NAME = $(shell grep '^name:' pubspec.yaml | sed 's/name: *//' | tr -d '[:space:]')
ORG_NAME = $(shell grep '^organization_domain:' pubspec.yaml | sed 's/organization_domain: *//' | tr -d '[:space:]')

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
	dart format .

fmt:
	dart format .

# Code generation
gen-clean:
	dart run build_runner clean

gen:
	dart run build_runner watch --delete-conflicting-outputs

gen-one:
	dart run build_runner build --delete-conflicting-outputs

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
	mv ./build/app/outputs/flutter-apk/app-release.apk "./build/app/outputs/flutter-apk/$(PACKAGE_NAME)_dev_$(shell date +%d.%m.%Y).apk"
	open ./build/app/outputs/flutter-apk/

build-prod:
	flutter clean
	flutter build apk --dart-define-from-file=.env.prod.json --release --obfuscate --split-debug-info=debug-info/
	mv ./build/app/outputs/flutter-apk/app-release.apk "./build/app/outputs/flutter-apk/$(PACKAGE_NAME)_prod_$(shell date +%d.%m.%Y).apk"
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