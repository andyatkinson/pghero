module PgHero
  module Methods
    module ScheduledJobs
      def scheduled_jobs
        return [] unless pg_cron_extension_enabled?
        select_all <<-SQL
          SELECT * from cron.job
        SQL
      end

      def job_run_details
        return [] unless pg_cron_extension_enabled?
        select_all <<-SQL
          SELECT * from cron.job_run_details
        SQL
      end

      def enable_scheduled_jobs
        execute("CREATE EXTENSION IF NOT EXISTS pg_cron")
        true
      end

      def pg_cron_extension_available?
        select_one("SELECT COUNT(*) AS count FROM pg_available_extensions WHERE name = 'pg_cron'") > 0
      end

      def pg_cron_extension_enabled?
        select_one("SELECT COUNT(*) AS count FROM pg_extension WHERE extname = 'pg_cron'") > 0
      end

      def pg_cron_readable?
        select_all("SELECT * FROM cron.job LIMIT 1")
        true
      rescue ActiveRecord::StatementInvalid
        false
      end

    end
  end
end
