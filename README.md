# Locaweb Test

For more information about the test itself, check the README.md file at locaweb-test-overview folder.

To solve the test I needed to learn about HTTParty and SitePrism. It was fun =)

I need to better understand the Section in SitePrism to improve my code.

## Programming Language, Docker version, and libraries used to solve the problems

  - Ruby 2.4.1 @ Ubuntu 17.04 64-bits
  - Docker 17.06.0-ce

Main libraries:
- cucumber        ~>2.4.0
- httparty        ~>0.15.5
- puma            ~>3.9.1
- rspec           ~>3.6.0
- shotgun         ~>0.9.2
- sinatra         ~>2.0.0
- sinatra-contrib ~>2.0.0
- webmock         ~>2.3.2'

### Running the code with Docker
- Clone this repository and access its root folder

- Run Docker Compose (re)start a container
  - If there is no image available (or is the first time) then Docker Compose will build the image
```sh
$ docker-compose up
```

- Access ```localhost:9393/api/v1/most_relevants``` or ```localhost:9393/api/v1/most_mentions``` to see the data (JSON format)

### Running the code without Docker
- Clone this repository and access its root folder

- Start server with autoreload (for development)
```sh
$ shotgun
```

- Start server with autoreload (for production/test)
```sh
$ puma
```

- Access ```localhost:9393/api/v1/most_relevants``` or ```localhost:9393/api/v1/most_mentions``` to see the data (JSON format)

#### For tests
In the root folder:

- Execute tests with a Cucumber profile (see more at cucumber.yml)

```sh
$ cucumber -p html_reports
```

- Execute tests with RSpec

```sh
$ rspec
```
