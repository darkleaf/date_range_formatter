require 'active_support/i18n'

I18n.load_path << "#{File.dirname(__FILE__)}/locale/en.yml"

module DateRangeFormatter

  class << self
    def format(date_beginning, date_ending, format = :default)
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
      return I18n.l from_date, format: format if same_days?
      return I18n.t 'same_months', same_months_data.merge(scope: ['date_range', format]) if same_months?
      return I18n.t 'same_years', same_years_data.merge(scope: ['date_range', format]) if same_years?

      from_str = I18n.l from_date, format:  format
      until_str = I18n.l until_date, format: format
      separator = I18n.t "separator", scope: ["date_range", format]
      [from_str, separator, until_str].join
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
