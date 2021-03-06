require "rails_helper"

RSpec.describe "view supervisor edit", type: :feature do
  context "when the current user is a supervisor" do
    it "does not a submit button" do
      current_supervisor = create(:user, :supervisor)
      other_supervisor = create(:user, :supervisor)

      sign_in current_supervisor
      visit edit_supervisor_path(other_supervisor)

      expect(page).not_to have_selector(:link_or_button, "Submit")
    end

    context "when the current user is editing self" do
      it "displays a submit button" do
        current_supervisor = create(:user, :supervisor)

        sign_in current_supervisor
        visit edit_supervisor_path(current_supervisor)

        expect(page).to have_selector(:link_or_button, "Submit")
      end
    end
  end

  context "when the current user is an admin" do
    it "displays a submit button" do
      admin = create(:user, :casa_admin)
      supervisor = create(:user, :supervisor)

      sign_in admin
      visit edit_supervisor_path(supervisor)

      expect(page).to have_selector(:link_or_button, "Submit")
    end
  end
end
