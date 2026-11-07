# Todos API

Deeper Than Code Ruby example: Ruby 3.4, Rails 8.1 (API-only), Puma, the `pg` adapter, and rack-cors. Postgres arrives as `DATABASE_URL`; `bin/boot` runs `rails db:prepare` (creates or migrates the `todos` table, idempotently) and then starts Puma. By Arthur Bernier Jr.

Live: https://api-production-0197.up.railway.app

| Request | Response |
|---|---|
| GET /health | 200 `{"ok":true}` |
| GET /todos | 200 `[{id,subject,details}]` ordered by id |
| GET /todos/:id | 200 object, or 404 `{"error":"not found"}` |
| POST /todos `{subject,details}` | 201 object |
| PUT /todos/:id `{subject,details}` | 200 object, or 404 |
| DELETE /todos/:id | 204 empty, or 404 |
| blank or missing subject or details | 400 `{"error":"<message>"}` |
| malformed JSON | 400 `{"error":"malformed JSON body"}` |

Prove it against the live URL:

```
node check.mjs https://api-production-0197.up.railway.app
```

Environment variables it reads: `DATABASE_URL` (required), `SECRET_KEY_BASE` (required in production), `RAILS_ENV` (`production` on Railway), `PORT` (falls back to 8080), and `RAILS_MAX_THREADS` (defaults to 5).

Do not commit `SECRET_KEY_BASE` or `DATABASE_URL`.
