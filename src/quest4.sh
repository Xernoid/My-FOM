#!/bin/bash

# Quest 4 - Stop ai_door_control.sh process

echo "=== Quest 4: Stopping ai_door_control module ==="

# 1. Найдем процесс ai_door_control.sh
echo "1. Searching for ai_door_control.sh processes..."
ps aux | grep ai_door_control.sh | grep -v grep

# 2. Найдем PID процесса
PID=$(ps aux | grep ai_door_control.sh | grep -v grep | awk '{print $2}')
if [ -n "$PID" ]; then
    echo "2. Found ai_door_control.sh process with PID: $PID"
    
    # 3. Остановим процесс
    echo "3. Stopping process $PID..."
    kill $PID
    
    # 4. Проверим, что процесс остановился
    echo "4. Verifying process termination..."
    sleep 2
    if ps -p $PID > /dev/null; then
        echo "Process still running, using force kill..."
        kill -9 $PID
    else
        echo "Process $PID successfully terminated"
    fi
else
    echo "2. No ai_door_control.sh process found"
fi

# 5. Дополнительная проверка через killall (альтернатива pkill)
echo "5. Additional cleanup..."
if command -v killall &> /dev/null; then
    killall ai_door_control.sh 2>/dev/null
    echo "Used killall for cleanup"
else
    # Альтернативный метод без killall
    for pid in $(ps aux | grep ai_door_control.sh | grep -v grep | awk '{print $2}'); do
        kill -9 $pid 2>/dev/null
    done
    echo "Used alternative cleanup method"
fi

# 6. Финальная проверка
echo "6. Final verification..."
RUNNING_PROCESSES=$(ps aux | grep ai_door_control.sh | grep -v grep)
if [ -z "$RUNNING_PROCESSES" ]; then
    echo "SUCCESS: All ai_door_control.sh processes have been terminated"
else
    echo "WARNING: Some processes might still be running:"
    echo "$RUNNING_PROCESSES"
fi

# 7. Предотвращаем автоматический запуск в будущем
echo "7. Preventing future auto-starts..."
if [ -f "ai_door_control.sh" ]; then
    chmod -x ai_door_control.sh
    echo "Removed execute permissions from ai_door_control.sh"
    
    # Создаем backup на всякий случай
    cp ai_door_control.sh ai_door_control.sh.backup
    echo "Created backup: ai_door_control.sh.backup"
fi

echo "=== Quest 4 completed ==="
read brbrpatapim