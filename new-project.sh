#!/bin/bash

set -euo pipefail

# Paths
TEMPLATES_DIR="$HOME/IT-Project-Templates"
PROJECTS_DIR="$HOME/Projects"

# ========================================
# Functions
# ========================================

show_usage() {
    echo "Usage: $0 <project_name> [flags]"
    echo ""
    echo "Language flags:"
    echo "  --c-cpp            C/C++ project"
    echo "  --python           Python project"
    echo ""
    echo "Project types:"
    echo "  --pure             Pure C/C++ or Python"
    echo "  --hybrid           Hybrid (Cython + C/C++)"
    echo "  --platformio       Embedded (Arduino, ESP32, etc.)"
    echo ""
    echo "PlatformIO devices:"
    echo "  --arduino-nano"
    echo "  --arduino-pro-micro"
    echo "  --esp32-devkit"
    echo "  --stm32f411"
    echo ""
    echo "Examples:"
    echo "  $0 my_cpp --c-cpp --pure"
    echo "  $0 my_app --python --pure"
    echo "  $0 sensor_node --c-cpp --platformio --esp32-devkit"
    exit 1
}

validate_project_name() {
    local name="$1"
    if [ -z "$name" ]; then
        echo "Error: Project name not specified."
        show_usage
    fi
}

replace_placeholders() {
    local project_name="$1"
    find . -type f \( -name "*.in" -o -name "*.template" \) -exec sed -i "s|@PROJECT_NAME@|$project_name|g" {} \;
    find . -type f -name "*.in" -exec sh -c 'mv "$1" "$(dirname "$1")/$(basename "$1" .in)"' _ {} \;
    find . -type f -name "*.template" -exec sh -c 'mv "$1" "$(dirname "$1")/$(basename "$1" .template)"' _ {} \;
}

init_git() {
    git init
    echo "Initializing Git..."
    if [ "$LANG_TYPE" = "c-cpp" ] && { [ "$HYBRID" = "true" ] || [ "$PURE" = "true" ]; }; then
        git submodule add https://github.com/google/googletest.git libraries/googletest
        echo "googletest added as submodule"
    fi

    git add .
    git commit -m "feat: initial commit from template"
}

build_docker_images() {
    if [ -f "Dockerfile.docs" ] && [ -f "docs/cpp/Doxyfile" ] && [ -f "docs/python/conf.py" ]; then
        echo "Building docs-builder image..."
        if docker build -f Dockerfile.docs -t docs-builder .; then
            echo "docs-builder image built successfully"
        else
            echo "Error: failed to build docs-builder"
            return 1
        fi
    else
        echo "Note: Dockerfile.docs not found, skipping docs-builder"
    fi

    if [ -f "tools/profiler/Dockerfile" ]; then
        echo "Building profiler-tool image..."
        if docker build -f tools/profiler/Dockerfile -t profiler-tool .; then
            echo "profiler-tool image built successfully"
        else
            echo "Error: failed to build profiler-tool"
            return 1
        fi
    else
        echo "Note: profiler Dockerfile not found, skipping"
    fi
}

# ========================================
# Main flow
# ========================================

PROJECT_NAME="${1:-}"
shift 2>/dev/null || true

validate_project_name "$PROJECT_NAME"

# Flags
LANG_TYPE=""
PURE=false
HYBRID=false
PLATFORMIO=false
DEVICE=""

while [[ $# -gt 0 ]]; do
    case $1 in
        --c-cpp)
            LANG_TYPE="c-cpp"
            shift
            ;;
        --python)
            LANG_TYPE="python"
            shift
            ;;
        --pure)
            PURE=true
            shift
            ;;
        --hybrid)
            HYBRID=true
            shift
            ;;
        --platformio)
            PLATFORMIO=true
            shift
            ;;
        --arduino-nano)
            DEVICE="arduino-nano"
            shift
            ;;
        --arduino-pro-micro)
            DEVICE="arduino-pro-micro"
            shift
            ;;
        --esp32-devkit)
            DEVICE="esp32-devkit"
            shift
            ;;
        --stm32f411)
            DEVICE="stm32f411"
            shift
            ;;
        -*)
            echo "Error: Unknown flag: $1"
            show_usage
            ;;
        *)
            shift
            ;;
    esac
