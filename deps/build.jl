using BinDeps

const node_version = "6.10.0"
arch = Sys.ARCH==:x86_64 ? "x64" : "x86"

BinDeps.@setup

nodejs = library_dependency("node", aliases=["node.exe"])

provides(Binaries, URI("https://nodejs.org/dist/v$node_version/node-v$node_version-win-$arch.zip"), nodejs, os=:Windows, unpacked_dir = "node-v$node_version-win-$arch")

@BinDeps.install
