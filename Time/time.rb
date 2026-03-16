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
Time.now.utc #=> 2024-06-01 12:34:56 UTC
Time.now.getlocal #=> 2024-06-01 08:34:56
t.monday? #=> false
t.tuesday? #=> false
t.wednesday? #=> false
zone = timezone("Europe/Athens")      # Eastern European Time, UTC+2
Time.new(2002, 10, 31, 2, 2, 2, zone) #=> 2002-10-31 02:02:02 +0200
Time.at(628232400) # You can also create a new time using Time.at which takes the number of seconds (with subsecond) since the Unix Epoch.
t.dst? #=> false dst : daylight saving time
t1 = Time.new(2010)
t2 = Time.new(2011)

t1 == t2 #=> false
t1 == t1 #=> true
t1 <  t2 #=> true
t1 >  t2 #=> false

Time.new(2010,10,31).between?(t1, t2) #=> true
Time.new('2000-12-31 23:59:59.56789', precision: 3) # => 2000-12-31 23:59:59.567 -0600 With one string argument that represents a time, returns a new Time object
Time.new(2000, 'jan') # also works with month names as strings, case-insensitive
Time.new(2000, 'JAN') #=> 2000-01-01 00:00:00 -0600
a = %w[0 1 1 0 0 0] # String integers representing year, month, day, hour, minute, second
# => ["0", "1", "1", "0", "0", "0"]
Time.new(*a) # => 0000-01-01 00:00:00 -0600

require 'time'

t = Time.now
t.httpdate # => "Thu, 06 Oct 2011 02:26:12 GMT"

Time.httpdate("Thu, 06 Oct 2011 02:26:12 GMT") # day-of-week, DD month-name CCYY hh:mm:ss GMT
#=> 2011-10-06 02:26:12 UTC
Time.parse("2010-10-31") #=> 2010-10-31 00:00:00 -0500
t = Time.new(2000, 12, 31, 23, 59, 59, 0.5)
t.inspect # => returns a string representation of the time object, including the date, time, and timezone information
t.ctime # => returns a string representation of the time object in the C time format, which is a standard format used in C programming for representing time values. The format is "Day Mon DD HH:MM:SS YYYY", where Day is the abbreviated name of the day of the week, Mon is the abbreviated name of the month, DD is the day of the month, HH is the hour (in 24-hour format), MM is the minute, SS is the second, and YYYY is the year.
t = Time.utc(2010, 3, 30, 5, 43, 25.123456789r)
t          # => 2010-03-30 05:43:25.123456789 UTC
t.round    # => 2010-03-30 05:43:25 UTC
t.round(0) # => 2010-03-30 05:43:25 UTC
t.round(1) # => 2010-03-30 05:43:25.1 UTC
t.round(2) # => 2010-03-30 05:43:25.12 UTC
t.round(3) # => 2010-03-30 05:43:25.123 UTC
t.round(4) # => 2010-03-30 05:43:25.1235 UTC
require 'json/add/time'
puts Time.now.to_json #  Returns a JSON string representing self:
t.hash # => Returns a hash code for this time object. Two time objects with the same date and time will have the same hash code, while different time objects will have different hash codes. This method is used internally by Ruby when storing time objects in hash-based data structures, such as Hash or Set.
t.equal?(t) # => true
t.equal?(Time.now) # => false
Time.new(2000, 1, 1).yday   # => 1
Time.new(2000, 12, 31).yday # => 366
Time.new(2000, 1, 1).wday   # => 6 (Saturday)
Time.new(2000, 1, 2).mday   # => 2
t = Time.utc(2022, 10, 5, 21, 25, 30)

if t in wday: 3, day: ..7  # uses deconstruct_keys underneath
  puts "first Wednesday of the month"
end
#=> prints "first Wednesday of the month"

case t
in year: ...2022
  puts "too old"
in month: ..9
  puts "quarter 1-3"
in wday: 1..5, month:
  puts "working day in month #{month}"
end
#=> prints "working day in month 10"

