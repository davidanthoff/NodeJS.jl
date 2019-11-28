using NodeJS
using Test

@testset "NodeJS" begin

node_v = chomp(read(`$(nodejs_cmd()) -v`, String))
npm_v = chomp(read(`$(npm_cmd()) -v`, String))

if !NodeJS.use_system_node
    @test node_v == "v12.13.1"
    @test npm_v == "6.12.1"
end

end
