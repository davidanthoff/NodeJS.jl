using NodeJS
using Test

@testset "NodeJS" begin

@test chomp(read(`$(nodejs_cmd()) -v`, String)) == "v12.13.1"
@test chomp(read(`$(npm_cmd()) -v`, String)) == "6.12.1"

end
