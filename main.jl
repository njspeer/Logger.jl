#=  Example of how to use Julia's Logger

    send warnings to a buffer first
    then, check the buffer.
    if there is anything in the buffer

    Level	        Alias	                  Comment
    -1000001      Logging.BelowMinLevel	  (below) lowest possible level
    -1000	        Logging.Debug	          log level for @debug messages
      0           Logging.Info	          log level for @info messages
    1000	        Logging.Warn	          log level for @warn messages
    2000	        Logging.Error	          log level for @error messages
    1000001	      Logging.AboveMaxLevel	  (above) highest possible level

    # ############## From ############## =#
