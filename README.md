# ShortURL

Build and sample application to help user generate a short link

## API document

- https://s-u-t.herokuapp.com/doc/index.html

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

## Evaluation

- [x] Ruby best practices
    - Rubocop
    - bundle-audit check
    - brakeman
- [x] API implemented featuring a /encode and /decode endpoint
    - Encode endpoint: https://s-u-t.herokuapp.com/encode - POST
    - Decode endpoint: https://s-u-t.herokuapp.com/decode - GET
- [x] Completeness: Did you complete the features? Are all the tests running?
    - All feature completed
    - UT: 100%
- [x] Correctness: Does the functionality act in sensible, thought-out ways?
- [x] Maintainability: Is it written in a clean, maintainable way?
- [x] [Security: Have you identified potential issues and mitigated or documented them?](./documents/security.md)
- [x] [Scalability: What scalability issues do you foresee in your implementation and how do you plan to work around those issues?](./documents/scalability.md)
- [x] [Sample run](./documents/sample.md)

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
