FROM rust:1.65.0 as builder
WORKDIR /usr/src/surrealdb-actix
COPY . .
RUN rustc --version
RUN cargo install --path .

FROM debian:buster-slim
RUN apt-get update & apt-get install -y extra-runtime-dependencies & rm -rf /var/lib/apt/lists/*
COPY --from=builder /usr/local/cargo/bin/surrealdb-actix /usr/local/bin/surrealdb-actix
CMD ["surrealdb-actix"]