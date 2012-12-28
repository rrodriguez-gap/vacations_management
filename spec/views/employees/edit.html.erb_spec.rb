require 'spec_helper'

describe "employees/edit" do
  before(:each) do
    @employee = assign(:employee, stub_model(Employee,
      :first_name => "MyString",
      :last_name => "MyString",
      :identification => "MyString",
      :leader_name => "MyString"
    ))
  end

  it "renders the edit employee form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => employees_path(@employee), :method => "post" do
      assert_select "input#employee_first_name", :name => "employee[first_name]"
      assert_select "input#employee_last_name", :name => "employee[last_name]"
      assert_select "input#employee_identification", :name => "employee[identification]"
      assert_select "input#employee_leader_name", :name => "employee[leader_name]"
    end
  end
end
