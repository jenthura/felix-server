
CREATE TYPE income_type AS ENUM (
    'paycheck',
    'freelance',
    'side_gig',
    'other'
    );

CREATE TABLE IF NOT EXISTS "income" (
    "id" INTEGER PRIMARY KEY GENERATED BY DEFAULT AS IDENTITY,
    "user_id" INTEGER 
        REFERENCES "users"(id) ON DELETE CASCADE NOT NULL,
    "income_amount" NUMERIC(12,2) CHECK (income_amount >= 0) DEFAULT 0 NOT NULL,
    "transaction_category" income_type NOT NULL,
    "date_created" TIMESTAMP DEFAULT now() NOT NULL
);