#!/bin/bash

# Test connection to PostgreSQL
PG_HOST="localhost"
PG_PORT="5432"
PG_USER="your_user"
PG_PASSWORD="your_password"
PG_DB="your_database"

echo "Testing PostgreSQL connection..."
PG_CONN_STRING="psql -h $PG_HOST -p $PG_PORT -U $PG_USER -d $PG_DB -c 'SELECT 1;'"
if eval $PG_CONN_STRING; then
    echo "PostgreSQL connection successful."
else
    echo "PostgreSQL connection failed!"
fi

# Test connection to Mosquitto
MQTT_HOST="localhost"
MQTT_PORT="1883"

echo "Testing Mosquitto connection..."
if mosquitto_sub -h $MQTT_HOST -p $MQTT_PORT -t "test/topic" -c 5; then
    echo "Mosquitto connection successful."
else
    echo "Mosquitto connection failed!"
fi

# Test connection to Node-RED
NODE_RED_URL="http://localhost:1880"

echo "Testing Node-RED connection..."
if curl --silent --fail $NODE_RED_URL; then
    echo "Node-RED connection successful."
else
    echo "Node-RED connection failed!"
fi
