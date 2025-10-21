#!/bin/bash

# Quest 6: Сборка ключа из файлов в ai_help

echo "=== Quest 6: Сборка main.key ==="

# 1. Переходим в папку ai_help
cd ai_help

# 2. Запускаем генератор ключей
echo "1. Запуск keygen.sh:"
./keygen.sh

# 3. Смотрим что создалось
echo ""
echo "2. Содержимое папки key после генерации:"
ls -la key/ | head -20
echo "..."
ls -la key/ | tail -10

# 4. Считаем количество файлов
echo ""
echo "3. Статистика файлов:"
echo "Всего файлов: $(ls key/ | wc -l)"
echo "Файлов .key: $(ls key/*.key 2>/dev/null | wc -l)"
echo "Пустых файлов: $(find key/ -type f -empty | wc -l)"

# 5. Удаляем все НЕ .key файлы (мусор)
echo ""
echo "4. Удаляем мусорные файлы:"
find key/ -type f ! -name "*.key" -delete

# 6. Проверяем что остались только .key файлы
echo ""
echo "5. Файлы после очистки:"
ls -la key/
echo "Осталось файлов: $(ls key/*.key 2>/dev/null | wc -l)"

# 7. Запускаем unifier.sh для сборки ключа
echo ""
echo "6. Запуск unifier.sh:"
./unifier.sh

# 8. Проверяем результат
echo ""
echo "7. Проверка результата:"
if [ -f "main.key" ]; then
    echo "main.key создан!"
    echo "Содержимое main.key:"
    cat main.key
    # Перемещаем main.key в папку key
    mv main.key key/
    echo "main.key перемещен в папку key/"
else
    echo "main.key не создан"
fi

# 9. Финальная проверка
echo ""
echo "8. Финальная структура:"
ls -la
ls -la key/

# Возвращаемся обратно
cd ..

echo "=== Quest 6 завершен ==="
read brbrpatapim