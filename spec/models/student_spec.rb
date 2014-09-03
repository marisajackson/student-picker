require 'rails_helper'

RSpec.describe Student, :type => :model do
  let!(:student_1) { Fabricate(:student, name: "Richmond Watins") }
  Fabricate(:student, name: "Jack Newton")
  let!(:student_3) { Fabricate(:student, name: "Chad Campbell") }
  Fabricate(:student, name: "Aaron Johnson", called_on: 1.hour.ago)

  it "returns the first valid choice" do
    allow_any_instance_of(Array).to receive(:sample) do |array|
      array[0]
    end
    expect(Student.pick_student).to eq(student_1)
  end

  it 'can return the last valid choice' do
    allow_any_instance_of(Array).to receive(:sample) do |array|
      array.last
    end
    expect(Student.pick_student).to eq(student_3)
  end

  it "should add timestamp to chosen student" do
    pending 'implementation'
    allow_any_instance_of(Array).to receive(:sample) do |array|
      array.last
    end
    expect(student_3.called_on).to be > Date.yesterday       
  end        
end
