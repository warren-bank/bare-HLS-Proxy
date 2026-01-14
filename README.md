### [_Bare.js HLS Proxy_](https://github.com/warren-bank/bare-HLS-Proxy) : HTTP Live Streaming Proxy for the [_Bare JS_](https://github.com/holepunchto/bare) [Runtime](https://github.com/holepunchto/bare-runtime)

#### Documentation

* please refer to the documentation for: [_Node.js HLS Proxy_](https://github.com/warren-bank/node-HLS-Proxy) : HTTP Live Streaming Proxy for the [_Node JS_ Runtime](https://nodejs.org/)
* please refer to [notes](https://github.com/warren-bank/bare-HLS-Proxy/blob/master/.recipes/01.%20generic%20use%20cases%20-%20not%20supported/notes.txt) that summarize [command-line options](https://github.com/warren-bank/node-HLS-Proxy#options) that are not supported by the _Bare JS_ Runtime

#### Roadblocks

* ~~[`bare-http1.request()`](https://github.com/holepunchto/bare-http1/issues/32)~~
  - solution: issue proposes a one-line fix
  - fixed: in [v4.2.1](https://github.com/holepunchto/bare-http1/releases/tag/v4.2.1) by [diff](https://github.com/holepunchto/bare-http1/compare/v4.2.0..v4.2.1)
* ~~[`bare-https.request()`](https://github.com/holepunchto/bare-https/issues/2)~~
  - solution: issue proposes a one-line fix
  - fixed: in [v2.1.2](https://github.com/holepunchto/bare-https/releases/tag/v2.1.2) by [diff](https://github.com/holepunchto/bare-https/compare/v2.1.1..v2.1.2)
* ~~[`bare-tcp.Server.listen()`](https://github.com/holepunchto/bare-tcp/issues/13)~~
  - solution: issue proposes a trivial fix
  - workaround:
    * apply a downstream one-line fix both [here](https://github.com/warren-bank/node-HLS-Proxy/blob/v3.6.2/hls-proxy/servers/start_http.js#L8) and [here](https://github.com/warren-bank/node-HLS-Proxy/blob/v3.6.2/hls-proxy/servers/start_https.js#L21)&hellip;
      - old: `server.listen(port,`
      - new: `server.listen(port, '0.0.0.0',`
    * fixed: in [v3.6.3](https://github.com/warren-bank/node-HLS-Proxy/releases/tag/v3.6.3) by [diff](https://github.com/warren-bank/node-HLS-Proxy/commit/01fa7aecca0c9466974902e6f00e2fd74622e29a)
* ~~[`bare-http1.ServerResponse.writeHead()`](https://github.com/holepunchto/bare-http1/issues/33)~~
  - solution: issue proposes a one-line fix
  - fixed: in [v4.2.2](https://github.com/holepunchto/bare-http1/releases/tag/v4.2.2) by [diff](https://github.com/holepunchto/bare-http1/compare/v4.2.1..v4.2.2)
* ~~`streamx.Stream.destroy()`~~
  - example:
    ```javascript
      const http = require('bare-http1')

      const url = 'http://httpbin.org/headers'

      const onresponse = (res) => {
        res.setEncoding('utf8')
        res.on('data', () => {})
        res.on('end', () => {
          console.log('request ended', res.statusCode, "\n")
          res.destroy()
          make_request()
        })
      }

      let remainder = 5

      const make_request = () => {
        if (remainder <= 0) return
        remainder--

        console.log('request started')
        http.request(url, onresponse).end()
      }

      make_request()
    ```
  - where:
    * `res` is an instance of [`bare-http1.IncomingMessage`](https://github.com/holepunchto/bare-http1/blob/v4.2.2/lib/incoming-message.js), which inherits from `streamx.Stream`
    * `res.destroy` === `res.socket.destroy` === [`streamx.Stream.destroy`](https://github.com/mafintosh/streamx/blob/v2.23.0/index.js#L673-L694)
  - workaround:
    * apply a downstream one-line fix by avoiding the redundant call to [`res.destroy()`](https://github.com/warren-bank/node-denodeify/blob/v2.1.2/denodeify.js#L200) from the `res.on('end')` event listener
    * fixed: in [v2.1.3](https://github.com/warren-bank/node-denodeify/releases/tag/v2.1.3) by [diff](https://github.com/warren-bank/node-denodeify/commit/711ba13ee46b279d295f0513f1fb5f357f66cba1)

- - - -

### Installation and Usage: Globally

#### How to: Install:

```bash
npm install --global "@warren-bank/bare-hls-proxy"
```

#### How to: Run the server(s):

```bash
bare-hlsd <options>
```

- - - -

### Installation and Usage: Working with a Local `git` Repo

#### How to: Install:

```bash
git clone "https://github.com/warren-bank/bare-HLS-Proxy.git"
cd "bare-HLS-Proxy"
npm install
```

#### How to: Run the server(s):

```bash
# ----------------------------------------------------------------------
# If using a port number >= 1024 on Linux, or
# If using Windows:
# ----------------------------------------------------------------------
npm start [-- <options>]

# ----------------------------------------------------------------------
# https://www.w3.org/Daemon/User/Installation/PrivilegedPorts.html
#
# Linux considers port numbers < 1024 to be privileged.
# Use "sudo":
# ----------------------------------------------------------------------
npm run sudo [-- <options>]
```

- - - -

#### Legal:

* copyright: [Warren Bank](https://github.com/warren-bank)
* license: [GPL-2.0](https://www.gnu.org/licenses/old-licenses/gpl-2.0.txt)
