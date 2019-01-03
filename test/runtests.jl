using NodeJS
using Test

@testset "NodeJS" begin

@test chomp(read(`$(nodejs_cmd()) -v`, String)) == "v10.15.0"
@test chomp(read(`$(npm_cmd()) -v`, String)) == "6.4.1"

end
