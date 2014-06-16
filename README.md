# Date Range Formatter

[![Build Status](https://travis-ci.org/darkleaf/date_range_formatter.svg?branch=master)](https://travis-ci.org/darkleaf/date_range_formatter)
[![Gem Version](https://badge.fury.io/rb/date_range_formatter.svg)](http://badge.fury.io/rb/date_range_formatter)
[![Code Climate](https://codeclimate.com/github/darkleaf/date_range_formatter.png)](https://codeclimate.com/github/darkleaf/date_range_formatter)
[![Build Status](https://drone.io/github.com/darkleaf/date_range_formatter/status.png)](https://drone.io/github.com/darkleaf/date_range_formatter/latest)

This gem makes working with dates more pretty. It works well with Ruby application and most frameworks like  [Ruby on Rails](https://github.com/rails/rails "Ruby on Rails").

## Installation
Very simple. Just add this code to Gemfile:

    gem 'date_range_formatter'

## Usage

Imagine the situation when you need to show dates of some stuff at your website. For example:

    1 - 9 May 2014
    2 January 2015
    15 July 2016 - 13 February 2017

To show this dates in this format you need to describe the format of displaying dates like 'default' in your locale file:

```yaml
en:
  date_range:
    default:
      month: "%B"
      year: "%Y"
      same_hours: "%{day} %{month} %{year}"
      same_days: "%{day} %{month} %{year}"
      same_months: "%{from_day}-%{until_day} %{month} %{year}"
      same_years: "%{from_day} %{from_month} - %{until_day} %{until_month} %{year}"
      different_components: "%{from_day} %{from_month} %{from_year} - %{until_day} %{until_month} %{until_year}"

    with_time:
      hour: "%I%P"
      month: "%B"
      year: "%Y"
      same_hours: "%{day} %{month} %{year}, %{hour}"
      same_days: "%{day} %{month} %{year}, %{from_hour} - %{until_hour}"
      same_months: "%{from_day}-%{until_day} %{month} %{year}"
      same_years: "%{from_day} %{from_month} - %{until_day} %{until_month} %{year}"
      different_components: "%{from_day} %{from_month} %{from_year} - %{until_day} %{until_month} %{until_year}"

```

After that you should call the module DateRangeFormatter with arguments wchich describes the range of dates and format to display. For example, we have date_beginning, date_ending and format by default:

```ruby
DateRangeFormatter.format('2013-01-14', '2013-02-15')
#=> '14 January - 15 February 2013'

DateRangeFormatter.format_range(['2013-02-20', '2013-01-14', '2013-01-15'])
#=> '14 January - 20 February 2013'
```

If you want to show dates by another format, you can call it:

```ruby
date_beginning = Date.new(2013, 01, 14)
date_ending = Date.new(2014, 02, 15)
date_range_str = DateRangeFormatter.format(date_beginning, date_ending, 'short')
```

If you want to show hours, you can call it:
```ruby
DateRangeFormatter.format('10:00 2013-01-14', '20:00 2013-01-14', :with_time)
#=> '14 January 2013, 10am - 08pm'
```

That's all. Enjoy yout profit!

## Other

This idea was appeared by looking at the [article](https://coderwall.com/p/fkg-ng). Thanks to [@mbillard](https://github.com/mbillard).


