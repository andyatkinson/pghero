# Scheduled Jobs

Scheduled Jobs are a way to automate database tasks using the [pg_cron extension](https://github.com/citusdata/pg_cron).

Scheduled Jobs integration in PgHero includes viewing Scheduled Jobs and details that have been captured about jobs that have ran.

## Installation

On a Mac, the extension may be built from source.

Add the extension to the `shared_preload_libraries` in `postgresql.conf` and restart.

Run `CREATE EXTENSION pg_cron`

## Configuration

Specify the database to run scheduled jobs for.

```
# add to postgresql.conf
cron.database_name = `postgres`
```

## Adding Jobs

To vacuum <tablename> manually, add an entry that looks like this.

```
SELECT cron.schedule('0 10 * * *', 'VACUUM tablename');
```

Confirm the entry was added on the Scheduled Jobs tab.

Any runs for this job will be displayed in the Scheduled Jobs section as well.
