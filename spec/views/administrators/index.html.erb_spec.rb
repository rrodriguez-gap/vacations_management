require 'spec_helper'

describe "administrators/index" do
  before(:each) do
    assign(:administrators, [
      stub_model(Administrator),
      stub_model(Administrator)
    ])
  end

  it "renders a list of administrators" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
