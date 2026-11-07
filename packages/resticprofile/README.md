# resticprofile

**resticprofile** is the missing link between a configuration file and the [restic backup](https://restic.net/) command line.

## Features

- **Profiles**
  - No need to remember command parameters and environment variables
  - Create multiple profiles in one configuration file
  - Profiles can inherit options from other profiles
  - Create groups of profiles to run sequentially
  - Easily schedule backups, retentions, and checks (supports *Windows Task Scheduler*, *systemd*, *crond*, and *launchd*)
  - Use template syntax in your configuration file
- **Automation**
  - Run the forget command before or after a backup (in a section called *retention*)
  - Check a repository before or after a backup
  - Run shell commands before or after running a profile, useful for mounting and unmounting backup disks
  - Run a shell command if an error occurs
  - Send a backup stream via *stdin*
  - Start restic at different priorities (Priority Class in Windows, *nice* in Unix, and/or *ionice* in Linux)
  - Automatically clear stale locks
- **Monitoring**
  - Generate a simple status file for monitoring software to ensure backups are running smoothly
  - Export a prometheus file after a backup or send the report to a push gateway
  - Send messages to HTTP hooks before, after a successful or failed job
  - Send resticprofile logs to a syslog server
- **Misc**
  - Check for enough memory before starting a backup
  - Generate cryptographically secure random keys for a restic key file
  - Prevent the system from idle sleeping

## Configuration files

The configuration file can be written in TOML, JSON, YAML or HCL.

## Notes

- resticprofile needs [restic](https://community.chocolatey.org/packages/restic) to be installed (e.g. `choco install restic`).
- This package uses the upstream `no_self_update` build, so `resticprofile self-update` is not available. Use `choco upgrade resticprofile` instead.

## Getting started

Start with the [getting started](https://creativeprojects.github.io/resticprofile/configuration/getting_started/index.html) guide. The full documentation is available at [creativeprojects.github.io/resticprofile](https://creativeprojects.github.io/resticprofile/).