done

# Validate language type
if [ -z "$LANG_TYPE" ]; then
    echo "Error: Specify --c-cpp or --python"
    show_usage
fi

# Determine destination and template
DEST="$PROJECTS_DIR/$PROJECT_NAME"
TEMPLATE_BASE="$TEMPLATES_DIR/$LANG_TYPE"
TEMPLATE=""

if $PURE; then
    TEMPLATE="$TEMPLATE_BASE/pure"
elif $HYBRID; then
    if [ "$LANG_TYPE" != "c-cpp" ]; then
        echo "Error: --hybrid is only available for --c-cpp"
        show_usage
    fi
    TEMPLATE="$TEMPLATE_BASE/hybrid"
elif $PLATFORMIO && [ -n "$DEVICE" ]; then
    if [ "$LANG_TYPE" != "c-cpp" ]; then
        echo "Error: --platformio is only available for --c-cpp"
        show_usage
    fi
    TEMPLATE="$TEMPLATE_BASE/platformio/$DEVICE"
elif $PLATFORMIO; then
    echo "Error: Specify device: --arduino-nano, --esp32-devkit, etc."
    show_usage
else
    echo "Error: Specify project type: --pure, --hybrid, or --platformio"
    show_usage
fi

# Validate template exists
if [ ! -d "$TEMPLATE" ]; then
    echo "Error: Template not found: $TEMPLATE"
    echo "Check folder: $TEMPLATES_DIR"
    exit 1
fi

# Create project
echo "Creating project: $PROJECT_NAME"
mkdir -p "$DEST"
cp -r "$TEMPLATE/." "$DEST/"

# For PlatformIO, also copy common .devcontainer and .vscode
if $PLATFORMIO; then
    cp -r "$TEMPLATE_BASE/platformio/.devcontainer" "$DEST/"
    cp -r "$TEMPLATE_BASE/platformio/.vscode" "$DEST/"
fi

cd "$DEST" || exit 1

# Replace placeholders
replace_placeholders "$PROJECT_NAME"

# Virtual environments
if [ "$LANG_TYPE" = "c-cpp" ] && [ "$HYBRID" = "true" ]; then
    echo "Creating virtual environment .venv"
    python -m venv .venv
    source .venv/bin/activate
    pip install --upgrade pip
    if [ -f "requirements.txt" ]; then
        pip install -r requirements.txt
    fi
fi

if [ "$LANG_TYPE" = "python" ] && [ "$PURE" = "true" ]; then
    echo "Creating virtual environment .venv"
    python -m venv .venv
    source .venv/bin/activate
    pip install --upgrade pip
    if [ -f "requirements.txt" ]; then
        pip install -r requirements.txt
    fi
fi

# Git
init_git

# Docker (only for C/C++)
if [ "$LANG_TYPE" = "c-cpp" ] && ! $PLATFORMIO; then
    build_docker_images
fi

# ========================================
# Tips
# ========================================

echo ""
echo "Project '$PROJECT_NAME' successfully created in $DEST"
echo ""

if [ "$LANG_TYPE" = "c-cpp" ]; then
    if $PLATFORMIO; then
        echo "Tips for PlatformIO:"
        echo "   pio run"
        echo "   pio run -t upload"
        echo "   pio device monitor"
    else
        echo "Tips for C/C++:"
        echo "   mkdir build && cd build"
        echo "   cmake .."
        echo "   make"
        echo "   ctest"
    fi
fi

if [ "$LANG_TYPE" = "python" ]; then
    echo "Tips for Python:"
    echo "   source .venv/bin/activate"
    echo "   pytest tests/"
fi

echo ""
echo "Happy coding!"
