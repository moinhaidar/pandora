require 'spec_helper'

describe "students/index.html.erb" do
  before(:each) do
    assign(:students, [
      stub_model(Student),
      stub_model(Student)
    ])
  end

  it "renders a list of students" do
    render
  end
end
