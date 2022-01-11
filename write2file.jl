#= 
  Example of how to use Julia's Logger

  Level	        Alias	                  Comment
  -1000001      Logging.BelowMinLevel	  (below) lowest possible level
  -1000	        Logging.Debug	          log level for @debug messages
    0           Logging.Info	          log level for @info messages
  1000	        Logging.Warn	          log level for @warn messages
  2000	        Logging.Error	          log level for @error messages
  1000001	      Logging.AboveMaxLevel	  (above) highest possible level
=#

# Load the logging module
using Logging

# file name that we will write to
logfile = "logfile.txt"

# Open file for writing
iostream = open(logfile, "w")

# Create a simple logger
logger = SimpleLogger(iostream, Logging.Info)

# Set the global logger so that we can capture other warnings and messages
global_logger(logger)

# now we can use syntax like
@info "Random Info xXx"
@warn "Random Warning"
@debug "Randsom debug values $(sum(rand(100)))"

A = ones(Int, 4, 4)
v = ones(100)
@info "Some more ransome variables"  A  s=sum(v)

# Log a specific message
with_logger(logger) do
    @info("Some random info xXxXxXx")
end


# create a function
function test(x)
  @info "x = $x"
end

# and log all messages
with_logger(logger) do
  test(1)
  test([1,2])
end

# define arbitrary logging messages
@logmsg Logging.LogLevel(123)  "Log message with log level 123."
@logmsg Logging.LogLevel(1234) "Log message with log level 1234."
@logmsg Logging.LogLevel(2345) "Log message with log level 2345."

# flush the buffer to write all un-written messages to file
flush(iostream)

# close the 
close(iostream)





