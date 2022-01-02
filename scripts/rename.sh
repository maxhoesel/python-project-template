#!/usr/bin/env bash

set -eu
set -o pipefail

OLD_NAME="app"
NEW_NAME="$1"

sed -i "s/$OLD_NAME/$NEW_NAME/gi" pyproject.toml src/**/*.py docs/Makefile docs/source/conf.py docs/source/*.rst .github/workflows/*.yml .chglog/config.yml tests/unit/*.py README.rst
sed -i "/To change the projectname/d" README.rst

mv "src/$OLD_NAME" "src/$NEW_NAME"
mv "docs/source/$OLD_NAME.rst" "docs/source/$NEW_NAME.rst"
mv "tests/unit/test_$OLD_NAME.py" "tests/unit/test_$NEW_NAME.py"

# Delete self
rm scripts/rename.sh
