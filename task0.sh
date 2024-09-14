#!/bin/bash
for i in {1..8}; do
    filename="task$i.sh"
    echo "#!/bin/bash" > "$filename"
    echo "# This is script $filename" >> "$filename"
    echo "echo \"Running $filename\"" >> "$filename"
    chmod +x "$filename"
    echo "Created and made $filename executable"
done
