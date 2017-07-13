# Locaweb Test

For more information about the test itself, check the README.md file at locaweb-test-overview folder.

To solve the test I needed to learn about HTTParty and SitePrism. It was fun =)

I need to better understand the Section in SitePrism to improve my code.

## Programming Language and libraries used to solve the problems

  - Ruby 2.4.1 @ Ubuntu 17.04 64-bits

Main libraries:
    - cucumber        ~>2.4.0
    - httparty        ~>0.15.5
    - puma            ~>3.9.1
    - rspec           ~>3.6.0
    - shotgun         ~>0.9.2
    - sinatra         ~>2.0.0
    - sinatra-contrib ~>2.0.0
    - webmock         ~>2.3.2'

### Running the codes
There are different ways to run this code -- all in the project's root directory

- Start server with autoreload (for development)
```sh
$ shotgun
```

- Start server with autoreload (for production/test)
```sh
$ puma
```

- Access ```localhost:9393/api/v1/most_relevants``` or ```localhost:9393/api/v1/most_mentions``` to se the data (JSON format)

#### For tests

- Execute tests with a Cucumber profile (see more at cucumber.yml)

```sh
$ cucumber -p html_reports
```

- Execute tests with RSpec

```sh
$ rspec
```
