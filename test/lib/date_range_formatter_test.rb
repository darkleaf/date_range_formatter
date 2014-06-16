require 'test_helper'

class DateRangeFormatterTest < TestHelper
  def setup
  end

  def test_same_days
    date_range_str = DateRangeFormatter.format('2013-01-14', '2013-01-14')

    assert_equal '14 January 2013', date_range_str
  end

  def test_same_months
    date_beginning = Date.new(2013, 01, 14)
    date_ending = Date.new(2013, 01, 15)
    date_range_str = DateRangeFormatter.format(date_beginning, date_ending)

    assert_equal '14-15 January 2013', date_range_str
  end

  def test_same_years
    date_beginning = Date.new(2013, 01, 14)
    date_ending = Date.new(2013, 02, 15)
    date_range_str = DateRangeFormatter.format(date_beginning, date_ending)

    assert_equal '14 January - 15 February 2013', date_range_str
  end

  def test_all_date_components_are_different
    date_beginning = Date.new(2013, 01, 14)
    date_ending = Date.new(2014, 02, 15)
    date_range_str = DateRangeFormatter.format(date_beginning, date_ending)

    assert_equal '14 January 2013 - 15 February 2014', date_range_str
  end

  def test_same_hours_with_time_format
    date_range_str = DateRangeFormatter.format('10:00 2013-01-14', '10:00 2013-01-14', :with_time)

    assert_equal '14 January 2013, 10am', date_range_str
  end

  def test_same_days_with_time_format
    date_range_str = DateRangeFormatter.format('10:00 2013-01-14', '20:00 2013-01-14', :with_time)

    assert_equal '14 January 2013, 10am - 08pm', date_range_str
  end
end

