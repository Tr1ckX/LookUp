class Roof

  include DataMapper::Resource
  
  property :id,                   Serial
  property :created_at,           String
  property :shade_value,          Integer
  property :material,             String
  property :roof_angle,           Integer
  property :orientation,          Integer
  property :photo_url,            Text
  property :latitude,             Float
  property :longitude,            Float
  property :title,                String
  property :discovered_by,        String
  property :user_email,           String
  property :gutter_edge,          Float
  property :angled_edge,          Float
  property :panel_capacity,       Integer
  property :power_capacity,       Integer

  FLAT_ROOF_PANEL_AREA = 2.56

  SLOPED_ROOF_PANEL_AREA = 1.6

  PANEL_POWER = 250

  def self.create_record
    # change method name
    create(created_at: "#{(Time.now).strftime('%H:%M | %d.%m.%Y')}")
  end

  def self.find(id)
    # change method name
    first(id: id)
  end

  def set_photo_url(url)
    update(photo_url: url)
  end

  def set_geolocation(latitude, longitude)
    update(latitude: latitude, longitude: longitude)
  end

  def set_material(material)
    update(material: material)
  end

  def set_flat_roof_data(angle, orientation)
    update(roof_angle: angle, orientation: set_azimuth(orientation))
  end

  def set_sloped_roof_orientation(orientation)
    update(orientation: set_azimuth(orientation))
  end

  def set_sloped_roof_angle(angle)
    update(roof_angle: angle)
  end

  def destroy_record
    destroy
  end

  def set_shade_value(shade_value)
    update(shade_value: shade_value)
  end

  def set_discovery_data(title, user)
    update(title: title, discovered_by: user)
  end

  def set_user_email(email)
    update(user_email: email)
  end

  def set_capacities
    set_panel_capacity
    set_power_capacity
  end

  private

  def set_panel_capacity
    return update(panel_capacity: flat_roof_panel_capacity) if roof_angle == 0
    update(panel_capacity: sloped_roof_panel_capacity)
  end

  def set_power_capacity
    update(power_capacity: panel_capacity * PANEL_POWER )
  end

  def angle_cos
    Math.cos(roof_angle * Math::PI / 180)
  end

  def sloped_roof_area
    (angled_edge / angle_cos).to_i * gutter_edge
  end

  def shade_percentage
    (100 - shade_value) / 100.0
  end

  def flat_roof_panel_capacity
    (gutter_edge * angled_edge / FLAT_ROOF_PANEL_AREA).to_i * shade_percentage
  end

  def sloped_roof_panel_capacity
    (sloped_roof_area / SLOPED_ROOF_PANEL_AREA) * shade_percentage
  end

end