require 'spec_helper'

describe "holidays/edit.html.erb" do
  before(:each) do
    @holiday = assign(:holiday, stub_model(Holiday,
      :name => "MyString",
      :type => "",
      :weekend => false
    ))
  end

  it "renders the edit holiday form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => holidays_path(@holiday), :method => "post" do
      assert_select "input#holiday_name", :name => "holiday[name]"
      assert_select "input#holiday_type", :name => "holiday[type]"
      assert_select "input#holiday_weekend", :name => "holiday[weekend]"
    end
  end
end
