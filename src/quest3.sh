#!/bin/bash

# Quest 3 - Fix door management module configuration files

# 1. Переименовываем папку с опечаткой
if [ -d "door_management_fi" ]; then
    mv "door_management_fi" "door_management_files"
    echo "Переименована папка door_management_fi -> door_management_files"
fi

# 2. Создаем правильную структуру папок
mkdir -p door_management_files/door_configuration
mkdir -p door_management_files/door_map
mkdir -p door_management_files/door_logs

# 3. Перемещаем ВСЕ файлы в соответствующие папки
# Конфигурационные файлы (.conf) -> door_configuration
find door_management_files -maxdepth 1 -name "*.conf" -exec mv {} door_management_files/door_configuration/ \; 2>/dev/null

# Лог-файлы (.log) -> door_logs  
find door_management_files -maxdepth 1 -name "*.log" -exec mv {} door_management_files/door_logs/ \; 2>/dev/null

# Файл карты -> door_map
find door_management_files -maxdepth 1 -name "door_map*" -exec mv {} door_management_files/door_map/ \; 2>/dev/null

# 4. Исправляем опечатку в скрипте
sed -i 's/door_management_filesles/door_management_files/g' ai_door_management_module.sh

# 5. Проверяем количество файлов в каждой папке
echo "Проверка структуры файлов:"
echo "Конфигураций: $(find door_management_files/door_configuration -name '*.conf' | wc -l)"
echo "Логов: $(find door_management_files/door_logs -name '*.log' | wc -l)"
echo "Карт: $(find door_management_files/door_map -name 'door_map*' | wc -l)"
echo "Всего файлов: $(find door_management_files -type f | wc -l)"

# 6. Показываем список всех файлов для проверки
echo ""
echo "Список всех файлов:"
find door_management_files -type f | sort

# 7. Делаем скрипты исполняемыми
chmod +x ai_door_management_module.sh
chmod +x quest3.sh

echo "Структура файлов конфигурации исправлена"