using NodeJS
using Base.Test

@testset "NodeJS" begin

@test chomp(readstring(`$(nodejs_cmd()) -v`)) == "v8.10.0"
@test chomp(readstring(`$(npm_cmd()) -v`)) == "5.6.0"

end
