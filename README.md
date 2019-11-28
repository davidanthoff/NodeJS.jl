# NodeJS

[![Project Status: Active - The project has reached a stable, usable state and is being actively developed.](http://www.repostatus.org/badges/latest/active.svg)](http://www.repostatus.org/#active)
[![codecov.io](http://codecov.io/github/davidanthoff/NodeJS.jl/coverage.svg?branch=master)](http://codecov.io/github/davidanthoff/NodeJS.jl?branch=master)

## Overview

This package installs a private copy of [Node.js](https://nodejs.org/en/) for use in julia packages. The package only exports two functions:

``nodejs_cmd()`` returns the full path of the node command.
``npm_cmd()`` returns the full path of the npm command.

The return value of both functions can be interpolated directly into julia ``Cmd`` instances.
