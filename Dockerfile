FROM python:3.9-slim

WORKDIR /app

COPY dbt_project.yml .
COPY models/ models/
COPY macros/ macros/
COPY snapshots/ snapshots/
COPY seeds/ seeds/
COPY tests/ tests/
COPY docs/ docs/

RUN pip install dbt-core dbt-postgres

CMD ["dbt", "run"]
