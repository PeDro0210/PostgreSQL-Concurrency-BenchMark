# PostgreSQL-Concurrency-BenchMark

A haskell-project oriented for testing concurrent queries to any postreSQL DB

## How to setup

- Install Ghcup
   > [!NOTE]
   > There are many ways to install Ghcup, but there are different setups depending your OS,
   > that's why I won't show you how to do it in here, but you can have the installation instructions:
   > <https://www.haskell.org/ghcup/install/>
>
- Install Cabal with Ghcup

   ```bash
   ghcup install cabal
   ``
- Clone the repo

  ```bash
   git clone https://github.com/PeDro0210/PostgreSQL-Concurrency-BenchMark.git
  ```

## How to run

```bash
cd PostgreSQL-Concurrency-BenchMark
cabal run exes -- <queries path> <uri> <separator-value> <threads quantity>
```

### Use Example

>``` bash
>cabal run exes -- queries/query_pool.sql postgresql://pedro0210:idunno_com@localhost:5432/db - 30
>```
