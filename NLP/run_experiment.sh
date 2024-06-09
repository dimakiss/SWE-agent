#!/bin/bash

# Define the model name
MODEL_NAME="azure:gpt4"

# Define the base URL for the data path
BASE_URL="https://github.com/dimakiss/SWE-agent/issues"

# Define the configuration file
CONFIG_FILE="config/NLP/nlp3_reddit_v2.yaml"

# Loop through the cost limits
for COST_LIMIT in 9.00 9.01 9.02
do
    # Loop through issue numbers 1 to 11
    for ISSUE in {1..11}
    do
        # Run the Python script with dynamic issue number and cost limit
        python run.py --model_name $MODEL_NAME --data_path "$BASE_URL/$ISSUE" --config_file $CONFIG_FILE --per_instance_cost_limit $COST_LIMIT --temperature 0.0
    done
done


