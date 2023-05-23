<p align="center">
    <img src="https://raw.githubusercontent.com/clivern/kemet/main/static/header.jpeg" width="100%" />
    <h3 align="center">Kemet</h3>
    <p align="center">My Personal dotfiles</p>
    <p align="center">
        <a href="https://github.com/Clivern/Kemet/actions/workflows/ci.yml">
           <img src="https://github.com/Clivern/Kemet/actions/workflows/ci.yml/badge.svg?branch=main"/>
        </a>
        <a href="https://uptime.betterstack.com/?utm_source=status_badge">
           <img src="https://uptime.betterstack.com/status-badges/v2/monitor/1evgt.svg"/>
        </a>
        <a href="https://pypi.org/project/opswork/">
            <img src="https://img.shields.io/badge/Built_with-OpsWork-blue"/>
        </a>
        <a href="https://radar.thoughtworks.com/?documentId=https%3A%2F%2Fraw.githubusercontent.com%2FClivern%2FKemet%2Fmain%2Ftradar.json">
            <img src="https://img.shields.io/badge/Technology-Radar-green.svg">
        </a>
        <a href="https://github.com/Clivern/Kemet/releases">
            <img src="https://img.shields.io/badge/Version-5.0.0-1abc9c.svg">
        </a>
        <a href="https://github.com/Clivern/Kemet/blob/master/LICENSE">
            <img src="https://img.shields.io/badge/LICENSE-MIT-blue.svg">
        </a>
    </p>
</p>
<br/>


### Usage

1. Clone the repository.

```zsh
# Create space directory
$ mkdir -p ~/space

$ git clone git@github.com:clivern/kemet.git ~/space/kemet
```

2. Install [opswork](https://pypi.org/project/opswork/) and `pip` globally.

```zsh
$ brew install yq

$ pip install ansible
$ pip install opswork
$ alias op=opswork
```

3. Init the configs

```zsh
$ op config init
$ op config dump
```

4. Add local as a host.

```zsh
$ make hosts
```

5. Add dotfiles recipes.

```zsh
$ make recipes
```

6. Run recipes one by one or the needed ones. for example to run `clivern/ping` towards host with name `localhost`.

```zsh
$ op recipe run clivern/linux/ping -h localhost -v key=value

# To get the must have list
$ op recipe list -t must_have -o json | jq .
```

6. To install dotfiles.

```zsh
$ make run
```

7. To run command either locally or remotely.

```zsh
# Add a Remote Linux Host
$ op host add clivern -i ~x.x.x.x~ -p 22 -u ~user~ -s /Users/root/.ssh/id_rsa.pem

# Check Uptime
$ op recipe run clivern/linux/cmd -h clivern -v cmd="uptime"

# Ping Remote Host
$ op recipe run clivern/linux/ping -h clivern

# Update
$ op recipe run clivern/linux/update -h clivern

# Upgrade
$ op recipe run clivern/linux/upgrade -h clivern

# Force Reboot
$ op recipe run clivern/linux/cmd -h clivern -v cmd="reboot"

# SSH to any Host
$ op host ssh clivern
```

8. Store the secrets in `OpsWork` vault.

```zsh
$ op secret add clivern/ai/google_palm_api_key "~~" -t ai
$ op secret add clivern/ai/openai_api_key "~~" -t ai
```

9. Secret can be loaded as environmental variable by adding it to `configs/secrets.j2` like the following.

```zsh
$ export OPENAI_API_KEY="$(op secret get clivern/ai/openai_api_key -o json | jq '.[0].value')"
```

10. To load secrets from terminal.

```zsh
$ source ~/.secrets
```

11. To list all recipes

```
$ op recipe list -o json | jq '.[].name'
```


### Technology Radar

My technology radar is stored in `tradar.json`

```json
[
  {
    "name": "..",
    "ring": "adopt or trial or assess or hold",
    "quadrant": "tools or techniques or platforms or languages-and-frameworks",
    "isNew": "FALSE or TRUE",
    "description": ".."
  }
]
```


### License

© 2010, Clivern. Released under [MIT License](https://opensource.org/licenses/mit-license.php).

**Kemet** is authored and maintained by [@clivern](http://github.com/clivern).
