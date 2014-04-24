# date_range_formatter

[![Build Status](https://travis-ci.org/darkleaf/date_range_formatter.svg?branch=master)](https://travis-ci.org/darkleaf/date_range_formatter)
[![Gem Version](https://badge.fury.io/rb/date_range_formatter.svg)](http://badge.fury.io/rb/date_range_formatter)
[![Build Status](https://drone.io/github.com/dronov/date_range_formatter/status.png)](https://drone.io/github.com/dronov/date_range_formatter/latest)

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
    default: # it's the 'format'
      separator: " - " # added ' - ' symbol to the date ranges
      month: "%B"
      year: "%Y"
      same_months: "%{from_day}-%{until_day} %{month} %{year}"
      same_years: "%{from_day} %{from_month} - %{until_day} %{until_month} %{year}"
```

After that you should call the module DateRangeFormatter with arguments wchich describes the range of dates and format to display. For example, we have date_beginning, date_ending and format by default:

```ruby
DateRangeFormatter.format('2013-01-14', '2013-01-15')
#=> '14 January - 15 February 2013'
```

If you want to show dates by another format, you can call it:

```ruby
date_beginning = Date.new(2013, 01, 14)
date_ending = Date.new(2014, 02, 15)
date_range_str = DateRangeFormatter.format(date_beginning, date_ending, 'short')
```

That's all. Enjoy yout profit!
