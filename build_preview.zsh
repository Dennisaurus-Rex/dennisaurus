#!/bin/zsh

flutter clean web
flutter build web --base-href /dennisaurus-dev-preview/

open build/web
