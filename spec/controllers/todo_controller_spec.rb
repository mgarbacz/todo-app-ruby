require 'spec_helper'

describe TodoController do

  describe "GET 'todos'" do
    it "returns http success" do
      get 'todos'
      response.should be_success
    end
  end

end
