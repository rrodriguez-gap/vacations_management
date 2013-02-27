require 'spec_helper'

describe "administrators/new" do
  before(:each) do
    assign(:administrator, stub_model(Administrator).as_new_record)
  end

  it "renders new administrator form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => administrators_path, :method => "post" do
    end
  end
end
