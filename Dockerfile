FROM gitlabregistry.elyas.ir/elyas/node16:latest as builder
RUN mkdir /build
WORKDIR /build
COPY package.json /build
RUN yarn
COPY . /build
RUN yarn build

FROM gitlabregistry.elyas.ir/elyas/nginx_alpine:latest
COPY --from=builder /build/build /usr/share/nginx/html
EXPOSE 80
