#!/bin/bash

# Quest 7: Финальные действия

echo "=== Quest 7: Финальные действия ==="

# 1. Проверяем текущую ветку (должна быть release/1.0)
echo "1. Текущая ветка:"
git branch --show-current

# 2. Проверяем наличие всех ключей
echo ""
echo "2. Проверяем ключи:"
ls -la ai_help/key/
echo ""
echo "Содержимое ключей:"
for key in ai_help/key/main*.key; do
    echo "$(basename $key): $(cat $key)"
done

# 3. Фиксируем все изменения в release/1.0
echo ""
echo "3. Фиксируем изменения в release/1.0:"
git add .
git status
git commit -m "release/1.0: Финальный коммит со всеми ключами"

# 4. Переключаемся на develop для финального коммита
echo ""
echo "4. Фиксируем изменения в develop:"
git checkout develop
git add .
git commit -m "develop: Финальный коммит develop ветки"

# 5. Показываем финальную структуру
echo ""
echo "5. Финальная структура веток:"
git log --oneline --graph --all -15

# 6. Отправляем все ветки в удаленный репозиторий
echo ""
echo "6. Отправляем ветки в удаленный репозиторий:"
git push origin develop
git push origin key-branch
git push origin feature/3-key
git push origin release/1.0

echo ""
echo "7. Финальная проверка:"
git branch -a

echo "=== Quest 7 завершен ==="
read brbr