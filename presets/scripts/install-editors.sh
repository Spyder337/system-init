# Emacs
function add-emacs() {

}

# VS Code
function add-vscode() {
    curl -lf "https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-x64" -o ~/programs/linux-deb-x64.deb

    apt install -y ~/programs/linux-deb-x64.deb
}