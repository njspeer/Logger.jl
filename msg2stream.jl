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

iostream = IOBuffer()

# Create a simple logger
logger = SimpleLogger(iostream, Logging.Info)

# Set the global logger so that we can capture other warnings and messages
global_logger(logger)

# now we can use syntax like
@info "Random Info xXx"
@warn "Random Warning"
@debug "Randsom debug values $(sum(rand(100)))"

str = String(take!(iostream))

