#!/usr/bin/env ruby

require_relative 'data_parser'

Parse.parse_data(ARGV[0])

puts "Hi. Here's a our weekly report for Planet Express"
puts "We made #{Parse.money_we_made} dollars this week."
puts "Pilot trips & bonuses:"
Parse.available_pilots.each do |pilot|
  p "#{pilot} made #{Parse.deliveries_by_pilot(pilot).length} trips this week and earned a bonus of #{Parse.bonus_for_pilot(pilot)}."
end

if ARGV[1] == "report"
  CSV.open("weekly_report.csv", "wb") do |csv|
    Parse.report_rows.each do |row|
      csv << row
    end
  end
  p "We've saved a csv copy of the pilot report to weekly_report.csv"
end
