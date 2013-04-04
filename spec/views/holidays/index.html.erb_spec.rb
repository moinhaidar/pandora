require 'spec_helper'

describe "holidays/index.html.erb" do
  before(:each) do
    assign(:holidays, [
      stub_model(Holiday,
        :name => "Name",
        :type => "Type",
        :weekend => false
      ),
      stub_model(Holiday,
        :name => "Name",
        :type => "Type",
        :weekend => false
      )
    ])
  end

  it "renders a list of holidays" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Type".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
