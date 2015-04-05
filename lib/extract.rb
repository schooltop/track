 module Extract

   INPUT = ["Writing Fast Tests Against Enterprise Rails 60min",
          "Overdoing it in Python 45min",
          "Lua for the Masses 30min",
          "Ruby Errors from Mismatched Gem Versions 45min",
          "Common Ruby Errors 45min",
          "Rails for Python Developers lightning",
          "Communicating Over Distance 60min",
          "Accounting-Driven Development 45min",
          "Woah 30min",
          "Sit Down and Write 30min",
          "Pair Programming vs Noise 45min",
          "Rails Magic 60min",
          "Ruby on Rails: Why We Should Move On 60min",
          "Clojure Ate Scala (on my project) 45min",
          "Programming in the Boondocks of Seattle 30min",
          "Ruby vs. Clojure for Back-End Development 30min",
          "Ruby on Rails Legacy App Maintenance 60min",
          "A World Without HackerNews 30min",
          "User Interface CSS in Rails Apps 30min"
          ]

    LUNCH = "12:00PM Lunch"
    NETWORKING = "05:00PM Networking Event"

    AM_START_TIME = 9
    LUNCH_TIME = 12
    PM_START_TIME = 13
    NETWORKING_TIME = 17

    AM_USEFULL_TIME = LUNCH_TIME - AM_START_TIME
    PM_USEFULL_TIME = NETWORKING_TIME - PM_START_TIME

    ONEDAY_USEFULL_TIME = AM_USEFULL_TIME + PM_USEFULL_TIME
    

    def track_branchs
      #需要创建几个track？
      @sum_time / ONEDAY_USEFULL_TIME.to_minutes
      @sum_time / ONEDAY_USEFULL_TIME.to_minutes + 1 if (@sum_time % ONEDAY_USEFULL_TIME.to_minutes) != 0
    end
    

    def create_tracks
      @tracks = {}
      track_branchs.times do |i|
       @tracks["track#{i+1}"] = []
      end
      @tracks
    end
  
 end