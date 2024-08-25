#!/bin/bash

set -e  # Вихід, якщо команда завершується з ненульовим статусом.

# Отримання назви поточного проекту (з припущенням, що це назва поточної директорії)
project_name=$(basename "$PWD")

echo
echo
echo "Running unit and Android tests in $project_name"
echo "====================================================================="

# Запуск тестів для поточного проекту
./gradlew "$@" testDebug nexusOneApi30DebugAndroidTest --info --no-watch-fs | sed "s@^@$project_name @"
code=${PIPESTATUS[0]}

if [ "$code" -ne "0" ]; then
    exit $code
fi

echo
echo "ALL TESTS PASS"
