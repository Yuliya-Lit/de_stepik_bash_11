#!/bin/bash

echo "Отчет о логе веб-сервера"
echo "========================"

echo "Общее количество запросов: $(sed -n '$=' access.log)"

echo "Количество уникальных IP-адресов: $(cat access.log | awk '{print $1}' | sort -n | uniq -c | sed -n '$=')"

echo -e "Количество запросов по методам:\n$(cat access.log | awk '{print $6}' | sed 's/"//g' | sort -n | uniq -c)"

echo "Самый популярный URL: $(cat access.log | awk '{print $7}' | sed 's/^.//' | sort | uniq -c | sort -b -n -r | head -n 1)"
  