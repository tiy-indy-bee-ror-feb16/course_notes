require 'minitest/autorun'
require_relative 'data_parser'

class PlanetExpressTest < MiniTest::Test

  class DeliveryTest < PlanetExpressTest

    def setup
      @data = Parse.parse_data
      @delivery = @data.first
    end

    def test_create_from_row
      assert @delivery.destination == "Earth"
    end

    def test_delivery_has_destination
      assert @delivery.respond_to? :destination
    end

    def test_shipment
      assert @delivery.respond_to? :shipment
      assert @delivery.shipment == "Hamburgers"
    end

    def test_quantity
      assert @delivery.respond_to? :quantity
      assert @delivery.quantity == 150
    end

    def test_revenue
      assert @delivery.respond_to? :revenue
      assert @delivery.revenue == 30000
    end

    def test_fry_pilot
      assert @delivery.pilot == "Fry"
    end

    def test_amy_pilot
      @delivery.stub :destination, "Mars" do
        assert @delivery.pilot == "Amy"
      end
    end

    def test_bender_pilot
      @delivery.stub :destination, "Uranus" do
        assert @delivery.pilot == "Bender"
      end
    end

    def test_leela_pilot
      @delivery.stub :destination, "Fudge" do
        assert @delivery.pilot == "Leela"
      end
    end

    def test_parse_data
      assert Parse.parse_data.length == 10
      assert Parse.parse_data.all? {|row| row.is_a? Delivery}
    end

    def test_money_we_made
      Parse.parse_data
      assert Parse.money_we_made == 536895
    end

    def test_global_variables
      assert Parsely.show_me.nil?
    end

    def test_bonus_method
      @delivery.stub :revenue, 1000 do
        assert @delivery.bonus == 100
      end
    end

    def test_uneven_revenue_bonus
      @delivery.stub :revenue, 1005 do
        assert @delivery.bonus == 100.5, "The bonus was #{@delivery.bonus}"
      end
    end

    def test_deliveries_by_fry
      assert Parse.deliveries_by_pilot("Fry").length == 2
    end

    def test_bonus_for_pilot
      assert Parse.bonus_for_pilot("Fry") == 3500, "Bonus was #{Parse.bonus_for_pilot("Fry")}"
    end

    def test_available_pilots
      assert Parse.available_pilots.length == 4
      assert Parse.available_pilots.all? {|pilot| pilot.is_a? String }
    end

    def test_report_output
      assert Parse.report_rows.length == 5
      assert Parse.report_rows.all? {|row| row.is_a? Array}
    end

  end

end
