#!/bin/bash

cd "$(dirname "$0")"

echo "🛠 Generando sitio con Hugo..."
hugo --cleanDestinationDir

echo "📦 Cambiando a carpeta public/"
cd public

echo "🔄 Haciendo pull para evitar conflictos..."
git pull origin gh-pages --rebase

echo "📤 Subiendo cambios a gh-pages..."
git add .
fecha=$(date +"%Y-%m-%d %H:%M:%S")
git commit -m "🚀 Deploy automático: $fecha"
git push origin gh-pages

echo "✅ ¡Deploy completado!"
