#!/bin/bash
set -e
echo "◈ agy-3-proxy - Extreme Wrapper Installer ◈"

BIN_DIR="$HOME/bin"
PROJECT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# 1. Dependency: Ecosystem Brain
if [ ! -d "$HOME/projects/ecosystem" ]; then
    echo "[!] Error: Gemini Ecosystem (Brain) not found in ~/projects/ecosystem"
    echo "[*] This project requires 'ecosystem' to function."
    # exit 1
fi

mkdir -p "$BIN_DIR"

# 2. Create symlink for agy3 command
ln -sf "$PROJECT_DIR/agy3.py" "$BIN_DIR/agy3"
chmod +x "$PROJECT_DIR/agy3.py"

# 3. PYTHONPATH Check
BASHRC="$HOME/.bashrc"
if ! grep -q "projects/ecosystem" "$BASHRC"; then
    echo "[!] Warning: Ecosystem not in PYTHONPATH. Run ecosystem installer first."
fi

echo "[*] agy-3-proxy installation complete."
echo "[*] You can now launch it by typing: agy3"
