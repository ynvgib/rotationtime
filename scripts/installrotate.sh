#!/bin/bash

# --- Configuration ---
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_DIR="$(dirname "$SCRIPT_DIR")"
INSTALL_DIR="$PROJECT_DIR/installations"

# --- Environment Setup ---
export PATH="$PATH":"$HOME/.pub-cache/bin"
export CHROME_EXECUTABLE="/snap/bin/brave"

cd "$PROJECT_DIR" || { echo "❌ Failed to enter project directory"; exit 1; }

mkdir -p "$INSTALL_DIR/apk"
mkdir -p "$INSTALL_DIR/linux"

# --- Helper: Show Help Menu ---
show_help() {
    echo -e "\033[1;34m===========================================================\033[0m"
    echo -e "\033[1;32m ZMANSI BUILD & INSTALLATION (installrotate.sh) \033[0m"
    echo -e "\033[1;34m===========================================================\033[0m"
    echo "Usage: ./scripts/installrotate.sh [COMMAND]"
    echo ""
    echo "COMMANDS:"
    echo "  apk64   : Build ONLY ARM64 APK (Fastest for testing)"
    echo "  apk     : Build Split-ABI APKs (All Architectures)"
    echo "  web     : Build Web & Deploy to Firebase"
    echo "  linux   : Build .deb via flutter_distributor (dev)"
    echo "  run     : Launch local Web Server (Brave @ 8080)"
    echo "  clean   : Deep clean Flutter and pub-get"
    echo "  all     : Run APK, Web, and Linux builds"
    echo "  help    : Show this menu"
    echo ""
    echo -e "\033[1;34m===========================================================\033[0m"
}

# --- Build Functions ---

build_apk_arm64() {
    echo -e "\033[1;36m🚀 Building Single ARM64 APK (Quick Build)...\033[0m"
    flutter build apk --release --target-platform android-arm64 --split-per-abi --no-tree-shake-icons
    cp build/app/outputs/flutter-apk/app-arm64-v8a-release.apk "$INSTALL_DIR/apk/"
    echo "✅ ARM64 APK moved to $INSTALL_DIR/apk/app-arm64-v8a-release.apk"
}

build_apk() {
    echo -e "\033[1;36m🤖 Building Split APKs (All Architectures)...\033[0m"
    flutter build apk --split-per-abi --no-tree-shake-icons
    cp build/app/outputs/flutter-apk/*.apk "$INSTALL_DIR/apk/"
    echo "✅ APKs moved to $INSTALL_DIR/apk"
}

build_web() {
    echo -e "\033[1;36m🧹 Reclaiming RAM from background Dart processes...\033[0m"
    killall -9 dart 2>/dev/null
    killall -9 flutter 2>/dev/null
    
    echo -e "\033[1;36m🌐 Building Web for White Camel...\033[0m"
    export DART_VM_OPTIONS="--old_gen_heap_size=3072"
    nice -n 19 flutter build web --no-tree-shake-icons --release
    
    firebase deploy
    echo "✅ Web live and memory cleared."
}

build_linux() {
    echo -e "\033[1;36m🐧 Building Linux (.deb) via flutter_distributor...\033[0m"
    flutter_distributor release --name=dev --jobs=release-dev-linux-deb
    LATEST_DEB=$(find "$PROJECT_DIR/dist/" -name "*.deb" -type f -mmin -5 | head -n 1)
    if [ -z "$LATEST_DEB" ]; then
        LATEST_DEB=$(ls -t "$PROJECT_DIR/dist/"**/*.deb 2>/dev/null | head -n 1)
    fi
    if [ -n "$LATEST_DEB" ]; then
        cp "$LATEST_DEB" "$INSTALL_DIR/linux/"
        echo -e "\033[1;32m✅ Successfully moved: $(basename "$LATEST_DEB")\033[0m"
    else
        echo -e "\033[1;31m❌ Error: No .deb file found.\033[0m"
    fi
}

run_web_local() {
    echo -e "\033[1;35m🛡️ Starting Brave at http://0.0.0.0:8080\033[0m"
    flutter run -d web-server --web-port 8080 --web-hostname 0.0.0.0
}

deep_clean() {
    echo -e "\033[1;33m🧹 Performing Deep Clean...\033[0m"
    flutter clean
    flutter pub get
    echo "✅ Project cleaned and dependencies updated."
}

# --- Execution Logic ---

if [ -z "$1" ]; then
    show_help
    exit 0
fi

case "$1" in
    apk64)
        build_apk_arm64
        ;;
    apk)
        build_apk
        ;;
    linux)
        build_linux
        ;;
    web)
        build_web
        ;;
    run)
        run_web_local
        ;;
    clean)
        deep_clean
        ;;
    all)
        build_apk
        build_linux
        build_web
        ;;
    help)
        show_help
        ;;
    *)
        echo "Usage: $0 {apk64|apk|linux|web|run|clean|all|help}"
        exit 1
        ;;
esac