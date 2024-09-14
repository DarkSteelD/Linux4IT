#!/bin/bash
#!/bin/bash

# Get the first LC_ variable's value
first_value=$(printenv | grep '^LC_' | head -n 1 | cut -d'=' -f2)
echo $(printenv | grep '^LC_')

# If there are no LC_ variables, exit successfully
if [ -z "$first_value" ]; then
    echo "No LC_ variables found."
    exit 0
fi

# Loop through all LC_ variables and compare their values
for var in $(printenv | grep '^LC_'); do
    current_value=$(echo "$var" | cut -d'=' -f2)
    if [[ "$current_value" != "$first_value" ]]; then
        echo "Mismatch found: $var has a different value."
        exit 1
    fi
done

echo "All LC_ variables have the same value."
exit 0

