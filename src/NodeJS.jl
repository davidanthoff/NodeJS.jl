module NodeJS

export nodejs_cmd, npm_cmd

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
    return node_executable
end

"""
Return the full path of the npm command.
"""
function npm_cmd()
    return npm_executable
end

end # module
