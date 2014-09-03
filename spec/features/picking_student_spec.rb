describe "picking a student" do

  subject { page }

  before do
    visit root_path
    click_button "Pick Student"
  end

  describe "with no students" do
    it { should have_content("There are currently no students.") }
  end

  describe "with students" do
    let!(:student_1) { Fabricate(:student, name: "Richmond Watins") }
    Fabricate(:student, name: "Jack Newton")
    let!(:student_3) { Fabricate(:student, name: "Chad Campbell") }
    Fabricate(:student, name: "Aaron Johnson", called_on: 1.hour.ago)
    it "should display the chosen one" do
      allow_any_instance_of(Array).to receive(:sample) do |array|
        array.last
      end
    end
    # it { should have_content("Chad Campbell") }
  end
end