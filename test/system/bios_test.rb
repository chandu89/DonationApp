require "application_system_test_case"

class BiosTest < ApplicationSystemTestCase
  setup do
    @bio = bios(:one)
  end

  test "visiting the index" do
    visit bios_url
    assert_selector "h1", text: "Bios"
  end

  test "creating a Bio" do
    visit bios_url
    click_on "New Bio"

    fill_in "Bio", with: @bio.Bio
    click_on "Create Bio"

    assert_text "Bio was successfully created"
    click_on "Back"
  end

  test "updating a Bio" do
    visit bios_url
    click_on "Edit", match: :first

    fill_in "Bio", with: @bio.Bio
    click_on "Update Bio"

    assert_text "Bio was successfully updated"
    click_on "Back"
  end

  test "destroying a Bio" do
    visit bios_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Bio was successfully destroyed"
  end
end
