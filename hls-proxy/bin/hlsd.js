#! /usr/bin/env bare

// global: process
require('bare-process/global')

// monkey patch: url.resolve
const url = require('bare-url')
url.resolve = function(base, input) {
  // https://nodejs.org/api/url.html#urlresolvefrom-to
  // https://github.com/holepunchto/bare-url/blob/v2.3.2/index.js#L283
  const result = url.parse(input, base)
  return result ? result.href : null
}

require('@warren-bank/hls-proxy/hls-proxy/bin/hlsd', {with: {imports: '../../package.json'}})
