#!/usr/bin/env sh
set -eu

MAVEN_VERSION="${MAVEN_VERSION:-3.9.16}"
BASE_DIR="$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)"
MAVEN_HOME="$BASE_DIR/.mvn/apache-maven-$MAVEN_VERSION"
MAVEN_ARCHIVE="$BASE_DIR/.mvn/apache-maven-$MAVEN_VERSION-bin.tar.gz"
MAVEN_URL="${MAVEN_URL:-https://dlcdn.apache.org/maven/maven-3/$MAVEN_VERSION/binaries/apache-maven-$MAVEN_VERSION-bin.tar.gz}"

if [ ! -x "$MAVEN_HOME/bin/mvn" ]; then
    mkdir -p "$BASE_DIR/.mvn"
    if [ ! -f "$MAVEN_ARCHIVE" ]; then
        echo "Downloading Apache Maven $MAVEN_VERSION..."
        curl -fL "$MAVEN_URL" -o "$MAVEN_ARCHIVE"
    fi
    echo "Installing Apache Maven $MAVEN_VERSION into .mvn/..."
    tar -xzf "$MAVEN_ARCHIVE" -C "$BASE_DIR/.mvn"
fi

exec "$MAVEN_HOME/bin/mvn" "$@"
