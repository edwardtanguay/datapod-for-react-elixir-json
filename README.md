# datapod-for-react-php-json

This is a simple datapod template for a local site that displays data from a JSON file, which is created by a PHP script that parses a text file.

## Install Elixir

- installing on Windows:
	- install Elixir
		- https://elixir-lang.org/install.html
		- Download and run the Erlang installer
		- Download Windows Installer
	- install Erlang
		- https://elixir-lang.org/install.html#windows
		- Elixir 1.18.3 on Erlang 27
	- elixir -v
- installing on Ubuntu
	- https://elixir-lang.org/install.html#distributions
		- sudo add-apt-repository ppa:rabbitmq/rabbitmq-erlang
		- sudo apt update
		- sudo apt install git elixir erlang
	- elixir -v

## Set up

- `npm i`
- `npm run`
- Find out your Elixir version with `elixir -v`, and make sure it is the same as the Elixir version listed in your **mix.exs** file:

```
elixir: "~> 1.17.3",
```

- `mix deps.get` (kind of like `npm i` for Elixir, this installs e.g. the "jason" package listed in mix.exs)
	
## Compatibility

- ✔️ tested on Windows
- ✔️ tested on Ubuntu

## More Datapod templates and sites

https://datapod-tanguay-eu.vercel.app

## development log

- needed to install jason in order to create a JSON file
- so created mix.exs file with `mix new . --sup --app datapod_for_react_elixir_json`
- added `{:jason, "~> 1.4"}` to mix.exs
- `mix deps.get`
- `mix compile`
- after that now have to run scripts like this: `mix run scripts/commands/parse-data.ex`
