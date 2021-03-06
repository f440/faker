require_relative 'test_helper'

class TestFrLocale < Test::Unit::TestCase
  def setup
    @previous_locale = Faker::Config.locale
    Faker::Config.locale = 'fr'
  end

  def teardown
    Faker::Config.locale = @previous_locale
  end

  def test_fr_gb_methods
    assert Faker::Address.building_number.is_a? String
    assert Faker::Address.street_prefix.is_a? String
    assert Faker::Address.secondary_address.is_a? String
    assert Faker::Address.postcode.is_a? String
    assert Faker::Address.state.is_a? String
    assert Faker::Address.city_name.is_a? String
    assert Faker::Address.city.is_a? String
    assert Faker::Address.street_suffix.is_a? String
    assert Faker::Address.street_name.is_a? String
    assert Faker::Address.street_address.is_a? String
    assert Faker::Address.default_country.is_a? String
    assert Faker::Company.suffix.is_a? String
    assert Faker::Company.buzzword.is_a? String
    assert Faker::Company.bs.is_a? String
    assert Faker::Company.name.is_a? String
    assert Faker::Internet.free_email.is_a? String
    assert Faker::Internet.domain_suffix.is_a? String
    assert Faker::Lorem.word.is_a? String
    assert Faker::Name.first_name.is_a? String
    assert Faker::Name.last_name.is_a? String
    assert Faker::Name.title.is_a? String
    assert Faker::Name.name.is_a? String
    assert Faker::PhoneNumber.phone_number.is_a? String
    assert Faker::PhoneNumber.cell_phone.is_a? String
    assert Faker::Book.title.is_a? String
    assert Faker::Book.author.is_a? String
    assert Faker::Book.publisher.is_a? String
    assert Faker::Book.quote.is_a? String
  end

  def test_fr_phone_format
    phone = Faker::PhoneNumber.phone_number.gsub(/\D/, '')
    assert_match(/^(0|33)([1-5]|[8-9])\d{8}$/, phone)
  end

  def test_fr_cell_phone_format
    mobile = Faker::PhoneNumber.cell_phone.gsub(/\D/, '')
    assert_match(/^(0|33)(6|7)\d{8}$/, mobile)
  end

  def test_fr_postcode
    assert_match(/^[\d]{5}$/, Faker::Address.postcode)
  end

  def test_fr_building_number
    assert_match(/^\d+$/, Faker::Address.building_number)
  end

  def test_fr_is_default_country
    assert_equal('France', Faker::Address.default_country)
  end
end
