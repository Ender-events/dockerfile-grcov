FROM rust:slim

RUN rustup install nightly \
    && cargo install grcov \
    && apt-get update && apt-get install -y zip \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* \
    && rm -rf ~/.cargo/registry

ADD coverage.sh coverage.sh

WORKDIR /input
ENV CARGO_INCREMENTAL=0 \
    RUSTFLAGS="-Zprofile -Ccodegen-units=1 -Cinline-threshold=0 -Clink-dead-code -Coverflow-checks=off -Zno-landing-pads"

CMD [ "/coverage.sh" ]
