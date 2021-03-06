require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe DentalsController do

  # This should return the minimal set of attributes required to create a valid
  # Dental. As you add validations to Dental, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { { "dentist" => "MyString" } }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # DentalsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all dentals as @dentals" do
      dental = Dental.create! valid_attributes
      get :index, {}, valid_session
      assigns(:dentals).should eq([dental])
    end
  end

  describe "GET show" do
    it "assigns the requested dental as @dental" do
      dental = Dental.create! valid_attributes
      get :show, {:id => dental.to_param}, valid_session
      assigns(:dental).should eq(dental)
    end
  end

  describe "GET new" do
    it "assigns a new dental as @dental" do
      get :new, {}, valid_session
      assigns(:dental).should be_a_new(Dental)
    end
  end

  describe "GET edit" do
    it "assigns the requested dental as @dental" do
      dental = Dental.create! valid_attributes
      get :edit, {:id => dental.to_param}, valid_session
      assigns(:dental).should eq(dental)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Dental" do
        expect {
          post :create, {:dental => valid_attributes}, valid_session
        }.to change(Dental, :count).by(1)
      end

      it "assigns a newly created dental as @dental" do
        post :create, {:dental => valid_attributes}, valid_session
        assigns(:dental).should be_a(Dental)
        assigns(:dental).should be_persisted
      end

      it "redirects to the created dental" do
        post :create, {:dental => valid_attributes}, valid_session
        response.should redirect_to(Dental.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved dental as @dental" do
        # Trigger the behavior that occurs when invalid params are submitted
        Dental.any_instance.stub(:save).and_return(false)
        post :create, {:dental => { "dentist" => "invalid value" }}, valid_session
        assigns(:dental).should be_a_new(Dental)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Dental.any_instance.stub(:save).and_return(false)
        post :create, {:dental => { "dentist" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested dental" do
        dental = Dental.create! valid_attributes
        # Assuming there are no other dentals in the database, this
        # specifies that the Dental created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Dental.any_instance.should_receive(:update).with({ "dentist" => "MyString" })
        put :update, {:id => dental.to_param, :dental => { "dentist" => "MyString" }}, valid_session
      end

      it "assigns the requested dental as @dental" do
        dental = Dental.create! valid_attributes
        put :update, {:id => dental.to_param, :dental => valid_attributes}, valid_session
        assigns(:dental).should eq(dental)
      end

      it "redirects to the dental" do
        dental = Dental.create! valid_attributes
        put :update, {:id => dental.to_param, :dental => valid_attributes}, valid_session
        response.should redirect_to(dental)
      end
    end

    describe "with invalid params" do
      it "assigns the dental as @dental" do
        dental = Dental.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Dental.any_instance.stub(:save).and_return(false)
        put :update, {:id => dental.to_param, :dental => { "dentist" => "invalid value" }}, valid_session
        assigns(:dental).should eq(dental)
      end

      it "re-renders the 'edit' template" do
        dental = Dental.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Dental.any_instance.stub(:save).and_return(false)
        put :update, {:id => dental.to_param, :dental => { "dentist" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested dental" do
      dental = Dental.create! valid_attributes
      expect {
        delete :destroy, {:id => dental.to_param}, valid_session
      }.to change(Dental, :count).by(-1)
    end

    it "redirects to the dentals list" do
      dental = Dental.create! valid_attributes
      delete :destroy, {:id => dental.to_param}, valid_session
      response.should redirect_to(dentals_url)
    end
  end

end
