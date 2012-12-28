require 'spec_helper'

describe "employees/index" do
  before(:each) do
    assign(:employees, [
      stub_model(Employee,
        :first_name => "First Name",
        :last_name => "Last Name",
        :identification => "Identification",
        :leader_name => "Leader Name"
      ),
      stub_model(Employee,
        :first_name => "First Name",
        :last_name => "Last Name",
        :identification => "Identification",
        :leader_name => "Leader Name"
      )
    ])
  end

  it "renders a list of employees" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "First Name".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Last Name".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Identification".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Leader Name".to_s, :count => 2
  end
end
