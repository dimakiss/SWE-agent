#!/bin/bash

# Define the model name
MODEL_NAME="azure:gpt4"

# Define the base URL for the data path
BASE_URL="https://github.com/dimakiss/SWE-agent/issues"

# Define the configuration file
CONFIG_FILE="config/NLP/nlp3.yaml"

# Define the per instance cost limit
COST_LIMIT=3.00

# Loop through issue numbers 1 to 3
for ISSUE in {1..30}
do
    # Run the Python script with dynamic issue number
    python run.py --model_name $MODEL_NAME --data_path "$BASE_URL/$ISSUE" --config_file $CONFIG_FILE --per_instance_cost_limit $COST_LIMIT
done
