using NodeJS
using Test

@testset "NodeJS" begin

    node_v = chomp(read(`$(nodejs_cmd()) -v`, String))
    npm_v = chomp(read(`$(npm_cmd()) -v`, String))
    npx_v = chomp(read(`$(npx_cmd()) -v`, String))

    if NodeJS.nodejs_path !== nothing
        @test node_v == "v18.16.0"
        @test npm_v == "9.5.1"
        @test npx_v == "9.5.1"
    end

end
