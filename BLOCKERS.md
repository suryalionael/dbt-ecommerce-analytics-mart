# Blockers and workarounds

## Docker daemon not running

The Docker daemon was not running when this branch was built. The project was
run against the existing local PostgreSQL 16 instance on port 5432 using the
same `profiles.yml` environment variables (`POSTGRES_HOST`, `POSTGRES_PORT`,
`POSTGRES_USER`, `POSTGRES_PASSWORD`, `POSTGRES_DB`). `dbt deps` and
`dbt build` completed with 208 passing tests, 1 documented warning
(`customer_spend_accuracy`, 293 rows), and 0 errors. No model or SQL logic
depends on Docker.

## Pre-existing large raw CSVs

`seeds/raw/olist/` contains the real Olist CSVs (about 126 MB, six files over
5 MB). They were already tracked in this repository before the analytics
layer was added, and both CI and `docker/init/01_init_raw.sql` depend on them.
This branch did **not** add any new file over 5 MB. If repository size becomes
a problem, the safe migration is Git LFS or downloading the dataset in CI and
ignoring `seeds/raw/olist/`; that requires a CI change and was deliberately
left out of the analytics-layer work.
