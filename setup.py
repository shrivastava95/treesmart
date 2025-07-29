from setuptools import setup, find_packages
from pathlib import Path

setup(
    name="treesmart",
    version="0.1.0",
    description="Smarter tree command",
    long_description=Path("README.md").read_text(),
    long_description_content_type="text/markdown",
    packages=find_packages(),
    include_package_data=True,
    # 👇 this copies the shell script into <env>/bin and makes it executable
    scripts=["treesmart/treesmart.sh"],
    entry_points={
        "console_scripts": [
            "treesmart=treesmart.__main__:main",
        ],
    },
)

