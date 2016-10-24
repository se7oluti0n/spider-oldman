# spec/routes/authentication_spec.rb
require 'rails_helper'

RSpec.describe "authentication", :type => :routing do
  it "routes /signup to user#new" do
    expect(:get => "/signup").to route_to(
      :controller => "users",
      :action => "new"
    )
  end 

  it "routes post /signup to user#create" do
    expect(:post => "/signup").to route_to(
      :controller => "users",
      :action => "create"
    )
  end

  it "routes /signin to sessions#new" do
    expect(:get => "/signin").to route_to("sessions#new")
  end
end
