# 1. Смотрим все конфиги перед изменением
find door_management_files/door_configuration -name "*.conf" -exec echo "=== {} ===" \; -exec cat {} \;

# 2. Меняем STATUS на OPEN во ВСЕХ файлах где есть CLOSED
find door_management_files/door_configuration -name "*.conf" -exec sed -i 's/STATUS: CLOSED/STATUS: OPEN/g' {} \;

# 3. Проверяем изменения
find door_management_files/door_configuration -name "*.conf" -exec echo "=== {} ===" \; -exec cat {} \;

# 4. Проверяем что не осталось файлов с CLOSED
echo "Файлов с STATUS: CLOSED:"
grep -r "STATUS: CLOSED" door_management_files/door_configuration | wc -l

# 5. Создаем документацию
echo "Quest 5: Автоматическое изменение конфигурации всех закрытых дверей" > quest5.txt
echo "Использована команда find + sed для замены STATUS: CLOSED на STATUS: OPEN" >> quest5.txt
echo "Обработаны все файлы в door_management_files/door_configuration/" >> quest5.txt
echo "Дата: $(date)" >> quest5.txt
echo "" >> quest5.txt
echo "Результат проверки - файлов с STATUS: CLOSED: $(grep -r "STATUS: CLOSED" door_management_files/door_configuration 2>/dev/null | wc -l)" >> quest5.txt