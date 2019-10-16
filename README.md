# Rust POC
## Prerequisites

1. Install vagrant: https://www.vagrantup.com/downloads.html
2. Clone the repository: `git clone https://github.com/ibanfi/codius-demo.git`

## Build environment

```
cd codius-demo
vagrant up
```

## Use the environment (connect to vm)

`vagrant ssh`

## Stop/start environment

`vagrant halt/vagrant up`

## Remove entire environment

`vagrant destroy`

## Run Rust POC apps

```
vagrant ssh
cd src/demo/
cargo run
```

### Todo
- dockerizing moneyd, codiusd(?), codius(?)
- creating spsp server (in docker)
- using docker-compose for the full env
