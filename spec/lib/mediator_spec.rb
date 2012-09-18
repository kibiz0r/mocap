require 'spec_helper'

class MyMediator < Mocap::Mediator
  captivated_by :my_presenter, :my_controller

  captures :my_event do
    @my_presenter.got_my_event
  end
end

describe Mocap::Mediator do
  let :my_presenter do
    Object.new
  end

  let :my_controller do
    Object.new
  end

  subject do
    MyMediator.new my_presenter: my_presenter,
      my_controller: my_controller
  end

  it "assigns captives to instance variables" do
    subject.instance_variable_get(:@my_presenter).should == my_presenter
    subject.instance_variable_get(:@my_controller).should == my_controller
  end

  it "receives events" do
    mock(my_presenter).got_my_event
    subject.fire :my_event
  end
end
