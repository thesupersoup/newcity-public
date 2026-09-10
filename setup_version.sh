#!/bin/bash

SAVE_VERSION="58"
PATCH_VERSION="19"
PATCH_LETTER="s"

VERSION_STRING="Version 0.0.$SAVE_VERSION.$PATCH_VERSION$PATCH_LETTER ALPHA-SOUP"
echo "Setting Version $VERSION_STRING"

rm src/game/version_generated.hpp
echo "const int saveVersion = $SAVE_VERSION;" >> src/game/version_generated.hpp
echo "const int patchVersion = $PATCH_VERSION;" >> src/game/version_generated.hpp
echo "const char* const patchLetter = \"$PATCH_LETTER\";" >> src/game/version_generated.hpp
