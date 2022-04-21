![Build status](https://github.com/pharo-ai/moose-linear-algebra/actions/workflows/cimatrix.yml/badge.svg)
[![Coverage Status](https://coveralls.io/repos/github/pharo-ai/moose-linear-algebra/badge.svg?branch=master)](https://coveralls.io/github/pharo-ai/moose-linear-algebra?branch=master)
[![License](https://img.shields.io/badge/license-MIT-blue.svg)](https://raw.githubusercontent.com/pharo-ai/moose-linear-algebra/master/LICENSE)

# Description

Linear Algebra classes for Pharo ported from Moose

## How to install it?

To install Moose Linear Algebra, go to the Playground (Ctrl+OW) in your [Pharo](https://pharo.org/) image and execute the following Metacello script (select it and press Do-it button or Ctrl+D):

```Smalltalk
Metacello new
  baseline: 'AIMooseLinearAlgebra';
  repository: 'github://pharo-ai/moose-linear-algebra/src';
  load.
```

## How to depend on it?

If you want to add a dependency on Moose Linear Algebra to your project, include the following lines into your baseline method:

```Smalltalk
spec
  baseline: 'AIMooseLinearAlgebra'
  with: [ spec repository: 'github://pharo-ai/moose-linear-algebra/src' ].
```

If you are new to baselines and Metacello, check out the [Baselines](https://github.com/pharo-open-documentation/pharo-wiki/blob/master/General/Baselines.md) tutorial on Pharo Wiki.

## How to use it?

WiP
