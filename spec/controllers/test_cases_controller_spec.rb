require 'spec_helper'

describe TestCasesController do

  def mock_test_case(stubs={})
    @mock_test_case ||= mock_model(TestCase, stubs).as_null_object
  end

  describe "GET index" do
    it "assigns all test_cases as @test_cases" do
      TestCase.stub(:all) { [mock_test_case] }
      get :index
      assigns(:test_cases).should eq([mock_test_case])
    end
  end

  describe "GET show" do
    it "assigns the requested test_case as @test_case" do
      TestCase.stub(:find).with("37") { mock_test_case }
      get :show, :id => "37"
      assigns(:test_case).should be(mock_test_case)
    end
  end

  describe "GET new" do
    it "assigns a new test_case as @test_case" do
      TestCase.stub(:new) { mock_test_case }
      get :new
      assigns(:test_case).should be(mock_test_case)
    end
  end

  describe "GET edit" do
    it "assigns the requested test_case as @test_case" do
      TestCase.stub(:find).with("37") { mock_test_case }
      get :edit, :id => "37"
      assigns(:test_case).should be(mock_test_case)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created test_case as @test_case" do
        TestCase.stub(:new).with({'these' => 'params'}) { mock_test_case(:save => true) }
        post :create, :test_case => {'these' => 'params'}
        assigns(:test_case).should be(mock_test_case)
      end

      it "redirects to the created test_case" do
        TestCase.stub(:new) { mock_test_case(:save => true) }
        post :create, :test_case => {}
        response.should redirect_to(test_case_url(mock_test_case))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved test_case as @test_case" do
        TestCase.stub(:new).with({'these' => 'params'}) { mock_test_case(:save => false) }
        post :create, :test_case => {'these' => 'params'}
        assigns(:test_case).should be(mock_test_case)
      end

      it "re-renders the 'new' template" do
        TestCase.stub(:new) { mock_test_case(:save => false) }
        post :create, :test_case => {}
        response.should render_template("new")
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested test_case" do
        TestCase.should_receive(:find).with("37") { mock_test_case }
        mock_test_case.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :test_case => {'these' => 'params'}
      end

      it "assigns the requested test_case as @test_case" do
        TestCase.stub(:find) { mock_test_case(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:test_case).should be(mock_test_case)
      end

      it "redirects to the test_case" do
        TestCase.stub(:find) { mock_test_case(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(test_case_url(mock_test_case))
      end
    end

    describe "with invalid params" do
      it "assigns the test_case as @test_case" do
        TestCase.stub(:find) { mock_test_case(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:test_case).should be(mock_test_case)
      end

      it "re-renders the 'edit' template" do
        TestCase.stub(:find) { mock_test_case(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested test_case" do
      TestCase.should_receive(:find).with("37") { mock_test_case }
      mock_test_case.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the test_cases list" do
      TestCase.stub(:find) { mock_test_case }
      delete :destroy, :id => "1"
      response.should redirect_to(test_cases_url)
    end
  end

end
