module NodeJS

export run_node, node_exe

depsjl = joinpath(@__DIR__, "..", "deps", "deps.jl")
if !isfile(depsjl)
    error("NodeJS not properly installed. Please run\nPkg.build(\"NodeJS\")")
else
    include(depsjl)
end

function node_exe()
    return node_executable
end

function run_node(cmd::AbstractString)
    readstring(`$node_executable $cmd`)
end

function run_npm(command::AbstractString, dir::AbstractString)    
    cmd = Cmd(`$npm_executable $command`, dir=dir)
    println(cmd)
    readstring(cmd)
end

end # module
