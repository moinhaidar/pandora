require 'spec_helper'

describe StudentsController do

  before(:all) do
    @student = Factory(:student)
    @attr = @student.attributes.except('id')
  end 

  describe "GET index" do
    it "assigns all students as @students" do
      student = Student.create!(@attr)
      get :index
      assigns(:students).should eq([student])
    end
  end

  describe "GET show" do
    it "assigns the requested student as @student" do
      student = Student.create!(@arrt)
      get :show, :id => student.id
      assigns(:student).should eq(student)
    end
  end

  describe "GET new" do
    it "assigns a new student as @student" do
      get :new
      assigns(:student).should be_a_new(Student)
    end
  end

  describe "GET edit" do
    it "assigns the requested student as @student" do
      student = Student.create!(@attr)
      get :edit, :id => student.id
      assigns(:student).should eq(student)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Student" do
        expect {
          post :create, :student => @attr
        }.to change(Student, :count).by(1)
      end

      it "assigns a newly created student as @student" do
        post :create, :student => @attr
        assigns(:student).should be_a(Student)
        assigns(:student).should be_persisted
      end

      it "redirects to the created student" do
        post :create, :student => @attr
        response.should redirect_to(Student.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved student as @student" do
        # Trigger the behavior that occurs when invalid params are submitted
        Student.any_instance.stub(:save).and_return(false)
        post :create, :student => {}
        assigns(:student).should be_a_new(Student)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Student.any_instance.stub(:save).and_return(false)
        post :create, :student => {}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested student" do
        student = Student.create! @attr
        # Assuming there are no other students in the database, this
        # specifies that the Student created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Student.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => student.id, :student => {'these' => 'params'}
      end

      it "assigns the requested student as @student" do
        student = Student.create! @attr
        put :update, :id => student.id, :student => @attr
        assigns(:student).should eq(student)
      end

      it "redirects to the student" do
        student = Student.create! @attr
        put :update, :id => student.id, :student => @attr
        response.should redirect_to(student)
      end
    end

    describe "with invalid params" do
      it "assigns the student as @student" do
        student = Student.create! @attr
        # Trigger the behavior that occurs when invalid params are submitted
        Student.any_instance.stub(:save).and_return(false)
        put :update, :id => student.id, :student => {}
        assigns(:student).should eq(student)
      end

      it "re-renders the 'edit' template" do
        student = Student.create! @attr
        # Trigger the behavior that occurs when invalid params are submitted
        Student.any_instance.stub(:save).and_return(false)
        put :update, :id => student.id, :student => {}
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested student" do
      student = Student.create! @attr
      expect {
        delete :destroy, :id => student.id
      }.to change(Student, :count).by(-1)
    end

    it "redirects to the students list" do
      student = Student.create! @attr
      delete :destroy, :id => student.id
      response.should redirect_to(students_url)
    end
  end

end
