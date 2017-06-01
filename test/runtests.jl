using Compat
using NodeJS
using Base.Test

@test chomp(readstring(`$(nodejs_cmd()) -v`)) == "v6.10.3"
@test chomp(readstring(`$(nodejs_cmd()) $(npm_script()) -v`)) == "3.10.10"
