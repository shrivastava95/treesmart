#!/usr/bin/env bash
# treesmart.sh  –  smarter 'tree' with entry & depth limits
# Default: limit=10, depth=3

treesmart() {
  local dir="."
  local limit=10
  local depth=3  # default recursion depth

  # Parse arguments
  while [[ $# -gt 0 ]]; do
    case "$1" in
      --help|-h)
        echo "Usage: treesmart [DIRECTORY] [--limit N] [--depth N]"
        echo
        echo "Mimics 'tree' but limits number of entries per folder and recursion depth."
        echo
        echo "Positional:"
        echo "  DIRECTORY     Directory to display (default: .)"
        echo
        echo "Options:"
        echo "  --limit N     Max entries per folder (default: 10)"
        echo "  --depth N     Max recursion depth (default: 3)"
        echo "  --help        Show this help message"
        return 0
        ;;
      --limit)
        shift; limit="$1" ;;
      --depth)
        shift; depth="$1" ;;
      *)
        dir="$1" ;;
    esac
    shift
  done

  [[ -d "$dir" ]] || { echo "treesmart: '$dir' is not a directory" >&2; return 1; }

  find "$dir" -maxdepth "$depth" -print | awk -F/ -v N="$limit" '
  {
    depth = NF - 1
    parent = ""
    for (i = 1; i < NF; ++i) parent = parent "/" $i
    count[parent]++
    if (count[parent] <= N) {
      indent = ""
      for (i = 1; i < NF; ++i) indent = indent "│   "
      print indent "├── " $NF
    } else if (count[parent] == N+1) {
      indent = ""
      for (i = 1; i < NF; ++i) indent = indent "│   "
      print indent "└── ... (more)"
    }
  }'
}

treesmart "$@"

