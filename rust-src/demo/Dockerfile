FROM rust:1.38.0

WORKDIR /usr/src/app

COPY . .

RUN cargo install --path .

EXPOSE 3020

CMD ["demo"]