require "date"
require 'action_view/helpers/tag_helper'

module ActionView
  module Helpers
    # The Date Helper primarily creates select/option tags for different kinds of dates and date elements. All of the
    # select-type methods share a number of common options that are as follows:
    #
    # * <tt>:prefix</tt> - overwrites the default prefix of "date" used for the select names. So specifying "birthday"
    # would give birthday[month] instead of date[month] if passed to the select_month method.
    # * <tt>:include_blank</tt> - set to true if it should be possible to set an empty date.
    # * <tt>:discard_type</tt> - set to true if you want to discard the type part of the select name. If set to true,
    #   the select_month method would use simply "date" (which can be overwritten using <tt>:prefix</tt>) instead of
    #   "date[month]".
    module DateHelper
      include ActionView::Helpers::TagHelper
      DEFAULT_PREFIX = 'date' unless const_defined?('DEFAULT_PREFIX')

      # Reports the approximate distance in time between two Time or Date objects or integers as seconds.
      # Set <tt>include_seconds</tt> to true if you want more detailed approximations when distance < 1 min, 29 secs
      # Distances are reported based on the following table:
      #
      #   0 <-> 29 secs                                                             # => less than a minute
      #   30 secs <-> 1 min, 29 secs                                                # => 1 minute
      #   1 min, 30 secs <-> 44 mins, 29 secs                                       # => [2..44] minutes
      #   44 mins, 30 secs <-> 89 mins, 29 secs                                     # => about 1 hour
      #   89 mins, 29 secs <-> 23 hrs, 59 mins, 29 secs                             # => about [2..24] hours
      #   23 hrs, 59 mins, 29 secs <-> 47 hrs, 59 mins, 29 secs                     # => 1 day
      #   47 hrs, 59 mins, 29 secs <-> 29 days, 23 hrs, 59 mins, 29 secs            # => [2..29] days
      #   29 days, 23 hrs, 59 mins, 30 secs <-> 59 days, 23 hrs, 59 mins, 29 secs   # => about 1 month
      #   59 days, 23 hrs, 59 mins, 30 secs <-> 1 yr minus 1 sec                    # => [2..12] months
      #   1 yr <-> 2 yrs minus 1 secs                                               # => about 1 year
      #   2 yrs <-> max time or date                                                # => over [2..X] years
      #
      # With <tt>include_seconds</tt> = true and the difference < 1 minute 29 seconds:
      #   0-4   secs      # => less than 5 seconds
      #   5-9   secs      # => less than 10 seconds
      #   10-19 secs      # => less than 20 seconds
      #   20-39 secs      # => half a minute
      #   40-59 secs      # => less than a minute
      #   60-89 secs      # => 1 minute
      #
      # ==== Examples
      #   from_time = Time.now
      #   distance_of_time_in_words(from_time, from_time + 50.minutes)        # => about 1 hour
      #   distance_of_time_in_words(from_time, 50.minutes.from_now)           # => about 1 hour
      #   distance_of_time_in_words(from_time, from_time + 15.seconds)        # => less than a minute
      #   distance_of_time_in_words(from_time, from_time + 15.seconds, true)  # => less than 20 seconds
      #   distance_of_time_in_words(from_time, 3.years.from_now)              # => over 3 years
      #   distance_of_time_in_words(from_time, from_time + 60.hours)          # => about 3 days
      #   distance_of_time_in_words(from_time, from_time + 45.seconds, true)  # => less than a minute
      #   distance_of_time_in_words(from_time, from_time - 45.seconds, true)  # => less than a minute
      #   distance_of_time_in_words(from_time, 76.seconds.from_now)           # => 1 minute
      #   distance_of_time_in_words(from_time, from_time + 1.year + 3.days)   # => about 1 year
      #   distance_of_time_in_words(from_time, from_time + 4.years + 15.days + 30.minutes + 5.seconds) # => over 4 years
      #
      #   to_time = Time.now + 6.years + 19.days
      #   distance_of_time_in_words(from_time, to_time, true)     # => over 6 years
      #   distance_of_time_in_words(to_time, from_time, true)     # => over 6 years
      #   distance_of_time_in_words(Time.now, Time.now)           # => less than a minute
      #
      def distance_of_time_in_words(from_time, to_time = 0, include_seconds = false, options = {})
        from_time = from_time.to_time if from_time.respond_to?(:to_time)
        to_time = to_time.to_time if to_time.respond_to?(:to_time)
        distance_in_minutes = (((to_time - from_time).abs)/60).round
        distance_in_seconds = ((to_time - from_time).abs).round

        I18n.with_options :locale => options[:locale], :scope => :'datetime.distance_in_words' do |locale|
          case distance_in_minutes
            when 0..1
              return distance_in_minutes == 0 ?
                     locale.t(:less_than_x_minutes, :count => 1) :
                     locale.t(:x_minutes, :count => distance_in_minutes) unless include_seconds

              case distance_in_seconds
                when 0..4   then locale.t :less_than_x_seconds, :count => 5
                when 5..9   then locale.t :less_than_x_seconds, :count => 10
                when 10..19 then locale.t :less_than_x_seconds, :count => 20
                when 20..39 then locale.t :half_a_minute
                when 40..59 then locale.t :less_than_x_minutes, :count => 1
                else             locale.t :x_minutes,           :count => 1
              end

            when 2..44           then locale.t :x_minutes,      :count => distance_in_minutes
            when 45..89          then locale.t :about_x_hours,  :count => 1
            when 90..1439        then locale.t :about_x_hours,  :count => (distance_in_minutes.to_f / 60.0).round
            when 1440..2879      then locale.t :x_days,         :count => 1
            when 2880..43199     then locale.t :x_days,         :count => (distance_in_minutes / 1440).round
            when 43200..86399    then locale.t :about_x_months, :count => 1
            when 86400..525599   then locale.t :x_months,       :count => (distance_in_minutes / 43200).round
            when 525600..1051199 then locale.t :about_x_years,  :count => 1
            else                      locale.t :over_x_years,   :count => (distance_in_minutes / 525600).round
          end
        end
      end

      # Like distance_of_time_in_words, but where <tt>to_time</tt> is fixed to <tt>Time.now</tt>.
      #
      # ==== Examples
      #   time_ago_in_words(3.minutes.from_now)       # => 3 minutes
      #   time_ago_in_words(Time.now - 15.hours)      # => 15 hours
      #   time_ago_in_words(Time.now)                 # => less than a minute
      #
      #   from_time = Time.now - 3.days - 14.minutes - 25.seconds     # => 3 days
      def time_ago_in_words(from_time, include_seconds = false)
        distance_of_time_in_words(from_time, Time.now, include_seconds)
      end

      alias_method :distance_of_time_in_words_to_now, :time_ago_in_words

      # Returns a set of select tags (one for year, month, and day) pre-selected for accessing a specified date-based
      # attribute (identified by +method+) on an object assigned to the template (identified by +object+). It's
      # possible to tailor the selects through the +options+ hash, which accepts all the keys that each of the
      # individual select builders do (like <tt>:use_month_numbers</tt> for select_month) as well as a range of discard
      # options. The discard options are <tt>:discard_year</tt>, <tt>:discard_month</tt> and <tt>:discard_day</tt>. Set
      # to true, they'll drop the respective select. Discarding the month select will also automatically discard the
      # day select. It's also possible to explicitly set the order of the tags using the <tt>:order</tt> option with an
      # array of symbols <tt>:year</tt>, <tt>:month</tt> and <tt>:day</tt> in the desired order. Symbols may be omitted
      # and the respective select is not included.
      #
      # Pass the <tt>:default</tt> option to set the default date. Use a Time object or a Hash of <tt>:year</tt>,
      # <tt>:month</tt>, <tt>:day</tt>, <tt>:hour</tt>, <tt>:minute</tt>, and <tt>:second</tt>.
      #
      # Passing <tt>:disabled => true</tt> as part of the +options+ will make elements inaccessible for change.
      #
      # If anything is passed in the +html_options+ hash it will be applied to every select tag in the set.
      #
      # NOTE: Discarded selects will default to 1. So if no month select is available, January will be assumed.
      #
      # ==== Examples
      #   # Generates a date select that when POSTed is stored in the post variable, in the written_on attribute
      #   date_select("post", "written_on")
      #
      #   # Generates a date select that when POSTed is stored in the post variable, in the written_on attribute,
      #   # with the year in the year drop down box starting at 1995.
      #   date_select("post", "written_on", :start_year => 1995)
      #
      #   # Generates a date select that when POSTed is stored in the post variable, in the written_on attribute,
      #   # with the year in the year drop down box starting at 1995, numbers used for months instead of words,
      #   # and without a day select box.
      #   date_select("post", "written_on", :start_year => 1995, :use_month_numbers => true,
      #                                     :discard_day => true, :include_blank => true)
      #
      #   # Generates a date select that when POSTed is stored in the post variable, in the written_on attribute
      #   # with the fields ordered as day, month, year rather than month, day, year.
      #   date_select("post", "written_on", :order => [:day, :month, :year])
      #
      #   # Generates a date select that when POSTed is stored in the user variable, in the birthday attribute
      #   # lacking a year field.
      #   date_select("user", "birthday", :order => [:month, :day])
      #
      #   # Generates a date select that when POSTed is stored in the user variable, in the birthday attribute
      #   # which is initially set to the date 3 days from the current date
      #   date_select("post", "written_on", :default => 3.days.from_now)
      #
      #   # Generates a date select that when POSTed is stored in the credit_card variable, in the bill_due attribute
      #   # that will have a default day of 20.
      #   date_select("credit_card", "bill_due", :default => { :day => 20 })
      #
      # The selects are prepared for multi-parameter assignment to an Active Record object.
      #
      # Note: If the day is not included as an option but the month is, the day will be set to the 1st to ensure that
      # all month choices are valid.
      def date_select(object_name, method, options = {}, html_options = {})
        InstanceTag.new(object_name, method, self, options.delete(:object)).to_date_select_tag(options, html_options)
      end

      # Returns a set of select tags (one for hour, minute and optionally second) pre-selected for accessing a specified
      # time-based attribute (identified by +method+) on an object assigned to the template (identified by +object+).
      # You can include the seconds with <tt>:include_seconds</tt>.
      #
      # This method will also generate 3 input hidden tags, for the actual year, month and day unless the option
      # <tt>:ignore_date</tt> is set to +true+.
      #
      # If anything is passed in the html_options hash it will be applied to every select tag in the set.
      #
      # ==== Examples
      #   # Creates a time select tag that, when POSTed, will be stored in the post variable in the sunrise attribute
      #   time_select("post", "sunrise")
      #
      #   # Creates a time select tag that, when POSTed, will be stored in the order variable in the submitted attribute
      #   time_select("order", "submitted")
      #
      #   # Creates a time select tag that, when POSTed, will be stored in the mail variable in the sent_at attribute
      #   time_select("mail", "sent_at")
      #
      #   # Creates a time select tag with a seconds field that, when POSTed, will be stored in the post variables in
      #   # the sunrise attribute.
      #   time_select("post", "start_time", :include_seconds => true)
      #
      #   # Creates a time select tag with a seconds field that, when POSTed, will be stored in the entry variables in
      #   # the submission_time attribute.
      #   time_select("entry", "submission_time", :include_seconds => true)
      #
      #   # You can set the :minute_step to 15 which will give you: 00, 15, 30 and 45.
      #   time_select 'game', 'game_time', {:minute_step => 15}
      #
      # The selects are prepared for multi-parameter assignment to an Active Record object.
      #
      # Note: If the day is not included as an option but the month is, the day will be set to the 1st to ensure that
      # all month choices are valid.
      def time_select(object_name, method, options = {}, html_options = {})
        InstanceTag.new(object_name, method, self, options.delete(:object)).to_time_select_tag(options, html_options)
      end

      # Returns a set of select tags (one for year, month, day, hour, and minute) pre-selected for accessing a
      # specified datetime-based attribute (identified by +method+) on an object assigned to the template (identified
      # by +object+). Examples:
      #
      # If anything is passed in the html_options hash it will be applied to every select tag in the set.
      #
      # ==== Examples
      #   # Generates a datetime select that, when POSTed, will be stored in the post variable in the written_on attribute
      #   datetime_select("post", "written_on")
      #
      #   # Generates a datetime select with a year select that starts at 1995 that, when POSTed, will be stored in the
      #   # post variable in the written_on attribute.
      #   datetime_select("post", "written_on", :start_year => 1995)
      #
      #   # Generates a datetime select with a default value of 3 days from the current time that, when POSTed, will
      #   # be stored in the trip variable in the departing attribute.
      #   datetime_select("trip", "departing", :default => 3.days.from_now)
      #
      #   # Generates a datetime select that discards the type that, when POSTed, will be stored in the post variable
      #   # as the written_on attribute.
      #   datetime_select("post", "written_on", :discard_type => true)
      #
      # The selects are prepared for multi-parameter assignment to an Active Record object.
      def datetime_select(object_name, method, options = {}, html_options = {})
        InstanceTag.new(object_name, method, self, options.delete(:object)).to_datetime_select_tag(options, html_options)
      end

      # Returns a set of html select-tags (one for year, month, day, hour, and minute) pre-selected with the +datetime+.
      # It's also possible to explicitly set the order of the tags using the <tt>:order</tt> option with an array of
      # symbols <tt>:year</tt>, <tt>:month</tt> and <tt>:day</tt> in the desired order. If you do not supply a Symbol,
      # it will be appended onto the <tt>:order</tt> passed in. You can also add <tt>:date_separator</tt>,
      # <tt>:datetime_separator</tt> and <tt>:time_separator</tt> keys to the +options+ to control visual display of
      # the elements.
      #
      # If anything is passed in the html_options hash it will be applied to every select tag in the set.
      #
      # ==== Examples
      #   my_date_time = Time.now + 4.days
      #
      #   # Generates a datetime select that defaults to the datetime in my_date_time (four days after today)
      #   select_datetime(my_date_time)
      #
      #   # Generates a datetime select that defaults to today (no specified datetime)
      #   select_datetime()
      #
      #   # Generates a datetime select that defaults to the datetime in my_date_time (four days after today)
      #   # with the fields ordered year, month, day rather than month, day, year.
      #   select_datetime(my_date_time, :order => [:year, :month, :day])
      #
      #   # Generates a datetime select that defaults to the datetime in my_date_time (four days after today)
      #   # with a '/' between each date field.
      #   select_datetime(my_date_time, :date_separator => '/')
      #
      #   # Generates a datetime select that defaults to the datetime in my_date_time (four days after today)
      #   # with a date fields separated by '/', time fields separated by '' and the date and time fields
      #   # separated by a comma (',').
      #   select_datetime(my_date_time, :date_separator => '/', :time_separator => '', :datetime_separator => ',')
      #
      #   # Generates a datetime select that discards the type of the field and defaults to the datetime in
      #   # my_date_time (four days after today)
      #   select_datetime(my_date_time, :discard_type => true)
      #
      #   # Generates a datetime select that defaults to the datetime in my_date_time (four days after today)
      #   # prefixed with 'payday' rather than 'date'
      #   select_datetime(my_date_time, :prefix => 'payday')
      #
      def select_datetime(datetime = Time.current, options = {}, html_options = {})
        separator = options[:datetime_separator] || ''
        select_date(datetime, options, html_options) + separator + select_time(datetime, options, html_options)
      end

      # Returns a set of html select-tags (one for year, month, and day) pre-selected with the +date+.
      # It's possible to explicitly set the order of the tags using the <tt>:order</tt> option with an array of
      # symbols <tt>:year</tt>, <tt>:month</tt> and <tt>:day</tt> in the desired order. If you do not supply a Symbol, it
      # will be appended onto the <tt>:order</tt> passed in.
      #
      # If anything is passed in the html_options hash it will be applied to every select tag in the set.
      #
      # ==== Examples
      #   my_date = Time.today + 6.days
      #
      #   # Generates a date select that defaults to the date in my_date (six days after today)
      #   select_date(my_date)
      #
      #   # Generates a date select that defaults to today (no specified date)
      #   select_date()
      #
      #   # Generates a date select that defaults to the date in my_date (six days after today)
      #   # with the fields ordered year, month, day rather than month, day, year.
      #   select_date(my_date, :order => [:year, :month, :day])
      #
      #   # Generates a date select that discards the type of the field and defaults to the date in
      #   # my_date (six days after today)
      #   select_date(my_date, :discard_type => true)
      #
      #   # Generates a date select that defaults to the date in my_date,
      #   # which has fields separated by '/'
      #   select_date(my_date, :date_separator => '/')
      #
      #   # Generates a date select that defaults to the datetime in my_date (six days after today)
      #   # prefixed with 'payday' rather than 'date'
      #   select_date(my_date, :prefix => 'payday')
      #
      def select_date(date = Date.current, options = {}, html_options = {})
        options.reverse_merge!(:order => [], :date_separator => '')
        [:year, :month, :day].each { |o| options[:order].push(o) unless options[:order].include?(o) }

        options[:order].inject([]) { |s, o|
          s << self.send("select_#{o}", date, options, html_options)
        }.join(options[:date_separator])
      end

      # Returns a set of html select-tags (one for hour and minute)
      # You can set <tt>:time_separator</tt> key to format the output, and
      # the <tt>:include_seconds</tt> option to include an input for seconds.
      #
      # If anything is passed in the html_options hash it will be applied to every select tag in the set.
      #
      # ==== Examples
      #   my_time = Time.now + 5.days + 7.hours + 3.minutes + 14.seconds
      #
      #   # Generates a time select that defaults to the time in my_time
      #   select_time(my_time)
      #
      #   # Generates a time select that defaults to the current time (no specified time)
      #   select_time()
      #
      #   # Generates a time select that defaults to the time in my_time,
      #   # which has fields separated by ':'
      #   select_time(my_time, :time_separator => ':')
      #
      #   # Generates a time select that defaults to the time in my_time,
      #   # that also includes an input for seconds
      #   select_time(my_time, :include_seconds => true)
      #
      #   # Generates a time select that defaults to the time in my_time, that has fields
      #   # separated by ':' and includes an input for seconds
      #   select_time(my_time, :time_separator => ':', :include_seconds => true)
      #
      def select_time(datetime = Time.current, options = {}, html_options = {})
        separator = options[:time_separator] || ''
        select_hour(datetime, options, html_options) + separator + select_minute(datetime, options, html_options) +
          (options[:include_seconds] ? separator + select_second(datetime, options, html_options) : '')
      end

      # Returns a select tag with options for each of the seconds 0 through 59 with the current second selected.
      # The <tt>second</tt> can also be substituted for a second number.
      # Override the field name using the <tt>:field_name</tt> option, 'second' by default.
      #
      # ==== Examples
      #   my_time = Time.now + 16.minutes
      #
      #   # Generates a select field for seconds that defaults to the seconds for the time in my_time
      #   select_second(my_time)
      #
      #   # Generates a select field for seconds that defaults to the number given
      #   select_second(33)
      #
      #   # Generates a select field for seconds that defaults to the seconds for the time in my_time
      #   # that is named 'interval' rather than 'second'
      #   select_second(my_time, :field_name => 'interval')
      #
      def select_second(datetime, options = {}, html_options = {})
        val = datetime ? (datetime.kind_of?(Fixnum) ? datetime : datetime.sec) : ''
        options[:use_hidden] ?
          (options[:include_seconds] ? _date_hidden_html(options[:field_name] || 'second', val, options) : '') :
          _date_select_html(options[:field_name] || 'second', _date_build_options(val), options, html_options)
      end

      # Returns a select tag with options for each of the minutes 0 through 59 with the current minute selected.
      # Also can return a select tag with options by <tt>minute_step</tt> from 0 through 59 with the 00 minute selected
      # The <tt>minute</tt> can also be substituted for a minute number.
      # Override the field name using the <tt>:field_name</tt> option, 'minute' by default.
      #
      # ==== Examples
      #   my_time = Time.now + 6.hours
      #
      #   # Generates a select field for minutes that defaults to the minutes for the time in my_time
      #   select_minute(my_time)
      #
      #   # Generates a select field for minutes that defaults to the number given
      #   select_minute(14)
      #
      #   # Generates a select field for minutes that defaults to the minutes for the time in my_time
      #   # that is named 'stride' rather than 'second'
      #   select_minute(my_time, :field_name => 'stride')
      #
      def select_minute(datetime, options = {}, html_options = {})
        val = datetime ? (datetime.kind_of?(Fixnum) ? datetime : datetime.min) : ''
        options[:use_hidden] ?
          _date_hidden_html(options[:field_name] || 'minute', val, options) :
          _date_select_html(options[:field_name] || 'minute',
            _date_build_options(val, :step => options[:minute_step]), options, html_options)
      end

      # Returns a select tag with options for each of the hours 0 through 23 with the current hour selected.
      # The <tt>hour</tt> can also be substituted for a hour number.
      # Override the field name using the <tt>:field_name</tt> option, 'hour' by default.
      #
      # ==== Examples
      #   my_time = Time.now + 6.hours
      #
      #   # Generates a select field for minutes that defaults to the minutes for the time in my_time
      #   select_minute(my_time)
      #
      #   # Generates a select field for minutes that defaults to the number given
      #   select_minute(14)
      #
      #   # Generates a select field for minutes that defaults to the minutes for the time in my_time
      #   # that is named 'stride' rather than 'second'
      #   select_minute(my_time, :field_name => 'stride')
      #
      def select_hour(datetime, options = {}, html_options = {})
        val = datetime ? (datetime.kind_of?(Fixnum) ? datetime : datetime.hour) : ''
        options[:use_hidden] ? _date_hidden_html(options[:field_name] || 'hour', val, options) :
          _date_select_html(options[:field_name] || 'hour', _date_build_options(val, :end => 23), options, html_options)
      end

      # Returns a select tag with options for each of the days 1 through 31 with the current day selected.
      # The <tt>date</tt> can also be substituted for a hour number.
      # Override the field name using the <tt>:field_name</tt> option, 'day' by default.
      #
      # ==== Examples
      #   my_date = Time.today + 2.days
      #
      #   # Generates a select field for days that defaults to the day for the date in my_date
      #   select_day(my_time)
      #
      #   # Generates a select field for days that defaults to the number given
      #   select_day(5)
      #
      #   # Generates a select field for days that defaults to the day for the date in my_date
      #   # that is named 'due' rather than 'day'
      #   select_day(my_time, :field_name => 'due')
      #
      def select_day(date, options = {}, html_options = {})
        val = date ? (date.kind_of?(Fixnum) ? date : date.day) : ''
        options[:use_hidden] ? _date_hidden_html(options[:field_name] || 'day', val, options) :
          _date_select_html(options[:field_name] || 'day',
            _date_build_options(val, :start => 1, :end => 31, :leading_zeros => false),
            options, html_options)
      end

      # Returns a select tag with options for each of the months January through December with the current month
      # selected. The month names are presented as keys (what's shown to the user) and the month numbers (1-12) are
      # used as values (what's submitted to the server). It's also possible to use month numbers for the presentation
      # instead of names -- set the <tt>:use_month_numbers</tt> key in +options+ to true for this to happen. If you
      # want both numbers and names, set the <tt>:add_month_numbers</tt> key in +options+ to true. If you would prefer
      # to show month names as abbreviations, set the <tt>:use_short_month</tt> key in +options+ to true. If you want
      # to use your own month names, set the <tt>:use_month_names</tt> key in +options+ to an array of 12 month names.
      # Override the field name using the <tt>:field_name</tt> option, 'month' by default.
      #
      # ==== Examples
      #   # Generates a select field for months that defaults to the current month that
      #   # will use keys like "January", "March".
      #   select_month(Date.today)
      #
      #   # Generates a select field for months that defaults to the current month that
      #   # is named "start" rather than "month"
      #   select_month(Date.today, :field_name => 'start')
      #
      #   # Generates a select field for months that defaults to the current month that
      #   # will use keys like "1", "3".
      #   select_month(Date.today, :use_month_numbers => true)
      #
      #   # Generates a select field for months that defaults to the current month that
      #   # will use keys like "1 - January", "3 - March".
      #   select_month(Date.today, :add_month_numbers => true)
      #
      #   # Generates a select field for months that defaults to the current month that
      #   # will use keys like "Jan", "Mar".
      #   select_month(Date.today, :use_short_month => true)
      #
      #   # Generates a select field for months that defaults to the current month that
      #   # will use keys like "Januar", "Marts."
      #   select_month(Date.today, :use_month_names => %w(Januar Februar Marts ...))
      #
      def select_month(date, options = {}, html_options = {})
        locale = options[:locale]

        val = date ? (date.kind_of?(Fixnum) ? date : date.month) : ''
        if options[:use_hidden]
          _date_hidden_html(options[:field_name] || 'month', val, options)
        else
          month_options = []
          month_names = options[:use_month_names] || begin
            key = options[:use_short_month] ? :'date.abbr_month_names' : :'date.month_names'
            I18n.translate key, :locale => locale
          end
          month_names.unshift(nil) if month_names.size < 13

          1.upto(12) do |month_number|
            month_name = if options[:use_month_numbers]
              month_number
            elsif options[:add_month_numbers]
              month_number.to_s + ' - ' + month_names[month_number]
            else
              month_names[month_number]
            end

            month_options << ((val == month_number) ?
              content_tag(:option, month_name, :value => month_number, :selected => "selected") :
              content_tag(:option, month_name, :value => month_number)
            )
            month_options << "\n"
          end
          _date_select_html(options[:field_name] || 'month', month_options.join, options, html_options)
        end
      end

      # Returns a select tag with options for each of the five years on each side of the current, which is selected.
      # The five year radius can be changed using the <tt>:start_year</tt> and <tt>:end_year</tt> keys in the
      # +options+. Both ascending and descending year lists are supported by making <tt>:start_year</tt> less than or
      # greater than <tt>:end_year</tt>. The <tt>date</tt> can also be substituted for a year given as a number.
      # Override the field name using the <tt>:field_name</tt> option, 'year' by default.
      #
      # ==== Examples
      #   # Generates a select field for years that defaults to the current year that
      #   # has ascending year values
      #   select_year(Date.today, :start_year => 1992, :end_year => 2007)
      #
      #   # Generates a select field for years that defaults to the current year that
      #   # is named 'birth' rather than 'year'
      #   select_year(Date.today, :field_name => 'birth')
      #
      #   # Generates a select field for years that defaults to the current year that
      #   # has descending year values
      #   select_year(Date.today, :start_year => 2005, :end_year => 1900)
      #
      #   # Generates a select field for years that defaults to the year 2006 that
      #   # has ascending year values
      #   select_year(2006, :start_year => 2000, :end_year => 2010)
      #
      def select_year(date, options = {}, html_options = {})
        if !date || date == 0
          val = ''
          middle_year = Date.today.year
        elsif date.kind_of?(Fixnum)
          val = middle_year = date
        else
          val = middle_year = date.year
        end

        if options[:use_hidden]
          _date_hidden_html(options[:field_name] || 'year', val, options)
        else
          options[:start_year] ||= middle_year - 5
          options[:end_year]   ||= middle_year + 5
          step                   = options[:start_year] < options[:end_year] ? 1 : -1

          _date_select_html(options[:field_name] || 'year',
            _date_build_options(val,
              :start => options[:start_year],
              :end => options[:end_year],
              :step => step,
              :leading_zeros => false
            ), options, html_options)
        end
      end

      private
        def _date_build_options(selected, options={})
          options.reverse_merge!(:start => 0, :end => 59, :step => 1, :leading_zeros => true)

          select_options = []
          (options[:start] || 0).step((options[:end] || 59), options[:step] || 1) do |i|
            value = options[:leading_zeros] ? sprintf("%02d", i) : i
            tag_options = { :value => value }
            tag_options[:selected] = "selected" if selected == i

            select_options << content_tag(:option, value, tag_options)
          end
          select_options.join("\n") + "\n"
        end

        def _date_select_html(type, html_options, options, select_tag_options = {})
          _date_name_and_id_from_options(options, type)
          select_options = {:id => options[:id], :name => options[:name]}
          select_options.merge!(:disabled => 'disabled') if options[:disabled]
          select_options.merge!(select_tag_options) unless select_tag_options.empty?
          select_html = "\n"
          select_html << content_tag(:option, '', :value => '') + "\n" if options[:include_blank]
          select_html << html_options.to_s
          content_tag(:select, select_html, select_options) + "\n"
        end

        def _date_hidden_html(type, value, options)
          _date_name_and_id_from_options(options, type)
          hidden_html = tag(:input, :type => "hidden", :id => options[:id], :name => options[:name], :value => value) + "\n"
        end

        def _date_name_and_id_from_options(options, type)
          options[:name] = (options[:prefix] || DEFAULT_PREFIX) + (options[:discard_type] ? '' : "[#{type}]")
          options[:id] = options[:name].gsub(/([\[\(])|(\]\[)/, '_').gsub(/[\]\)]/, '')
        end
    end

    class InstanceTag #:nodoc:
      include DateHelper

      def to_date_select_tag(options = {}, html_options = {})
        date_or_time_select(options.merge(:discard_hour => true), html_options)
      end

      def to_time_select_tag(options = {}, html_options = {})
        date_or_time_select(options.merge(:discard_year => true, :discard_month => true), html_options)
      end

      def to_datetime_select_tag(options = {}, html_options = {})
        date_or_time_select(options, html_options)
      end

      private
        def date_or_time_select(options, html_options = {})
          locale = options[:locale]

          defaults = { :discard_type => true }
          options  = defaults.merge(options)
          datetime = value(object)
          datetime ||= default_time_from_options(options[:default]) unless options[:include_blank]

          position = { :year => 1, :month => 2, :day => 3, :hour => 4, :minute => 5, :second => 6 }

          order = options[:order] ||= I18n.translate(:'date.order', :locale => locale)

          # Discard explicit and implicit by not being included in the :order
          discard = {}
          discard[:year]   = true if options[:discard_year] or !order.include?(:year)
          discard[:month]  = true if options[:discard_month] or !order.include?(:month)
          discard[:day]    = true if options[:discard_day] or discard[:month] or !order.include?(:day)
          discard[:hour]   = true if options[:discard_hour]
          discard[:minute] = true if options[:discard_minute] or discard[:hour]
          discard[:second] = true unless options[:include_seconds] && !discard[:minute]

          # If the day is hidden and the month is visible, the day should be set to the 1st so all month choices are valid
          # (otherwise it could be 31 and february wouldn't be a valid date)
          if datetime && discard[:day] && !discard[:month]
            datetime = datetime.change(:day => 1)
          end

          # Maintain valid dates by including hidden fields for discarded elements
          [:day, :month, :year].each { |o| order.unshift(o) unless order.include?(o) }

          # Ensure proper ordering of :hour, :minute and :second
          [:hour, :minute, :second].each { |o| order.delete(o); order.push(o) }

          date_or_time_select = ''
          order.reverse.each do |param|
            # Send hidden fields for discarded elements once output has started
            # This ensures AR can reconstruct valid dates using ParseDate
            next if discard[param] && (date_or_time_select.empty? || options[:ignore_date])

            date_or_time_select.insert(0,
              self.send("select_#{param}",
                datetime,
                options_with_prefix(position[param], options.merge(:use_hidden => discard[param])),
                html_options))
            date_or_time_select.insert(0,
              case param
                when :hour then (discard[:year] && discard[:day] ? "" : " &mdash; ")
                when :minute then " : "
                when :second then options[:include_seconds] ? " : " : ""
                else ""
              end)
          end

          date_or_time_select
        end

        def options_with_prefix(position, options)
          prefix = "#{@object_name}"
          if options[:index]
            prefix << "[#{options[:index]}]"
          elsif @auto_index
            prefix << "[#{@auto_index}]"
          end
          options.merge(:prefix => "#{prefix}[#{@method_name}(#{position}i)]")
        end

        def default_time_from_options(default)
          case default
            when nil
              Time.current
            when Date, Time
              default
            else
              # Rename :minute and :second to :min and :sec
              default[:min] ||= default[:minute]
              default[:sec] ||= default[:second]

              time = Time.current

              [:year, :month, :day, :hour, :min, :sec].each do |key|
                default[key] ||= time.send(key)
              end

              Time.utc_time(default[:year], default[:month], default[:day], default[:hour], default[:min], default[:sec])
            end
        end
    end

    class FormBuilder
      def date_select(method, options = {}, html_options = {})
        @template.date_select(@object_name, method, options.merge(:object => @object), html_options)
      end

      def time_select(method, options = {}, html_options = {})
        @template.time_select(@object_name, method, options.merge(:object => @object), html_options)
      end

      def datetime_select(method, options = {}, html_options = {})
        @template.datetime_select(@object_name, method, options.merge(:object => @object), html_options)
      end
    end
  end
end
