# Build with docker build -t nvchad .
# Run with docker run -it -v $HOME:/home nvchad
# (You should provide a name for the
# container when running by using --name)

FROM alpine:latest

RUN apk update && apk upgrade
RUN apk --no-cache add git nodejs neovim ripgrep build-base wget curl --update

RUN mkdir -p /app
WORKDIR /app

RUN adduser -D -u 1000 user
USER user

VOLUME ["/home"]

RUN git clone https://github.com/NvChad/NvChad /nvchad
# Run NvChad when running the container with
# the init.lua provided by the NvChad repository
CMD ["nvim",  "-u", "/nvchad/init.lua"]
