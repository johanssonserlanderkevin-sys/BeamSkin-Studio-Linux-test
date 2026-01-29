📥 Installation
For Linux Users 🐧
BeamSkin Studio now has full native Linux support! Follow these simple steps to get started.
Quick Installation (Recommended)

Download BeamSkin Studio

bash   # Clone the repository
   git clone https://github.com/yourusername/BeamSkin-Studio.git
   cd BeamSkin-Studio

Run the automated installer

bash   chmod +x install_linux.sh
   ./install_linux.sh
The installer will:

✅ Detect your Linux distribution
✅ Install Python 3 if needed
✅ Install all required dependencies
✅ Set up the launcher script
✅ Optionally launch the application


Launch BeamSkin Studio

bash   ./beamskin_studio.sh
That's it! You're ready to start creating skins! 🎉
Manual Installation (Advanced Users)
If you prefer manual installation or the automated installer doesn't work for your distribution:

Install Python 3.8+ and tkinter
Ubuntu/Debian/Linux Mint/Pop!_OS:

bash   sudo apt update
   sudo apt install python3 python3-pip python3-tk python3-venv
Fedora/RHEL/CentOS:
bash   sudo dnf install python3 python3-pip python3-tkinter
Arch/Manjaro:
bash   sudo pacman -S python python-pip tk
openSUSE:
bash   sudo zypper install python3 python3-pip python3-tk

Install Python dependencies

bash   python3 -m pip install --user customtkinter Pillow requests
Or use the requirements file:
bash   python3 -m pip install --user -r requirements.txt

Make the launcher executable

bash   chmod +x beamskin_studio.sh

Run BeamSkin Studio

bash   ./beamskin_studio.sh
Or run directly:
bash   python3 main.py
Optional: Desktop Integration
To add BeamSkin Studio to your application menu:

Copy the desktop entry

bash   cp beamskin-studio.desktop ~/.local/share/applications/

Edit the file to update paths

bash   nano ~/.local/share/applications/beamskin-studio.desktop
Update these lines with your installation path:
ini   Exec=/path/to/BeamSkin-Studio/beamskin_studio.sh
   Icon=/path/to/BeamSkin-Studio/gui/Icons/BeamSkin_Studio_White.png

Make it executable

bash   chmod +x ~/.local/share/applications/beamskin-studio.desktop

Update the desktop database

bash   update-desktop-database ~/.local/share/applications/
Now BeamSkin Studio will appear in your application menu! 🎯



For Windows Users 🪟

Download BeamSkin Studio

Download the repo as ZIP

Extract the zip to were you want BeamSkin Studio

Run the install.bat

Launch BeamSkin Studio



For macOS Users 🍎

Install Homebrew (if not already installed)

bash   /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

Install Python with tkinter

bash   brew install python-tk

Clone the repository

bash   git clone https://github.com/yourusername/BeamSkin-Studio.git
   cd BeamSkin-Studio

Install dependencies

bash   python3 -m pip install -r requirements.txt

Run BeamSkin Studio

bash   python3 main.py
