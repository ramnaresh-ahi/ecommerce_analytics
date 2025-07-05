# 🛒 ecommerce\_analytics

A complete analytics engineering project to analyze e-commerce orders and user demographics using dbt and BigQuery.

---

## 📊 Project Overview

This project explores transactional e-commerce data with a focus on:

* Orders and their frequency
* User demographic distribution (e.g., gender)
* Sales events and their impact
* Product inventory and distribution behavior
* Source-based analysis of users

It follows the **modern data stack** approach using **dbt**, **BigQuery**, and **GitHub**, and is built with a modular structure following analytics engineering best practices.

---

## 📦 Source Data

* **Dataset:** [Looker E-Commerce BigQuery Dataset – Kaggle](https://www.kaggle.com/datasets/mustafakeser4/looker-ecommerce-bigquery-dataset)
* **Tables included:**

  * `orders`
  * `users`
  * `order_items`
  * `products`
  * `inventory_items`
  * `distributions`
  * `events`

---

## 🧱 dbt Model Structure

Your project follows the standard layered architecture:

```
ecommerce_analytics/
├── models/
│   ├── staging/                # Raw data cleaned and standardized
│   │   ├── stg_orders.sql
│   │   ├── stg_users.sql
│   │   ├── stg_order_items.sql
│   │   ├── stg_products.sql
│   │   ├── stg_inventory_items.sql
│   │   ├── stg_distributions.sql
│   │   └── stg_events.sql
│
│   ├── intermediate/           # Joined or enriched data models
│   │   ├── int_users.sql
│   │   ├── int_orders.sql
│   │   ├── int_order_items.sql
│   │   ├── int_products.sql
│   │   ├── int_inventory.sql
│   │   ├── int_distributions.sql
│   │   └── int_events.sql
│
│   ├── marts/                  # Final business-level fact/dim tables
│   │   ├── dim_orders.sql
│   │   ├── dim_users.sql
│   │   ├── dim_products.sql
│   │   ├── dim_events.sql
│   │   ├── dim_inventory.sql
│   │   ├── dim_distributions.sql
│   │   └── fact_ecommerce_analytics.sql
│
│   └── schema.yml              # Tests & documentation for models
│
├── macros/                     # Custom dbt macros
│   └── greater_than_zero.sql
│
├── dbt_project.yml             # Project config
└── README.md                   # 📘 You're here
```

---

## 🪰 Tools Used

| Tool         | Purpose                        |
| ------------ | ------------------------------ |
| **dbt**      | Data modeling & transformation |
| **BigQuery** | Cloud data warehouse           |
| **GitHub**   | Version control                |
| **Kaggle**   | Source of raw dataset          |

---

## ⚙️ Setup Instructions

1. **Clone the repo**

   ```bash
   git clone https://github.com/ramnaresh-ahi/ecommerce_analytics.git
   cd ecommerce_analytics
   ```

2. **Install dbt**
   Make sure you have dbt-core and dbt-bigquery installed:

   ```bash
   pip install dbt-bigquery
   ```

3. **Set up BigQuery authentication**

   * Create a service account in GCP.
   * Download the JSON key file.
   * Set the environment variable:

     ```bash
     export GOOGLE_APPLICATION_CREDENTIALS="path/to/key.json"
     ```

4. **Configure `profiles.yml`**
   Example:

   ```yaml
   ecommerce_analytics:
     target: dev
     outputs:
       dev:
         type: bigquery
         method: service-account
         project: ecommerce-analysis-464405
         dataset: ecommerce_analytics
         threads: 4
         keyfile: path/to/key.json
   ```

5. **Run dbt commands**

   ```bash
   dbt debug                # Test the connection
   dbt deps                 # Install dependencies
   dbt seed                 # (Optional) Load any seed data
   dbt run                  # Run models
   dbt test                 # Run tests
   dbt docs generate && dbt docs serve  # View documentation
   ```

---

## 🧲 Testing & Validation

* Custom macros such as `greater_than_zero` are used for validating numerical columns.
* Schema tests are defined in `schema.yml` for:

  * Uniqueness
  * Not null
  * Accepted values

---

## 🔑 Surrogate Key Strategy

We use a macro from `dbt_utils` to generate surrogate keys by hashing important IDs:

```sql
{{ dbt_utils.generate_surrogate_key([
    'order_id',
    'user_id',
    'order_item_id',
    'prod_id',
    'inventory_id',
    'dist_id',
    'event_id'
]) }} AS analytic_id
```

This ensures each row is uniquely and consistently identified in the fact table.

---

## 📈 Fact Table: `fact_ecommerce_analytics`

This table combines cleaned and joined data from all dimensions and contains metrics like:

* Total orders
* Total users
* Total order items
* Total inventory
* Total products
* Total events
* Total distributors

Each record is uniquely identified using a surrogate `analytic_id`.

---

## 📘 Future Enhancements

* Add dashboarding (e.g., using Looker Studio or Metabase)
* Implement incremental models
* Add model-level descriptions in the dbt docs
* Integrate CI/CD pipeline

---

## 👤 Author

**Name**: *\[Ramnaresh Ahirwar]*
**Role**: Analytics Engineer
**GitHub**: [your-username](https://github.com/ramnaresh-ahi)

---

## 📄 License

This project is licensed under the [MIT License](LICENSE).
