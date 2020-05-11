# PlaceOS Partner Environment

For use when testing, improving or experimenting with PlaceOS on a local machine.
Use it for driver, frontend, api and infra development. Treat it as insecure.
When finished dev work for the day, stop the containers with `docker-compose down`

*NOT* for production use.

## Installation

`$ ./install`

### Dependencies

These will need to be installed prior to running `./install`:
- [docker](https://www.docker.com/)
- [docker-compose](https://github.com/docker/compose)
- [git](https://git-scm.com/)

### Optional tools (recommended)

- [watchexec](https://github.com/watchexec/watchexec) to run watch scripts (see `scripts/watch-crystal`)
- [lazydocker](https://github.com/jesseduffield/lazydocker) for easy docker monitoring
- [docker completion](https://docs.docker.com/compose/completion/) for more efficient terminal use

## Usage

1. Clone the environment: https://github.com/place-labs/partner-environment.git
2. Run the install script: `./install` (use this to update repositories and images too)

`install` (_should only be run once_) exposes additional services behind flags...
- Use the `-e` or `--elk` flag to run the Elastic stack with Kibana and Logstash
- Use the `-s` or `--sentry` flag to run Sentry

### Restart

`$ ./restart`

If you need to reset the state of the application, pass `--reset` or `-r`

### Developing drivers

1. Clone and 3rd party driver repositories into `./drivers/repositories`
2. Browse to http://localhost:8085/
3. You can edit drivers directly in VS Code.

### Debugging drivers

When driver specs are run with debug symbols they are launched with `gdbserver` for remote debugging.

1. Optionally add a `debugger` keyword to either your spec or driver code.
   * This is a compiled in breakpoint
2. run the spec, compiled with debug symbols
3. run `gdb` in a local terminal window
4. connect to the spec remote debug server `target remote localhost:4444`
5. to debug the driver, not just the spec use `set detach-on-fork on`
6. type `continue` to start program execution
7. type `info inferiors` to see the list of running processes
8. type `inferior 2` to switch to the driver process

### Locally Exposed Services

- Place Rest API (localhost:8082)
- Place Auth (localhost:8081)
- Place Core (localhost:8083)
- Place Frontends (localhost:8087)
- Rubbersoul (localhost:8084)
- Elasticsearch (localhost:8090)
- RethinkDB UI (localhost:8093)
- Redis (localhost:7379) \[[UI available](https://redislabs.com/redisinsight/)\]
