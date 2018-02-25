using NodeJS
using Base.Test

@testset "NodeJS" begin

@test chomp(readstring(`$(nodejs_cmd()) -v`)) == "v8.9.4"
@test chomp(readstring(`$(npm_cmd()) -v`)) == "5.6.0"

end
