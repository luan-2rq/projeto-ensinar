require "test_helper"

class CloseEndedQuestionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @close_ended_question = close_ended_questions(:one)
  end

  test "should get index" do
    get close_ended_questions_url
    assert_response :success
  end

  test "should get new" do
    get new_close_ended_question_url
    assert_response :success
  end

  test "should create close_ended_question" do
    assert_difference("CloseEndedQuestion.count") do
      post close_ended_questions_url, params: { close_ended_question: { alternative_a: @close_ended_question.alternative_a, alternative_b: @close_ended_question.alternative_b, alternative_c: @close_ended_question.alternative_c, alternative_d: @close_ended_question.alternative_d, correct_alternative: @close_ended_question.correct_alternative, description: @close_ended_question.description, difficulty: @close_ended_question.difficulty } }
    end

    assert_redirected_to close_ended_question_url(CloseEndedQuestion.last)
  end

  test "should show close_ended_question" do
    get close_ended_question_url(@close_ended_question)
    assert_response :success
  end

  test "should get edit" do
    get edit_close_ended_question_url(@close_ended_question)
    assert_response :success
  end

  test "should update close_ended_question" do
    patch close_ended_question_url(@close_ended_question), params: { close_ended_question: { alternative_a: @close_ended_question.alternative_a, alternative_b: @close_ended_question.alternative_b, alternative_c: @close_ended_question.alternative_c, alternative_d: @close_ended_question.alternative_d, correct_alternative: @close_ended_question.correct_alternative, description: @close_ended_question.description, difficulty: @close_ended_question.difficulty } }
    assert_redirected_to close_ended_question_url(@close_ended_question)
  end

  test "should destroy close_ended_question" do
    assert_difference("CloseEndedQuestion.count", -1) do
      delete close_ended_question_url(@close_ended_question)
    end

    assert_redirected_to close_ended_questions_url
  end
end
