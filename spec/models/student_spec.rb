require 'spec_helper'

describe Student do
  
  before(:all) do
   @student = Factory(:student)
   @attr = @student.attributes
  end 
  
  it "should create a student instance" do
    student = Student.new(@attr.except('id'))
    student.should be_valid
    student.should be_an_instance_of(Student)
  end
  
  it "should return fullname" do
    @student.should respond_to(:name)
    @student.name.should == 'Moin Haidar'
  end

  it "should be active student" do
    @student.active?.should == 'Yes'
  end
  
  it "should have an address" do
    @student.address.should == 'Hitech City, Hyderabad'
  end
  
end
