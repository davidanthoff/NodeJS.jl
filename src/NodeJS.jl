module NodeJS

using BinDeps

@BinDeps.load_dependencies

function run_node(cmd::AbstractString)
    node_path = BinDeps.node[1][2]
    run(`$node_path $cmd`)
end

end # module
