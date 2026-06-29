# dbt E-commerce Analytics Mart

This project is a production-quality Analytics Engineering portfolio project using the real Olist Brazilian E-Commerce Dataset.

## Architecture

The project follows the dbt best practices with a staging → intermediate → marts architecture.

## Setup

1. Clone the repository.
2. Set up your PostgreSQL database and create a schema named `olist`.
3. Load the Olist dataset into the `olist` schema.
4. Configure your `dbt_project.yml` file with the correct profile settings.
5. Run `dbt run` to build the models.

## Data Model

The data model consists of the following tables:

- **staging**: Contains raw data from the Olist dataset.
- **intermediate**: Transforms the raw data into a more structured format.
- **marts**: Provides pre-aggregated views for reporting and analysis.

## Screenshots

- [Architecture](screenshots/architecture.png)
- [Setup](screenshots/setup.png)
- [Data Model](screenshots/data_model.png)
- [Dashboard](screenshots/dashboard.png)

## Business Context

This project aims to provide a comprehensive analytics mart for the Olist Brazilian E-Commerce Dataset, enabling business analysts and stakeholders to gain insights into customer behavior, product performance, and seller metrics.
