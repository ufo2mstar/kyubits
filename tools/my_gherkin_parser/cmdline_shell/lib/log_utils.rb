# $LOAD_PATH << File.expand_path("#{File.dirname(__FILE__)}")
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

TIMESTAMP_PATTERN = "%Y-%m-%d %H:%M:%S.%L"
LOG_TIME_TODAY = Time.now.strftime("%Y-%m-%d")
LOG_TIME_NOW = Time.now.strftime("%Y-%m-%d_%H-%M-%S")
LOG_FILE = "log_#{LOG_TIME_TODAY}.log"

# File appender
Logging.appenders.file(LOG_FILE,
                       level:   :debug, # or your custom lowest level init-ed
                       layout:  Logging.layouts.pattern(
                           pattern:      "[%d] %-5l %c: %m\n",
                           # color_scheme: 'my_bright', # best not to use color_schemes on file loggers
                           date_pattern: TIMESTAMP_PATTERN),
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
                             date_pattern: TIMESTAMP_PATTERN))

# sample logger setup module
module LoggerSetup
  attr_reader :log

  def init_logger(level = nil)
    @log       = Logging.logger[self]
    @log.level = level || :debug # your lowest level
    @log.add_appenders(
        'stdout',
        LOG_FILE
    )
    @log
  end
end
