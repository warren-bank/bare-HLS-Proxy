### [_Bare.js HLS Proxy_](https://github.com/warren-bank/bare-HLS-Proxy) : HTTP Live Streaming Proxy for the [_Bare JS_](https://github.com/holepunchto/bare) [Runtime](https://github.com/holepunchto/bare-runtime)

#### Documentation

* please refer to the documentation for: [_Node.js HLS Proxy_](https://github.com/warren-bank/HLS-Proxy) : HTTP Live Streaming Proxy for the [_Node JS_ Runtime](https://nodejs.org/)
* please refer to [notes](https://github.com/warren-bank/bare-HLS-Proxy/blob/master/.recipes/01.%20generic%20use%20cases%20-%20not%20supported/notes.txt) that summarize [command-line options](https://github.com/warren-bank/HLS-Proxy#options) that are not supported by the _Bare JS_ Runtime

#### Roadblocks

* [`bare-http1.request()`](https://github.com/holepunchto/bare-http1/issues/32)
  - solution: issue proposes a one-line fix
* [`bare-https.request()`](https://github.com/holepunchto/bare-https/issues/2)
  - solution: issue proposes a one-line fix
* [`bare-tcp.Server.listen()`](https://github.com/holepunchto/bare-tcp/issues/13)
  - solution: issue proposes a trivial fix
  - workaround:
    * apply a downstream one-line fix both [here](https://github.com/warren-bank/HLS-Proxy/blob/v3.6.2/hls-proxy/servers/start_http.js#L8) and [here](https://github.com/warren-bank/HLS-Proxy/blob/v3.6.2/hls-proxy/servers/start_https.js#L21)&hellip;
      - old: `server.listen(port,`
      - new: `server.listen(port, '0.0.0.0',`
* [`bare-http1.ServerResponse.writeHead()`](https://github.com/holepunchto/bare-http1/issues/33)
  - solution: issue proposes a one-line fix

#### TBD

Additional issues that need to be investigated.
Tests performed with all of the above "Roadblocks" fixed by small patches and/or workarounds.

* XHR request timeout
  - .m3u8 manifests
    * OK to download from browser URL bar
    * OK to download via XHR
  - .ts segments
    * OK to download from browser URL bar
    * FAIL to download via XHR
      - no response from proxy server
      - client eventually times out and tries again
  - thoughts:
    * probably has to do with `bare-stream`
    * .ts segments are streamed
    * .m3u8 manifests are fully downloaded for rewriting
    * doesn't explain why it works in non-XHR contexts

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
