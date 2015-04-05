class Track 

  require 'extract'
  include Extract

   def initialize(metting)
      @am_output  ||=  metting.am_output
      @pm_output  ||=  metting.pm_output
      @sum_time ||= metting.sum_time
   end

   def output_match
     create_tracks
     @tracks.keys.each do |key|
       @tracks[key] = @am_output[key] + @pm_output[key]
     end
     @tracks
   end

   def output
     output_match.each do |key,valus|
        puts key
      valus.each do |vs|
        puts vs
      end
     end
   end

end