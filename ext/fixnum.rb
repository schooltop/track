
 class Fixnum
   
    def to_minutes
      self*60
    end

    def clock_format
      time_for_hour = self / 60
      time_for_minute = self % 60
      "%02d" % time_for_hour + ":" +"%02d" % time_for_minute + ((0 <= self ) && ( self <= 12*60) ? "AM " : "PM ")
    end

 end