# Klepto

Any requests made to `/audit_requests` will be viewable at `/`

```
{
  id: 3,
  method: "GET",
  url: "http://localhost:3000/audit_requests?query=1&a=2",
  headers: {
    SERVER_SOFTWARE: "thin 1.7.2 codename Bachmanity",
    SERVER_NAME: "localhost",
    REQUEST_METHOD: "GET",
    REQUEST_PATH: "/audit_requests/",
    PATH_INFO: "/audit_requests",
    QUERY_STRING: "query=1&a=2",
    REQUEST_URI: "/audit_requests/?query=1&a=2",
    HTTP_VERSION: "HTTP/1.1",
    HTTP_HOST: "localhost:3000",
    HTTP_CONNECTION: "keep-alive",
    HTTP_UPGRADE_INSECURE_REQUESTS: "1",
    HTTP_USER_AGENT: "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36",
    HTTP_ACCEPT: "text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8",
    HTTP_ACCEPT_ENCODING: "gzip, deflate, br",
    HTTP_ACCEPT_LANGUAGE: "en-US,en-AU;q=0.9,en;q=0.8,en-CA;q=0.7",
    HTTP_COOKIE: "_ga=GA1.1.1283864371.1524362758; _gid=GA1.1.983936869.1525390641; _field_guide_key=SFMyNTY.g3QAAAADbQAAAA9jdXJyZW50X3Nlc3Npb25tAAAAJDNkNTBlNWY3LWNjZTAtNDk2OS1iYjA5LWNkMTJhYTM2ZjI5OW0AAAAMY3VycmVudF91c2VyYQFtAAAAC3JlZGlyZWN0X3RvZAADbmls.SdvX8Mn2JElkhhp_99oTB8ifFrjN7bK6d_WJM2cwdhc",
    GATEWAY_INTERFACE: "CGI/1.2",
    SERVER_PORT: "3000",
    SERVER_PROTOCOL: "HTTP/1.1",
    SCRIPT_NAME: "",
    REMOTE_ADDR: "::1",
    ORIGINAL_FULLPATH: "/audit_requests/?query=1&a=2",
    ORIGINAL_SCRIPT_NAME: "",
    ROUTES_70198630347420_SCRIPT_NAME: ""
  },
  query: {
    query: "1",
    a: "2"
  },
  body: "",
  created_at: "2018-05-04T15:54:41.734Z",
  updated_at: "2018-05-04T15:54:41.734Z"
}
```

# Build Machine
$`docker-machine create --driver digitalocean --digitalocean-access-token $DIGITALOCEAN klepto`  
$`docker-machine env klepto`  
$`eval "$(docker-machine env klepto)"`

# Build Images
$`docker build -t klepto .`  
$`docker build -t nginx -f NginxDockerfile .`

# Run Containers
$`docker run -d --name db postgres:9.4`  
$`docker run --link db:db --rm klepto rake db:create db:migrate db:seed`  
$`docker run -d -p 3000:3000 --link db:db  --name railsapp klepto rails s -b 0.0.0.0 -p 3000`  
$`docker run -d -p 80:80 -p 443:443 --link railsapp:railsapp --name nginx nginx`
