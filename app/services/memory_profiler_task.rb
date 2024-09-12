class MemoryProfilerTask
  def initialize(action_name)
    @action_name = action_name
    @report = nil
  end

  def start
    MemoryProfiler.start
  end

  def stop_and_log
    @report = MemoryProfiler.stop
    total_allocated = @report.total_allocated
    total_allocated_memsize = @report.total_allocated_memsize
    total_retained = @report.total_retained
    total_retained_memsize = @report.total_retained_memsize

    Rails.logger.info "Memory Profiling Report for #{@action_name}:"
    Rails.logger.info "Total Allocated: #{total_allocated}"
    Rails.logger.info "Total Allocated Memory Size: #{total_allocated_memsize}"
    Rails.logger.info "Total Retained: #{total_retained}"
    Rails.logger.info "Total Retained Memory Size: #{total_retained_memsize}"
  end
end
