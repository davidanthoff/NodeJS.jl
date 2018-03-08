using BinDeps

const nodejs_version = v"8.10.0"
basedir = @__DIR__

if is_linux()
    if (Sys.ARCH in (:x86_64, :i686, :i586, :i486, :i386)) && sizeof(Int) == 8
        download_filename_base = "node-v$(nodejs_version)-linux-x64"
        download_filename_ext = "tar.xz"
    elseif (Sys.ARCH in (:x86_64, :i686, :i586, :i486, :i386)) && sizeof(Int) == 4
        download_filename_base = "node-v$(nodejs_version)-linux-x86"
        download_filename_ext = "tar.xz"
    else
        error("Unsupported platform.")
    end
elseif is_apple()
    download_filename_base = "node-v$(nodejs_version)-darwin-x64"
    download_filename_ext = "tar.gz"
elseif is_windows()
    if sizeof(Int) == 8
        download_filename_base = "node-v$(nodejs_version)-win-x64"
        download_filename_ext = "zip"
    elseif sizeof(Int) == 4
        download_filename_base = "node-v$(nodejs_version)-win-x86"
        download_filename_ext = "zip"
    else
        error("Unsupported platform.")
    end
else
    error("Unsupported platform.")
end
download_folder = joinpath(basedir, "downloads")
download_filename_full = joinpath(download_folder, "$download_filename_base.$download_filename_ext")

bin_folder = joinpath(basedir, "bin")

install_folder = joinpath(bin_folder, download_filename_base)

# "https://nodejs.org/dist/v6.10.3/node-v6.10.3-win-x64.zip"
# "https://nodejs.org/dist/v6.10.3/node-v6.10.3-darwin-x64.tar.gz"
# "https://nodejs.org/dist/v6.10.3/node-v6.10.3-linux-x64.tar.xz"

base_url = "https://nodejs.org/dist/v$nodejs_version"

@static if is_windows()
    binary_name = "node.exe"
else
    binary_name = "node"
end

binary_target_path = is_windows() ? joinpath(install_folder, binary_name) : joinpath(install_folder, "bin", binary_name)

# Do we need to download?
if !isfile(download_filename_full)
    info("Downloading Node.js binary")
    rm(download_folder, force=true, recursive=true)

    download(x) = run(BinDeps.download_cmd(x, basename(x)))

    mkpath(download_folder)

    cd(download_folder) do
        download("$base_url/$download_filename_base.$download_filename_ext")
    end
end

if !isfile(binary_target_path)
    info("Extracting Node.js binary")
    if is_windows()
        rm(string("\\\\?\\", bin_folder), force=true, recursive=true)
    else
        rm(bin_folder, force=true, recursive=true)
    end

    mkpath(bin_folder)

    if is_windows()
        cd(bin_folder) do
            read(`7z x $download_filename_full`)
        end
    elseif is_linux()
        read(pipeline(`unxz -c $download_filename_full `, `tar xv --directory=$bin_folder`))
    else
        read(`tar -xzf $download_filename_full --directory=$bin_folder`)
    end
end

npm_script_target_path = is_windows() ? joinpath(install_folder, "node_modules", "npm", "bin", "npm-cli.js") : joinpath(install_folder, "lib", "node_modules", "npm", "bin", "npm-cli.js")

open(joinpath(dirname(@__FILE__), "deps.jl"), "w") do f
    write(f, """
const node_executable_path = "$(escape_string(binary_target_path))"
const npm_script_path = "$(escape_string(npm_script_target_path))"
""")

end
