require "test_helper"

class PrototypesControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
end


test "should redirect to new prototype page if save fails" do
  post prototypes_url, params: { prototype: { title: "", catch_copy: "", concept: "" } }
  assert_template :new
end