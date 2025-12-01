# File Scanner Automation Script

This automation tool scans a directory, identifies large files, and outputs a JSON report.
It demonstrates Python scripting, CLI argument parsing, file inspection, and reporting.

## Features

- Recursively scans all subdirectories
- Counts total files
- Identifies files larger than a given threshold (default: 10MB)
- Saves results to a JSON file
- Useful for log cleanup, storage checks, CI artifact scanning

## How to Run

python3 scanner.py /path/to/directory --threshold 20 --output report.json

Examples:

python3 scanner.py . --threshold 5

Output saved to:

output.json

## Example Output (simplified)

{
"directory": "./",
"scanned_at": "2025-01-01T12:00:00Z",
"total_files": 42,
"large_files": [
{
"file": "./logs/server.log",
"size_mb": 15.3
}
]
}


