require 'rails_helper'
        #                       :type => :controller
RSpec.describe UsersController, type: :controller do 
    # t.string :first_name
    #   t.string :last_name
    #   t.string :handle
    #   t.string :email
    #   t.string :password_digest
  # before :all do
  #   @user = User.create(first_name:"Cam",last_name:"Crews",handle:"Camerican",email:"cam@nycda.com",password:"test")
  # end

  let(:good_attributes) {
    @good_attributes = {
      first_name:"Cam",last_name:"Crews",handle:"Camerican",email:"cam@nycda.com",password:"test" 
    } 
  }

  let(:valid_session) { {user_id: 1} }

  let(:bad_attributes) {
    @bad_attributes = {
      first_name:"Cam",last_name:"",handle:"",email:"c31",password:"" 
    } 
  }

  let(:user) {
    @user = User.find(1)
    @user ||= User.create(@good_attributes)
  }

 # let(:user) { User.find_by(id:1) }

 describe "verify user" do
  it "verify user.id" do
    expect(user.id).to be > 0
  end
 end


  describe "GET index" do
    it "returns valid status" do
      get :index
      expect(response).to be_success
    end
  end

  describe "GET show" do
    it "returns specified user" do
      get :show, :id => user.id 
      expect(response).to be_success
    end
  end

  describe "GET new" do 
    it "confirm new" do
      get :new
      expect(response).to be_success
    end
  end

  describe "GET edit" do
    it "edit a user" do
      get :edit, id: user.id
      expect(response).to be_success
    end
  end

  describe "DELETE destroy" do
    # it "delete user" do
    #   delete :destroy, id: user.id
    #   expect(response).to be_success
    # end

    it "delete redirect" do
      delete :destroy, id: user.id
      expect(response).to redirect_to users_path
    end
  end

  describe "create user" do
    it "create user on good_attributes" do
      @user = User.create!(good_attributes)
      expect(@user.first_name).to eq("Cam") 
      expect(@user.last_name).to eq("Crews") 
    end
  end

end