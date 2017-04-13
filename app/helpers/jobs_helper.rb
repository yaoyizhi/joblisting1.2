module JobsHelper
    def render_job_status(job)
        if job.is_hidden
            '(hidden)'
        else
            '(publish)'
        end
    end
end
