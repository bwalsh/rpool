
class RPool
  
  require "rinruby"
  
  # Print a logger warning if it requires more than 10 seconds to acquire a connection.
  # Close and reopen the connection if it hasn't been used for 1000 seconds.
  # Raise Timeout::Error if waiting for a connection more than 30 seconds.
  # idle_timeout - If set, the connection will be renewed if it hasn't been used in this amount of time (seconds).
  
  # Creates a gene_pool.  The passed block will be used to initialize a single instance of
  # the item being pooled (i.e., socket connection or whatever)
  # options -
  #   name         - The name used in logging messages.
  #   pool_size    - The maximum number of instances that will be created (Defaults to 1).
  #   timeout      - Will raise a Timeout exception if waiting on a connection for this many seconds.
  #   warn_timeout - Displays an error message if a checkout takes longer that the given time (used to give hints to increase the pool size).
  #   idle_timeout - If set, the connection will be renewed if it hasn't been used in this amount of time (seconds).
  #   logger       - The logger used for log messages, defaults to STDERR.
  #   close_proc   - The process or method used to close a pooled instance when it is removed.
  #     Defaults to :close.  Set to nil for no-op or a symbol for a method or a proc that takes an argument for the instance.  
  @@gene_pool = GenePool.new(:name         => 'MyClient',
     :pool_size    => 10,
     :timeout      => 30,
     :warn_timeout => 10,
     :logger       => Rails.logger,
     :close_proc   => :quit) do
    
    RinRuby.new()
    
  end
  
  # get an instance from pool
  def self.instance
    @@gene_pool
  end
  
  # remove an R from the pool (potentially because it was hung or no longer useful)
  def self.remove(r)
    @@gene_pool.remove(r)
  end
  
  
end