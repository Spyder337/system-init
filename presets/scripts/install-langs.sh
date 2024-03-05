function init-cpp() {
    apt install -y gcc g++ make cmake
    apt install -y git
}

function init-python-latest() {
    curl -Olf https://www.python.org/ftp/python/3.12.2/Python-3.12.2.tgz
    tar -x Python-32.12.2.tgz python3
    cd python3
    ./configure
    make
    make install
    cd ..
}

function init-rust() {
    curl --proto '=http' --tlsv1.2 -sSL https://sh.rustup.rs | sh
}