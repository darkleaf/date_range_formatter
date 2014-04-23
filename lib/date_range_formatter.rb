class DateRangeFormatter
  attr_reader :from_date, :until_date

  def initialize(from_date, until_date)
    @from_date = from_date
    @until_date = until_date
  end

  def to_s(format = 'default')
    return I18n.l from_date, format: format if same_days?
    return I18n.t 'same_months', same_months_data(format).merge(scope: ['date_range', format]) if same_months?
    return I18n.t 'same_years', same_years_data(format).merge(scope: ['date_range', format]) if same_years?

    from_str = I18n.l from_date, format:  format
    until_str = I18n.l until_date, format: format
    separator = I18n.t("date_range.separator")
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
  def same_months_data(format)
    {
    from_day: from_date.day,
    until_day: until_date.day,
    month: formatted_month(from_date, format),
    year: formatted_year(from_date, format),
    }
  end

  def same_years_data(format)
    {
    from_day: from_date.day,
    until_day: until_date.day,
    from_month: formatted_month(from_date, format),
    until_month: formatted_month(until_date, format),
    year: formatted_year(from_date, format),
    }
  end

  def formatted_month(date, format)
    format_str = I18n.t "date_range.#{format}.month"
    I18n.l date, format: format_str
  end

  def formatted_year(date, format)
    format_str = I18n.t "date_range.#{format}.year"
    I18n.l date, format: format_str
  end
end
