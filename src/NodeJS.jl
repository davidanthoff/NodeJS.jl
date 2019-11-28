module NodeJS

using Pkg.Artifacts

export nodejs_cmd, npm_cmd

const nodejs_path = artifact"nodejs_app"

const node_exe_name = Sys.iswindows() ? "node.exe" : "node"
const npm_exe_name = Sys.iswindows() ? "npm.cmd" : "npm"

const node_executable_path = isfile(joinpath(nodejs_path, node_exe_name)) ? joinpath(nodejs_path, node_exe_name) : node_exe_name
const npm_executable_path = isfile(joinpath(nodejs_path, npm_exe_name)) ? joinpath(nodejs_path, npm_exe_name) : npm_exe_name

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
    return `$npm_executable_path`
end

end # module
