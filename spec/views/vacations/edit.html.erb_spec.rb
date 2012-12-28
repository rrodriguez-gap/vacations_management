require 'spec_helper'

describe "vacations/edit" do
  before(:each) do
    @vacation = assign(:vacation, stub_model(Vacation,
      :description => "MyString",
      :days => 1,
      :details => "MyText"
    ))
  end

  it "renders the edit vacation form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => vacations_path(@vacation), :method => "post" do
      assert_select "input#vacation_description", :name => "vacation[description]"
      assert_select "input#vacation_days", :name => "vacation[days]"
      assert_select "textarea#vacation_details", :name => "vacation[details]"
    end
  end
end
