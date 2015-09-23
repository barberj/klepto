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
