<p align="center">
  <img src="https://github.com/placeos.png?size=200" alt="PlaceOS" />
</p>

# Partner Environment

[![CI](https://github.com/place-labs/partner-environment/actions/workflows/ci.yml/badge.svg)](https://github.com/place-labs/partner-environment/actions/workflows/ci.yml)

For use when testing, improving or experimenting with PlaceOS on a local machine.
Use it for driver, frontend, api and infra development. Treat it as insecure.

When finished dev work for the day, stop the containers with `./placeos stop`

*NOT* for production use.

## Installation

1. `$ ./placeos start`
1. Navigate to https://localhost:8443/backoffice
1. Login with the credentials output by the CLI

## Configuration

- `PLACE_EMAIL`,`PLACE_PASSWORD`: Create an initial admin user via these environment variables
- `PLACE_DOMAIN`: Set an alternate application domain, defaults to `localhost:8443`

These environment variables can also be passed via the cli.

## Dependencies

These will need to be installed prior to running `./placeos start`:

- [docker](https://www.docker.com/)
- [docker-compose](https://github.com/docker/compose)
- [git](https://git-scm.com/)

### Optional tools

- [watchexec](https://github.com/watchexec/watchexec) to run watch scripts (see `scripts/watch-crystal`)
- [lazydocker](https://github.com/jesseduffield/lazydocker) for easy docker monitoring
- [docker completion](https://docs.docker.com/compose/completion/) for more efficient terminal use

## Usage

1. Clone the environment: https://github.com/place-labs/partner-environment.git
1. Run the install script: `./placeos start` (use this tool to update PlaceOS Version)

```shell-session
Usage: ./placeos [-h|--help] [command]

Helper script for interfacing with the PlaceOS Partner Environment

Command:
    start                   Start the environment.
    stop                    Stops the environment.
    help                    Display this message.
```

### `$ ./placeos start`

```shell-session
Usage: ./placeos start [-h|--help]

Start the PlaceOS environment

Arguments:
    --email EMAIL           Email to setup an admin account for. [default: support@place.tech]
    --password PASSWORD     Password for created admin account.
    --application APP_NAME  Application to configure. [default: backoffice]
    --domain DOMAIN         Domain to configure. [default: localhost:8443]
    --hard-reset            Reset the environment to a default state.
    -s, --sentry            Set-up Sentry
    -v, --verbose           Write logs to STDOUT in addition to the log file.
    -h, --help              Display this message
```

### `$ ./placeos stop`

```shell-session
Usage: ./placeos stop [-h|--help]

Stop the PlaceOS environment

Arguments:
    -v, --verbose           Write logs to STDOUT in addition to the log file.
    -h, --help              Display this message
```

## Drivers

See the [PlaceOS Drivers repository](https://github.com/PlaceOS/drivers) for further information.

## Service Graph

![Service graph for PlaceOS](/images/service-graph.png)
