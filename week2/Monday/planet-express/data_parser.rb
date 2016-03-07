require 'csv'

class Delivery

  attr_accessor :destination, :shipment, :quantity, :revenue

  def initialize(row)
    self.destination = row["Destination"]
    self.shipment = row[" What got shipped"]
    self.quantity = row[" Number of crates"].to_i
    self.revenue = row[" Money we made"].to_i
  end

  def pilot
    case destination
    when "Earth" then "Fry"
    when "Mars" then "Amy"
    when "Uranus" then "Bender"
    else "Leela"
    end
  end

  def bonus
    revenue * 0.1
  end

end

class Parse


  def self.parse_data(filename="planet_express_logs.csv")
    filename ||= "planet_express_logs.csv"
    @deliveries = CSV.foreach(filename, headers: true).map{|row| Delivery.new(row) }
  end

  def self.money_we_made(deliveries=@deliveries)
    deliveries.inject(0){|sum, delivery| sum + delivery.revenue}
  end

  def self.deliveries_by_pilot(pilot)
    @deliveries.select{|delivery| delivery.pilot == pilot}
  end

  def self.bonus_for_pilot(pilot)
    deliveries_by_pilot(pilot).inject(0){|sum, delivery| sum + delivery.bonus }
  end

  def self.available_pilots
    @deliveries.map {|delivery| delivery.pilot }.uniq
  end

  def self.report_rows
    rows = [%w(Pilot Shipments TotalRevenue Payment)]
     rows + available_pilots.map do |pilot|
       [
         pilot,
         deliveries_by_pilot(pilot).length,
         money_we_made(deliveries_by_pilot(pilot)),
         bonus_for_pilot(pilot)
       ]
    end
  end

end

class Parsely < Parse

  def self.show_me
    @deliveries
  end

end
