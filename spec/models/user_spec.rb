require 'rails_helper'

RSpec.describe User, type: :model do
  describe "Create user" do
    login_params = { 
      "Name field is nil" => {email: "manh@dd.com", password: "asdf", name: ""},
      "Wrong email format" => {email: "email", password: "asdf", name: "name"},
      "Blank password" => {email: "email", password: "", name: "name"}
    }
    login_params.each do |key, login_param|

      it key do       
        @user = User.new login_param
        expect(@user.save).to be false
      end
    end

  end

end
