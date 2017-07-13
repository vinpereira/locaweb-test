# Locaweb Test

For more information about the test itself, check the README.md file (in pt-br) at docs/locaweb-test-overview/ folder.

## Programming Language, Docker and Docker Compose version, and libraries used to solve the problems

  - Ruby 2.4.1 @ Ubuntu 17.04 64-bits
  - Docker 17.06.0-ce
  - Docker Compose 1.14.0

Main libraries:
- cucumber        ~>2.4.0
- httparty        ~>0.15.5
- puma            ~>3.9.1
- rspec           ~>3.6.0
- shotgun         ~>0.9.2
- sinatra         ~>2.0.0
- sinatra-contrib ~>2.0.0
- webmock         ~>2.3.2'

### Running the code with Docker Compose
- Clone this repository and access its root folder

- Run Docker Compose (re)start a container
  - If there is no image available (or is the first time) then Docker Compose will build the image
```sh
$ docker-compose up
```

- Access ```localhost:9292/api/v1/most_relevants``` or ```localhost:9292/api/v1/most_mentions``` to see the data (JSON format)

### Running the code with Docker
- Clone this repository and access its root folder

- Build a Docker image for this project
```sh
$ docker build -t my-app-locaweb-tweets-test .
```

- Run a Docker container with the image
```sh
$ docker run -d --name locaweb-tweets-test -p 9292:9292 my-app-locaweb-tweets-test
```

- Access ```localhost:9292/api/v1/most_relevants``` or ```localhost:9292/api/v1/most_mentions``` to see the data (JSON format)

### Running the code without Docker or Docker Compose
- Clone this repository and access its root folder

- Execute ```bundle install``` to install all dependencies

Then

- Start server with autoreload (for development)
```sh
$ shotgun --port=9292
```

- Access ```localhost:9393/api/v1/most_relevants``` or ```localhost:9393/api/v1/most_mentions``` to see the data (JSON format)

OR

- Start server with autoreload (for production/test)
```sh
$ puma
```

- Access ```localhost:9292/api/v1/most_relevants``` or ```localhost:9292/api/v1/most_mentions``` to see the data (JSON format)

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

## Why I used such technologies?
#### Ruby
I chose Ruby for two reasons:
- It is the main programming language at Locaweb
- It is my favorite language (Although I could have done this project with Node.js or Python -- my other favorites)

#### RSpec, Cucumber, and Webmock
I have a strong experience with tests (academic and professional) and I like both. So I used them. Yes, I could use just one of them (for this project I would prefer to use RSpec) but I chose to show both of them here in my code.

This was my first time using Webmock. Since Locaweb Tweets changes every time I make a request, I realized that it was necessary to mock some data and simulate (stub) a request to test my methods always with this mocked data. For my first time with this library, I could say that I liked.

#### HTTParty
Frankly, once I met this library, I fell in love with it. I use it whenever possible.

#### Puma and Shotgun
I use Shotgun for autoreload when developing (a habit that I got in Node.js with nodemon). As for Web Server, I prefer to not use WebBrick in production. I could use Thin, but I have little more experience with Puma. So, I used it.

#### Sinatra
Since this was a small project with only two endpoints, I decided that Sinatra was a better fit. I could used Rails but (at least for me) it would be a cannon to kill a fly.
