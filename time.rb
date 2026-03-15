# The Time class represents dates and times. It provides methods for creating, manipulating, and formatting time objects. Time objects can be created using various constructors, such as Time.new, Time.now, and Time.utc.

# The to_i method converts a Time object to an integer representing the number of seconds since the Unix epoch (January 1, 1970). This is useful for performing calculations with time values or for storing time values in a compact format.

# Here are some examples of using the to_i method with Time objects:
Time.utc(1970, 1, 1, 0, 0, 0).to_i         # => 0
Time.utc(1970, 1, 1, 0, 0, 0, 999999).to_i # => 0
Time.utc(1950, 1, 1, 0, 0, 0).to_i         # => -631152000
Time.utc(1990, 1, 1, 0, 0, 0).to_i         # => 631152000
Time.utc(2000, 1, 1).to_a
# => [0,   0,   0,    1,   1,   2000, 6,    1,    false, "UTC"]
#    [sec, min, hour, day, mon, year, wday, yday, dst?,   zone]
t = Time.new(2000, 1, 2, 3, 4, 5, 6)
# => 2000-01-02 03:04:05 +000006
t.sec # => 5
t.min # => 4
Time.now
Time.now(in: '+04:00')
Time.now.utc  
