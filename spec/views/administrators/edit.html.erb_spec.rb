require 'spec_helper'

describe "administrators/edit" do
  before(:each) do
    @administrator = assign(:administrator, stub_model(Administrator))
  end

  it "renders the edit administrator form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => administrators_path(@administrator), :method => "post" do
    end
  end
end
