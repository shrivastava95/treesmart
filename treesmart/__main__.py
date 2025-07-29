import subprocess
import sys
from pathlib import Path

def main() -> None:
    # Resolve treesmart.sh path packaged alongside __main__.py
    script_path = Path(__file__).with_suffix("").parent / "treesmart.sh"
    cmd = ["bash", str(script_path)] + sys.argv[1:]
    result = subprocess.run(cmd)
    sys.exit(result.returncode)

if __name__ == "__main__":
    main()

