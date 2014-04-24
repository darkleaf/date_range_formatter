require 'test_helper'

class DateRangeFormatterTest < TestHelper
  def setup
  end

  def test_same_days
    date_range_str = DateRangeFormatter.format('2013-01-14', '2013-01-14')

    assert_equal '2013-01-14', date_range_str
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

    assert_equal '2013-01-14 - 2014-02-15', date_range_str
  end
end

