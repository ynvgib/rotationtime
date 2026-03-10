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
    echo "  apk     : Build Split-ABI APKs (Android)"
    echo "  web     : Build Web & Deploy to Firebase"
    echo "  linux   : Build .deb via flutter_distributor (dev)"
    echo "  run     : Launch local Web Server (Brave @ 8080)"
    echo "  all     : Run APK, Web, and Linux builds"
    echo "  help    : Show this menu"
    echo ""
    echo -e "\033[1;34m===========================================================\033[0m"
}

# --- Build Functions ---

build_apk() {
    echo -e "\033[1;36m🤖 Building Split APKs...\033[0m"
    flutter build apk --split-per-abi --no-tree-shake-icons
    cp build/app/outputs/flutter-apk/*.apk "$INSTALL_DIR/apk/"
    echo "✅ APKs moved to $INSTALL_DIR/apk"
}

build_web() {
    echo -e "\033[1;36m🧹 Reclaiming RAM from background Dart processes...\033[0m"
    
    # Kill any "leaking" processes from VS Code or previous builds
    # '2>/dev/null' ensures you don't see errors if no processes exist
    killall -9 dart 2>/dev/null
    killall -9 flutter 2>/dev/null
    
    # Optional: Clear Ubuntu system file caches (requires sudo)
    # This acts like a "soft reboot" for your RAM
    # sudo sync && echo 3 | sudo tee /proc/sys/vm/drop_caches

    echo -e "\033[1;36m🌐 Building Web for White Camel...\033[0m"
    
    # Apply the memory constraints we discussed
    export DART_VM_OPTIONS="--old_gen_heap_size=3072"

    # Use 'nice' to keep the mouse/UI responsive even if the CPU spikes
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

# --- Execution Logic ---

if [ -z "$1" ]; then
    show_help
    exit 0
fi

case "$1" in
    linux)
        build_linux
        ;;
    apk)
        build_apk
        ;;
    web)
        build_web
        ;;
    run)
        run_web_local
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
        echo "Usage: $0 {linux|apk|web|run|all|help}"
        exit 1
        ;;
esac