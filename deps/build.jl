using BinDeps

const node_version = "6.10.0"
arch = Sys.ARCH==:x86_64 ? "x64" : "x86"

mkdir(joinpath(dirname(@__FILE__), "downloads"))
const download_filename = joinpath(dirname(@__FILE__), "downloads", "node-v$node_version-win-$arch.zip")

run(BinDeps.download_cmd("https://nodejs.org/dist/v$node_version/node-v$node_version-win-$arch.zip", download_filename))
