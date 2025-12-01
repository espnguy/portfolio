import os
import json
import argparse
from datetime import datetime

def scan_directory(directory, size_threshold_mb=10):
    report = {
        "directory": directory,
        "scanned_at": datetime.utcnow().isoformat() + "Z",
        "total_files": 0,
        "large_files": [],
        "all_files": []
    }

    threshold_bytes = size_threshold_mb * 1024 * 1024

    for root, dirs, files in os.walk(directory):
        for file in files:
            path = os.path.join(root, file)

            try:
                size = os.path.getsize(path)
            except Exception as e:
                continue  # skip unreadable files

            report["all_files"].append({
                "file": path,
                "size_bytes": size
            })

            if size >= threshold_bytes:
                report["large_files"].append({
                    "file": path,
                    "size_mb": round(size / (1024 * 1024), 2)
                })

            report["total_files"] += 1

    return report

def main():
    parser = argparse.ArgumentParser(description="Scan a directory for large files.")
    parser.add_argument("directory", help="Directory to scan")
    parser.add_argument("--threshold", type=int, default=10,
                        help="Size threshold in MB (default: 10MB)")
    parser.add_argument("--output", default="output.json",
                        help="Output filename (default: output.json)")

    args = parser.parse_args()

    print(f"Scanning directory: {args.directory} (threshold: {args.threshold} MB)")

    result = scan_directory(args.directory, args.threshold)

    with open(args.output, "w") as f:
        json.dump(result, f, indent=4)

    print(f"Scan complete. Report saved to {args.output}")

if __name__ == "__main__":
    main()
