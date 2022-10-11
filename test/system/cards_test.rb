require "application_system_test_case"

class CardsTest < ApplicationSystemTestCase
  setup do
    @card = cards(:one)
  end

  test "visiting the index" do
    visit cards_url
    assert_selector "h1", text: "Cards"
  end

  test "should create card" do
    visit cards_url
    click_on "New card"

    fill_in "Add date", with: @card.add_date
    fill_in "Author", with: @card.author
    fill_in "Categorie", with: @card.categorie
    fill_in "Color", with: @card.color
    fill_in "Description", with: @card.description
    check "Foil" if @card.foil
    fill_in "Image uri", with: @card.image_uri
    fill_in "Lang", with: @card.lang
    fill_in "Note", with: @card.note
    fill_in "Price", with: @card.price
    fill_in "Title", with: @card.title
    fill_in "Year", with: @card.year
    click_on "Create Card"

    assert_text "Card was successfully created"
    click_on "Back"
  end

  test "should update Card" do
    visit card_url(@card)
    click_on "Edit this card", match: :first

    fill_in "Add date", with: @card.add_date
    fill_in "Author", with: @card.author
    fill_in "Categorie", with: @card.categorie
    fill_in "Color", with: @card.color
    fill_in "Description", with: @card.description
    check "Foil" if @card.foil
    fill_in "Image uri", with: @card.image_uri
    fill_in "Lang", with: @card.lang
    fill_in "Note", with: @card.note
    fill_in "Price", with: @card.price
    fill_in "Title", with: @card.title
    fill_in "Year", with: @card.year
    click_on "Update Card"

    assert_text "Card was successfully updated"
    click_on "Back"
  end

  test "should destroy Card" do
    visit card_url(@card)
    click_on "Destroy this card", match: :first

    assert_text "Card was successfully destroyed"
  end
end
