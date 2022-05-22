# ShortURL

## Getting Started

Here are steps to run the service locally:
*  Clone the code: git@github.com:hellovietnam93/short-url.git

```bash
git clone git@github.com:hellovietnam93/short-url.git
```

*  Install Ruby: ruby-3.0.2

```bash
rvm install 3.0.2
```

*  Install Rails: 7.0.3

```bash
gem install rails:7.0.3
```

*  Install PostgeSQL: 13

```bash
docker run --name postgres13 -p 5433:5432 -e POSTGRES_PASSWORD=12345678 -v pg-data:/var/lib/postgresql/data -d postgres:13
```

*  Bundle install

```bash
bundle install
```

*  Setup database

```bash
rails db:setup
```
*  Start server

```bash
rails s
```

## Running the tests

**Before make a pull request, please make sure all test are passed locally.**

*  Unit test

```bash
rspec
```

*  Security check

```bash
brakeman
```

*export warning to file*

```bash
brakeman -o brakeman_results.html
```

*  Coding style

```bash
rubocop -a
```

*export warning to file*

```bash
rubocop -a --out rubocop.xml
```

*  Patch-level verification for bundler

```bash
bundle-audit check --update
```

*export warning to file*

```bash
bundle-audit check --update > bundle-audit.txt
```

## API document

- https://s-u-t.herokuapp.com/doc/index.html

## Test API

*Encode an origin url*

```bash
curl --location --request POST 'https://s-u-t.herokuapp.com/encode' \
--header 'Content-Type: application/json' \
--data-raw '{
    "link": {
        "url": "https://zingnews.vn/khan-gia-xep-hang-dai-de-co-vu-esports-o-sea-games-31-post1319504.html#zingweb_home_sectionfeatured1"
    }
}'
```

*Response*

```json
{
    "data": {
        "id": "1",
        "type": "link",
        "attributes": {
            "url": "https://zingnews.vn/khan-gia-xep-hang-dai-de-co-vu-esports-o-sea-games-31-post1319504.html#zingweb_home_sectionfeatured1",
            "short": "https://s-u-t.herokuapp.com/s/6a325d",
            "clicked": 0
        }
    }
}
```

*Decode an short url*
```bash
curl --location --request GET 'https://s-u-t.herokuapp.com/decode?url=https://s-u-t.herokuapp.com/s/ed16d1'
```

*Response*

```bash
{
    "data": {
        "id": "1",
        "type": "link",
        "attributes": {
            "url": "https://zingnews.vn/khan-gia-xep-hang-dai-de-co-vu-esports-o-sea-games-31-post1319504.html#zingweb_home_sectionfeatured1",
            "short": "https://s-u-t.herokuapp.com/s/6a325d",
            "clicked": 1
        }
    }
}
```
