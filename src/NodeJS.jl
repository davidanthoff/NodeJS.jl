module NodeJS

using Compat

export nodejs_cmd, npm_script

depsjl = joinpath(@__DIR__, "..", "deps", "deps.jl")
if !isfile(depsjl)
    error("NodeJS not properly installed. Please run\nPkg.build(\"NodeJS\")")
else
    include(depsjl)
end

"""
Return the full path of the node command.
"""
function nodejs_cmd()
    return node_executable_path
end

"""
Return the full path of the npm command.
"""
function npm_script()
    return npm_script_path
end

end # module
