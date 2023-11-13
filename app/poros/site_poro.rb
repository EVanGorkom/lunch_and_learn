class SitePoro
  attr_reader :id, :name, :address, :place_id

  def initialize(data)
    @name = data["properties"]["name"]
    @id = nil
    @address = format_address(data)
    @place_id = data["properties"]["place_id"]
  end

  private

  def format_address(data)
    full_address = ""
    full_address << data["properties"]["address_line1"]
    full_address << ", "
    full_address << data["properties"]["address_line2"]
  end
end