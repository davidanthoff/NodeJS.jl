using NodeJS
using Test

@testset "NodeJS" begin

@test chomp(read(`$(nodejs_cmd()) -v`, String)) == "v10.16.0"
@test chomp(read(`$(npm_cmd()) -v`, String)) == "6.9.0"

end
