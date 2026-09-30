import re
import argparse

# Set  up command line parsing
parser = argparse.ArgumentParser(description="Parse Salmon log file for mapping rates.")
parser.add_argument("-i", "--input", required=True, help="Path to the Salmon log file")
args = parser.parse_args()

log_path = args.input

samples = []
rates = []

with open(log_path, "r") as f:
    lines = f.readlines()

current_sample = None

for line in lines:
    # Match the mates1 line and extract the sample name
    if "### [ mates1 ] => {" in line:
        match = re.search(r"/([^/]+)_1[^/]*\.fastq\.gz", line)
        if match:
            current_sample = match.group(1).replace("_1_paired.fastq.gz", "")
    
    # Match the mapping rate line and pair it with the current sample
    if "Mapping rate =" in line:
        rate_match = re.search(r"Mapping rate = ([\d.]+)%", line)
        if rate_match and current_sample:
            samples.append(current_sample)
            rates.append(rate_match.group(1))
            current_sample = None  # reset for next block

# Output the results as a simple table
print(f"{'Sample':<20} {'Mapping Rate (%)':<15}")
print("-" * 35)
for s, r in zip(samples, rates):
    print(f"{s:<20} {r:<15}")

