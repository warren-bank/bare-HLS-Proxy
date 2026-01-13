#! /usr/bin/env bare

// global: process
require('bare-process/global')

// monkey patch: url.parse
require('bare-url').parse = require('@warren-bank/url/es6-node/jsURL').parse

// monkey patch: url.resolve
require('bare-url').resolve = require('@warren-bank/url/es6-node/jsURL').resolve

require('@warren-bank/hls-proxy/hls-proxy/bin/hlsd', {with: {imports: '../../package.json'}})
