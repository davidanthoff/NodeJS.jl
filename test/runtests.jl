using NodeJS
using Test

@testset "NodeJS" begin

@test chomp(read(`$(nodejs_cmd()) -v`, String)) == "v12.13.0"
@test chomp(read(`$(npm_cmd()) -v`, String)) == "6.12.0"

end
