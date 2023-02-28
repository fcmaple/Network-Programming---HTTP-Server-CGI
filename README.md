# http-server-cgi
implement a simple HTTP server &amp; a CGI program with Boost.Asio library 

## Prerequisite
- install Boost library.  
`sudo apt-get install boost-all-dev`
## How to use
- build
```shell=
cd http-server-cgi
make
```
- start
```shell=
./http_server [port]
```
- visit
  - web  (http://[host]:[port]/panel.cgi)
## implement detail
### HTTP Server
1. URL of HTTP requests will always be in the form of `./[cgi_name].cgi`  (ex:`./panel.cgi`,`./console.cgi`),and only support HTTP GET method.
2. `http_server` will parse the HTTP headers and follow the CGI procedure (fork,set environment variables, dup , exec) to excute the specified CGI programs.
3. the following environment variables are required to set:
  - REQUEST METHOD
  - REQUEST URI
  - QUERY STRING
  - SERVER PROTOCOL
  - HTTP HOST
  - SERVER ADDR
  - SERVER PORT
  - REMOTE ADDR
  - REMOTE PORT
4. HTTP example
```shell=
GET /console.cgi?h0=nplinux1.cs.nctu.edu.tw&p0= ... (too long, ignored)
Host: nplinux8.cs.nctu.edu.tw:7779
User-Agent: Mozilla/5.0
Accept: text/html,application/xhtml+xml,applica ... (too long, ignored)
Accept-Language: en-US,en;q=0.8,zh-TW;q=0.5,zh; ... (too long, ignored)
Accept-Encoding: gzip, deflate
DNT: 1
Connection: keep-alive
Upgrade-Insecure-Requests: 1
```
### console.cgi
1. the console.cgi should parse the connection information (e.g. host,port,file) from the environment vairable QUERY_STRING, which is set by `http_server`.
2. The remote servers that console.cgi connects to are Remote Working Ground Servers with shell prompt ”% ”, and the files (e.g., t1.txt) contain the commands for the remote shells.
### panel.cgi
1. This CGI program generates the form in the web page. It detects all files in the directory `test case/` and display them in the selection menu.

