# noflo-numbers [![Build Status](https://secure.travis-ci.org/razueroh/noflo-numbers.png?branch=master)](http://travis-ci.org/razueroh/noflo-numbers)

This package provides utility components for number representation in [NoFlo](http://noflojs.org/). Based on  [Javascript Number Methods](http://www.w3schools.com/js/js_number_methods.asp).

## Package Installation

    npm install noflo-numbers --save

## Component Usage

### ToExponential

Converts a number into an exponential notation

Port | Name | Datatype | Description
-----|------|----------|-------------
InPort | in | ```number``` | Input number
InPort | digits | ```number``` | Digits after decimal point. Integer between 0 and 20. If omitted, it is set to as many digits as necessary to represent the value  
OutPort | out | ```string``` | A String, representing the number as an exponential notation

### ToFixed

Converts a number into a string,
keeping a specified number of decimals

Port | Name | Datatype | Description
-----|------|----------|-------------
InPort | in | ```number``` | Input number
InPort | digits | ```number``` | Digits after decimal point. Int from 0 to 20. Default 0  
OutPort | out | ```string``` | A String, representing a number, with the exact number of decimals

### ToPrecision

Formats a number to a specified length

Port | Name | Datatype | Description
-----|------|----------|-------------
InPort | in | ```number``` | Input number
InPort | digits | ```number``` | Number of digits. Integer between 1 and 21. If omitted, it returns the entire number
OutPort | out | ```string``` | A String, representing a number formatted to the specified precision

### ToString

Converts a number into a string

Port | Name | Datatype | Description
-----|------|----------|-------------
InPort | in | ```number``` | Input number
InPort | radix | ```number``` | Base to use. Integer between 2 and 36. Default 10.
OutPort | out | ```string``` | A String, representing a number
