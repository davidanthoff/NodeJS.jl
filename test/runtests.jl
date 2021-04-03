using NodeJS
using Test

@testset "NodeJS" begin

    node_v = chomp(read(`$(nodejs_cmd()) -v`, String))
    npm_v = chomp(read(`$(npm_cmd()) -v`, String))

    if NodeJS.nodejs_path !== nothing
    @test node_v == "v12.13.1"
    @test npm_v == "6.12.1"
end

end
