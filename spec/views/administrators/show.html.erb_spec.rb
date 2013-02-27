require 'spec_helper'

describe "administrators/show" do
  before(:each) do
    @administrator = assign(:administrator, stub_model(Administrator))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
