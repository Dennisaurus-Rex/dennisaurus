# Makefile

build: 
	dart run build_runner build --delete-conflicting-outputs \
	&& dart run asset_code_generator
clean: 
	flutter clean && dart run build_runner clean
clean-build: clean build
.PHONY: build clean clean-build

web:
	flutter run -d chrome
.PHONY: web

deploy:
	sh deploy.sh
.PHONY: deploy
