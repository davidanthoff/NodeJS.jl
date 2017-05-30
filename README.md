# NodeJS

[![Project Status: Active - The project has reached a stable, usable state and is being actively developed.](http://www.repostatus.org/badges/latest/active.svg)](http://www.repostatus.org/#active)
[![Build Status](https://travis-ci.org/davidanthoff/NodeJS.jl.svg?branch=master)](https://travis-ci.org/davidanthoff/NodeJS.jl)
[![Build status](https://ci.appveyor.com/api/projects/status/5o398n4i1ug23v4s/branch/master?svg=true)](https://ci.appveyor.com/project/davidanthoff/nodejs-jl/branch/master)
[![codecov.io](http://codecov.io/github/davidanthoff/NodeJS.jl/coverage.svg?branch=master)](http://codecov.io/github/davidanthoff/NodeJS.jl?branch=master)

## Overview

This package installs a private copy of [Node.js](https://nodejs.org/en/) for use in julia packages. The package only exports two functions:

``nodejs_cmd()`` returns the full path of the node command.
``npm_cmd()`` returns the full path of the npm command.

The return value of both functions can be interpolated directly into julia ``Cmd`` instances.
