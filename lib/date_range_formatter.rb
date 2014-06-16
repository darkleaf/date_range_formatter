require 'active_support/core_ext/string/conversions.rb'
require 'active_support/i18n'

I18n.load_path << "#{File.dirname(__FILE__)}/locale/en.yml"

module DateRangeFormatter

  class << self
    def format(date_beginning, date_ending, format = :default)
      format_range [date_beginning, date_ending], format
    end

    def format_range(enumerable_range, format = :default)
      return if enumerable_range.none?
      sorted_range = enumerable_range.map(&:to_datetime).sort
      date_beginning = sorted_range.first
      date_ending = sorted_range.last

      f = Formatter.new date_beginning, date_ending, format
      f.to_s
    end
  end

  class Formatter
    attr_reader :from_date, :until_date, :format

    def initialize(from_date, until_date, format)
      @from_date = from_date
      @until_date = until_date
      @format = format.to_sym
    end

    def to_s
      return I18n.t 'same_hours', same_hours_data.merge(scope: ['date_range', format]) if same_hours?
      return I18n.t 'same_days', same_days_data.merge(scope: ['date_range', format]) if same_days?
      return I18n.t 'same_months', same_months_data.merge(scope: ['date_range', format]) if same_months?
      return I18n.t 'same_years', same_years_data.merge(scope: ['date_range', format]) if same_years?
      I18n.t 'different_components', different_components_data.merge(scope: ['date_range', format])
    end

    def same_hours?
      same_days? && from_date.hour == until_date.hour
    end

    def same_days?
      same_months? && from_date.day == until_date.day
    end

    def same_months?
      same_years? && from_date.month == until_date.month
    end

    def same_years?
      from_date.year == until_date.year
    end

    private
    def same_hours_data
      {
          hour: formatted_hour(from_date),
          day: from_date.day,
          month: formatted_month(from_date),
          year: formatted_year(from_date),
      }
    end

    def same_days_data
      {
          from_hour: formatted_hour(from_date),
          until_hour: formatted_hour(until_date),
          day: from_date.day,
          month: formatted_month(from_date),
          year: formatted_year(from_date),
      }
    end

    def same_months_data
      {
        from_day: from_date.day,
        until_day: until_date.day,
        month: formatted_month(from_date),
        year: formatted_year(from_date),
      }
    end

    def same_years_data
      {
        from_day: from_date.day,
        until_day: until_date.day,
        from_month: formatted_month(from_date),
        until_month: formatted_month(until_date),
        year: formatted_year(from_date),
      }
    end

    def different_components_data
      {
        from_day: from_date.day,
        until_day: until_date.day,
        from_month: formatted_month(from_date),
        until_month: formatted_month(until_date),
        from_year: formatted_year(from_date),
        until_year: formatted_year(until_date),
      }
    end

    def formatted_hour(date)
      format_str = I18n.t "hour", scope: ["date_range", format]
      I18n.l date, format: format_str
    end

    def formatted_month(date)
      format_str = I18n.t "month", scope: ["date_range", format]
      I18n.l date, format: format_str
    end

    def formatted_year(date)
      format_str = I18n.t "year", scope: ["date_range", format]
      I18n.l date, format: format_str
    end
  end
end
