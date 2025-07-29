# treesmart

`treesmart` is a tiny CLI that mimics *tree* but:

* limits the **number of entries per directory** (default 10)
* limits **recursion depth** (default 3)

```bash
# install via git remote
pip install git+https://github.com/shrivastava95/treesmart.git

# install from source
pip install .
```

# Usage

```bash
treesmart --help
treesmart ~/sample_dir --limit 5 --depth 4
```

