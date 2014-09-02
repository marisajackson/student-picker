describe "adding a student" do

  subject { page }

  before { visit root_path }

  describe "with invalid information" do
    before { click_button "Add Student"}

    it { should have_content("Student could not be added.") }
  end

  describe "with valid information" do
    before do
      fill_in "Name", with: "MaRisa Jackson"
      click_button "Add Student"
    end

    it { should have_content("MaRisa Jackson has been added to the students.") }
    
    it "should add the student to the list" do
      within("#students") do
        expect(page).to have_content("MaRisa Jackson")
      end
    end
  end
end