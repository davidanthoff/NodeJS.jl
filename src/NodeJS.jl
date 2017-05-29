module NodeJS

using BinDeps

export run_node

@BinDeps.load_dependencies

println(node)

function run_node(cmd::AbstractString)
    node_path = node[1][2]
    readstring(`$node_path $cmd`)
end

end # module
