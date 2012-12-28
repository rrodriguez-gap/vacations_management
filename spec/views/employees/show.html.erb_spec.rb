require 'spec_helper'

describe "employees/show" do
  before(:each) do
    @employee = assign(:employee, stub_model(Employee,
      :first_name => "First Name",
      :last_name => "Last Name",
      :identification => "Identification",
      :leader_name => "Leader Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/First Name/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Last Name/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Identification/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Leader Name/)
  end
end
