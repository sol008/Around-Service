# Lightweight alpine OS, weight only 5mb, everything else is Go # # environment
FROM golang:1.10.4

# Define working directory
WORKDIR /go/src/github.com/sol008/around


# Add files from your laptop to inside the docker image
ADD . /go/src/github.com/sol008/around

# Install dependencies
RUN go get -v \
cloud.google.com/go/bigtable \
cloud.google.com/go/storage \
github.com/auth0/go-jwt-middleware \
github.com/dgrijalva/jwt-go \
github.com/gorilla/mux \
github.com/olivere/elastic \
github.com/pborman/uuid \
github.com/pkg/errors \
golang.org/x/oauth2/google

# Expose port
EXPOSE 8080

# Entrypoint
CMD ["/usr/local/go/bin/go", "run", "user.go", "ml.go", "main.go" ]
