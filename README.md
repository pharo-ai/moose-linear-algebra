![Build status](https://github.com/pharo-ai/linear-algebra/workflows/CI/badge.svg)
[![Coverage Status](https://coveralls.io/repos/github/pharo-ai/linear-algebra/badge.svg?branch=master)](https://coveralls.io/github/pharo-ai/linear-algebra?branch=master)
[![License](https://img.shields.io/badge/license-MIT-blue.svg)](https://raw.githubusercontent.com/pharo-ai/linear-algebra/master/LICENSE)

# Description

Linear Algebra classes for Pharo

## How to install it?

To install Linear Algebra, go to the Playground (Ctrl+OW) in your [Pharo](https://pharo.org/) image and execute the following Metacello script (select it and press Do-it button or Ctrl+D):

```Smalltalk
Metacello new
  baseline: 'AILinearAlgebra';
  repository: 'github://pharo-ai/linear-algebra/src';
  load.
```

## How to depend on it?

If you want to add a dependency on k-means to your project, include the following lines into your baseline method:

```Smalltalk
spec
  baseline: 'AILinearAlgebra'
  with: [ spec repository: 'github://pharo-ai/linear-algebra/src' ].
```

If you are new to baselines and Metacello, check out the [Baselines](https://github.com/pharo-open-documentation/pharo-wiki/blob/master/General/Baselines.md) tutorial on Pharo Wiki.

## How to use it?

WiP
