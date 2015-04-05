class Metting
  require 'extract'
  include Extract

  attr_accessor :match_time,:time_array,:sum_time,:time_style,:sum_time

  def initialize(input = nil)
      @input ||= input.present? ? input : INPUT
      @match_time ||= @input.inject([]){|o,c| o<<[c.gsub("lightning","5")[/[0-9]\d*/].to_i , c] ; o}
      @time_array ||= @match_time.collect{|a| a[0] }
      @time_style ||= @time_array.uniq

      @time_style.each do |_|
      eval %Q(
        def time_in_#{_}
          @match_time.select{|a| a[0] == #{_} }.map{|b| [b[1]] }
        end
      )
      end
      
      @sum_time   ||= @time_array.sum
      @bingding_45 ||= bingding_45
      @one_hour_array ||= one_hour_array
  end


  def even_size_in_45
     time_in_45.size / 2
  end

  
  def even_in_45?
     time_in_45.size % 2 == 0
  end


  def leave_even_in_30?
     time_in_30[even_size_in_45..-1].size % 2 == 0
  end


  def leave_even_in_45?
    time_in_30.size < even_size_in_45
  end

  
  def bingding_45
   comm = []
   i = 0
   (leave_even_in_45? ? time_in_30.size : even_size_in_45).times do |t|
     j = t+i
     comm << (time_in_45[j..j+1] << time_in_30[t])
     i += 1
   end
   comm
  end


  def bingding_30
   comm = []
   time_in_30[bingding_45.size..-1].each_slice(2) do |t|
     comm << t if t.size == 2
   end
   comm
  end


  def one_hour_array
    bingding_30 + time_in_60
  end


  %w{am pm}.each do |_|
     define_method "#{_}_output" do
        flatten_metting(_)
     end
  end

  
  def flatten_metting(style)
    create_tracks
    @tracks.keys.each do |k|
      usefull_time = "Metting::#{style.upcase}_USEFULL_TIME".constantize
      start_time = "Metting::#{style.upcase}_START_TIME".constantize.to_minutes
      while usefull_time > 0
        if @bingding_45 != [] && usefull_time <= 2
          @tracks[k]<< @bingding_45[0]
          @bingding_45.kick_out
          usefull_time = usefull_time - 2
        elsif @one_hour_array !=[]
          @tracks[k]<< @one_hour_array[0]
          @one_hour_array.kick_out
          usefull_time = usefull_time - 1
        else
          @tracks[k]<< time_in_45.last unless even_in_45?
          @tracks[k]<< time_in_30.last unless leave_even_in_30?
          @tracks[k]<< time_in_5
          usefull_time = 0
        end
      end
      @tracks[k] = @tracks[k].flatten.map{|x| a = x.gsub("lightning","5")[/[0-9]\d*/].to_i ; value = ( start_time.clock_format + x ) ; start_time = start_time + a ; value }
      @tracks[k] << (style == "am" ? LUNCH : NETWORKING)
    end
    @tracks
  end
  
end
