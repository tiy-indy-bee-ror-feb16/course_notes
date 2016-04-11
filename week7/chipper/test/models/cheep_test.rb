require 'test_helper'

class CheepTest < ActiveSupport::TestCase

  def test_carrot_detection
    test_string = "This ^cheep is ^filled with ^carrots and such"
    cheep = Cheep.new(body: test_string)
    assert cheep.detect_carrots == %w(^cheep ^filled ^carrots), cheep.detect_carrots
  end

end
