module NodeJS

export run_node

depsjl = joinpath(@__DIR__, "..", "deps", "deps.jl")
if !isfile(depsjl)
    error("NodeJS not properly installed. Please run\nPkg.build(\"NodeJS\")")
else
    include(depsjl)
end

function run_node(cmd::AbstractString)
    readstring(`$node_executable $cmd`)
end

end # module
