require "rails_helper"

RSpec.describe "layouts/_navbar", type: :view do
  before { render }

  context "when the user is logged in" do
    let(:user) { create(:user) }

    before do
      sign_in user
      render
    end

    it "displays \"Log out\" button" do
      expect(rendered).to match(/Log out/)
    end
  end

  context "when the user is not logged in" do
    it "displays \"Log in\" button" do
      expect(rendered).to match(/Log in/)
    end
  end

  it "displays \"Recipes\" button" do
    expect(rendered).to match(/Recipes/)
  end
end
