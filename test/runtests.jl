using NodeJS
using Test

@testset "NodeJS" begin

@test chomp(read(`$(nodejs_cmd()) -v`, String)) == "v8.11.3"
@test chomp(read(`$(npm_cmd()) -v`, String)) == "5.6.0"

end
