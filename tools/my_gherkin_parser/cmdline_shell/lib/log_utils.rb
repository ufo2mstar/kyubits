require 'logging'

# Logger params
Logging.init :debug, :info, :warn, :error, :fatal

# Custom colour set
Logging.color_scheme('my_bright',
                     :levels  => {
                         :debug => :blue,
                         :info  => :green,
                         :warn  => :yellow,
                         :error => :red,
                         :fatal => [:black, :on_red]
                     },
                     :date    => :blue,
                     :logger  => :cyan,
                     :message => :white
)

# File appender
Logging.appenders.file('file.log',
                       level:   :debug, # or your custom lowest level init-ed
                       layout:  Logging.layouts.pattern(
                           pattern:      "[%d] %-5l %c: %m\n",
                           # color_scheme: 'my_bright', # best not to use color_schemes on file loggers
                           date_pattern: "%Y-%m-%d %H:%M:%S"),
                       # truncate: true, # if you want to clear old log information
                       # age:      5 * 60, # feel free to play around with these
                       roll_by: :date # for rolling logs if you want to change files periodically
)

# Stdout appender
Logging.appenders.stdout('stdout',
                         level:  :info, # a different log level to your file appender
                         layout: Logging.layouts.pattern(
                             pattern:      "[%d] %-5l %c: %m\n",
                             color_scheme: 'my_bright', # best not to use color_schemes on file loggers
                             date_pattern: "%Y-%m-%d %H:%M:%S"))

# sample logger setup module
module LoggerSetup
  attr_reader :log

  def self.init_logger(level = nil)
    @log       = Logging.logger[self]
    @log.level = level || :debug # your lowest level
    @log.add_appenders(
        'stdout',
        'file.log'
    )
    @log
  end
end
