#!/bin/bash
# BeamSkin Studio - Linux Installation Script
# This script installs all dependencies for BeamSkin Studio on Linux

echo "============================================================"
echo "BeamSkin Studio - Linux Installation"
echo "============================================================"
echo ""

# Check if running on Linux
if [[ "$OSTYPE" != "linux-gnu"* ]]; then
    echo "ERROR: This script is for Linux systems only!"
    echo "Current OS: $OSTYPE"
    exit 1
fi

# Detect distribution
if [ -f /etc/os-release ]; then
    . /etc/os-release
    DISTRO=$ID
    echo "Detected distribution: $NAME"
else
    echo "WARNING: Could not detect Linux distribution"
    DISTRO="unknown"
fi

echo ""

# Check if Python 3 is installed
echo "[1/5] Checking Python 3 installation..."
if command -v python3 &> /dev/null; then
    PYTHON_VERSION=$(python3 --version)
    echo "✓ Python 3 is installed: $PYTHON_VERSION"
else
    echo "✗ Python 3 is not installed!"
    echo ""
    echo "Installing Python 3..."
    
    case $DISTRO in
        ubuntu|debian|linuxmint|pop)
            echo "Using apt package manager..."
            sudo apt update
            sudo apt install -y python3 python3-pip python3-tk python3-venv
            ;;
        fedora|rhel|centos)
            echo "Using dnf/yum package manager..."
            sudo dnf install -y python3 python3-pip python3-tkinter
            ;;
        arch|manjaro)
            echo "Using pacman package manager..."
            sudo pacman -S --noconfirm python python-pip tk
            ;;
        opensuse*)
            echo "Using zypper package manager..."
            sudo zypper install -y python3 python3-pip python3-tk
            ;;
        *)
            echo "ERROR: Unsupported distribution!"
            echo "Please install Python 3 manually using your package manager."
            exit 1
            ;;
    esac
    
    if [ $? -ne 0 ]; then
        echo "ERROR: Failed to install Python 3!"
        exit 1
    fi
    
    echo "✓ Python 3 installed successfully"
fi

echo ""

# Check if pip is installed
echo "[2/5] Checking pip installation..."
if python3 -m pip --version &> /dev/null; then
    PIP_VERSION=$(python3 -m pip --version)
    echo "✓ pip is installed: $PIP_VERSION"
else
    echo "✗ pip is not installed!"
    echo ""
    echo "Installing pip..."
    
    case $DISTRO in
        ubuntu|debian|linuxmint|pop)
            sudo apt install -y python3-pip
            ;;
        fedora|rhel|centos)
            sudo dnf install -y python3-pip
            ;;
        arch|manjaro)
            sudo pacman -S --noconfirm python-pip
            ;;
        opensuse*)
            sudo zypper install -y python3-pip
            ;;
        *)
            python3 -m ensurepip --user
            ;;
    esac
    
    if [ $? -ne 0 ]; then
        echo "ERROR: Failed to install pip!"
        exit 1
    fi
    
    echo "✓ pip installed successfully"
fi

echo ""

# Check and install tkinter if needed
echo "[3/5] Checking tkinter installation..."
if python3 -c "import tkinter" &> /dev/null 2>&1; then
    echo "✓ tkinter is installed"
else
    echo "✗ tkinter is not installed!"
    echo ""
    echo "Installing tkinter..."
    
    case $DISTRO in
        ubuntu|debian|linuxmint|pop)
            sudo apt install -y python3-tk
            ;;
        fedora|rhel|centos)
            sudo dnf install -y python3-tkinter
            ;;
        arch|manjaro)
            sudo pacman -S --noconfirm tk
            ;;
        opensuse*)
            sudo zypper install -y python3-tk
            ;;
        *)
            echo "ERROR: Please install tkinter manually for your distribution"
            exit 1
            ;;
    esac
    
    if [ $? -ne 0 ]; then
        echo "ERROR: Failed to install tkinter!"
        exit 1
    fi
    
    echo "✓ tkinter installed successfully"
fi

echo ""

# Upgrade pip
echo "[4/5] Upgrading pip to latest version..."
python3 -m pip install --user --upgrade pip
if [ $? -eq 0 ]; then
    echo "✓ pip upgraded successfully"
else
    echo "⚠ Warning: pip upgrade failed, continuing anyway..."
fi

echo ""

# Install Python dependencies
echo "[5/5] Installing Python dependencies..."
echo ""
echo "This may take a few minutes..."
echo ""

# Install CustomTkinter
echo "Installing CustomTkinter (GUI framework)..."
python3 -m pip install --user customtkinter
if [ $? -ne 0 ]; then
    echo "ERROR: Failed to install customtkinter!"
    exit 1
fi
echo "✓ CustomTkinter installed"

# Install Pillow
echo "Installing Pillow (image processing)..."
python3 -m pip install --user Pillow
if [ $? -ne 0 ]; then
    echo "ERROR: Failed to install Pillow!"
    exit 1
fi
echo "✓ Pillow installed"

# Install requests
echo "Installing requests (HTTP library)..."
python3 -m pip install --user requests
if [ $? -ne 0 ]; then
    echo "ERROR: Failed to install requests!"
    exit 1
fi
echo "✓ requests installed"

echo ""

# Verify installations
echo "Verifying installations..."
echo ""

python3 -c "import customtkinter; print('✓ CustomTkinter version:', customtkinter.__version__)"
if [ $? -ne 0 ]; then
    echo "ERROR: CustomTkinter verification failed!"
    exit 1
fi

python3 -c "import PIL; print('✓ Pillow version:', PIL.__version__)"
if [ $? -ne 0 ]; then
    echo "ERROR: Pillow verification failed!"
    exit 1
fi

python3 -c "import requests; print('✓ Requests version:', requests.__version__)"
if [ $? -ne 0 ]; then
    echo "ERROR: Requests verification failed!"
    exit 1
fi

python3 -c "import tkinter; print('✓ tkinter is available')"
if [ $? -ne 0 ]; then
    echo "ERROR: tkinter verification failed!"
    exit 1
fi

echo ""
echo "============================================================"
echo "Installation Complete!"
echo "============================================================"
echo ""
echo "All required dependencies have been installed successfully."
echo ""
echo "To run BeamSkin Studio:"
echo "  ./beamskin_studio.sh"
echo ""
echo "Or:"
echo "  python3 main.py"
echo ""

# Make launcher executable
if [ -f "beamskin_studio.sh" ]; then
    chmod +x beamskin_studio.sh
    echo "Made launcher script executable."
    echo ""
fi

# Ask if user wants to launch now
read -p "Would you like to launch BeamSkin Studio now? (y/n) " -n 1 -r
echo ""
if [[ $REPLY =~ ^[Yy]$ ]]; then
    echo ""
    echo "Launching BeamSkin Studio..."
    sleep 1
    
    if [ -f "beamskin_studio.sh" ]; then
        ./beamskin_studio.sh
    else
        python3 main.py
    fi
fi
