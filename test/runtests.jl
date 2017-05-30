using NodeJS
using Base.Test

@test chomp(run_node("-v")) == "v6.10.3"
