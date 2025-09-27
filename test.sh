#!/bin/bash

LOG_FILE="/var/log/monitoring.log"
MONITORING_URL="https://test.com/monitoring/test/api"

log_message() {
    local message="$1"
    echo "$(date '+%Y-%m-%d %H:%M:%S') - $message" >> "$LOG_FILE"
}

send_ping() {
    if command -v curl >/dev/null 2>&1; then
        response=$(curl -s -o /dev/null -w "%{http_code}" -X POST "$MONITORING_URL")
        if [ "$response" -eq 200 ] || [ "$response" -eq 204 ]; then
            log_message "Успешно отправлено уведомление на сервер мониторинга."
        else
            log_message "Ошибка при отправке уведомления на сервер мониторинга. HTTP код: $response"
        fi
    else
        log_message "curl не установлен. Не удалось отправить уведомление."
    fi
}

while true; do
    if pgrep -x "test" >/dev/null; then
        send_ping
    else
        log_message "Процесс 'test' не запущен. Возможно, был перезапущен или завершен."
    fi
    sleep 60
done
