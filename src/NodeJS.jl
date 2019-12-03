module NodeJS

using Pkg.Artifacts
import Base: SHA1

export nodejs_cmd, npm_cmd

function conditional_nodejs_load()
    artifact_info = artifact_meta("nodejs_app", joinpath(@__DIR__, "..", "Artifacts.toml"))

    artifact_info === nothing && return nothing

    return artifact_path(SHA1(artifact_info["git-tree-sha1"]))
end

const nodejs_path = conditional_nodejs_load()

const node_exe_name = Sys.iswindows() ? "node.exe" : "node"
const npm_exe_name = Sys.iswindows() ? "npm.cmd" : "npm"

const node_executable_path = nodejs_path === nothing ? node_exe_name : Sys.iswindows() ? joinpath(nodejs_path, node_exe_name) : joinpath(nodejs_path, "bin", node_exe_name)
const npm_executable_path = nodejs_path === nothing ? npm_exe_name : Sys.iswindows() ? joinpath(nodejs_path, npm_exe_name) : joinpath(nodejs_path, "bin", npm_exe_name)

"""
Return the full path of the node command.
"""
function nodejs_cmd()
    return `$node_executable_path`
end

"""
Return the full path of the npm command.
"""
function npm_cmd()
    if nodejs_path === nothing
        return `npm`
    elseif Sys.iswindows()
        return `$npm_executable_path`
    else
        return `$node_executable_path $npm_executable_path`
    end
end

end # module
