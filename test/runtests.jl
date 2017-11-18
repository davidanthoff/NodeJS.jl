using Compat
using NodeJS
using Base.Test

@test chomp(readstring(`$(nodejs_cmd()) -v`)) == "v8.9.1"
@test chomp(readstring(`$(npm_cmd()) -v`)) == "5.5.1"
