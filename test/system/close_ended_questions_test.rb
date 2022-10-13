require "application_system_test_case"

class CloseEndedQuestionsTest < ApplicationSystemTestCase
  setup do
    @close_ended_question = close_ended_questions(:one)
  end

  test "visiting the index" do
    visit close_ended_questions_url
    assert_selector "h1", text: "Close ended questions"
  end

  test "should create close ended question" do
    visit close_ended_questions_url
    click_on "New close ended question"

    fill_in "Alternative a", with: @close_ended_question.alternative_a
    fill_in "Alternative b", with: @close_ended_question.alternative_b
    fill_in "Alternative c", with: @close_ended_question.alternative_c
    fill_in "Alternative d", with: @close_ended_question.alternative_d
    fill_in "Correct alternative", with: @close_ended_question.correct_alternative
    fill_in "Description", with: @close_ended_question.description
    fill_in "Difficulty", with: @close_ended_question.difficulty
    click_on "Create Close ended question"

    assert_text "Close ended question was successfully created"
    click_on "Back"
  end

  test "should update Close ended question" do
    visit close_ended_question_url(@close_ended_question)
    click_on "Edit this close ended question", match: :first

    fill_in "Alternative a", with: @close_ended_question.alternative_a
    fill_in "Alternative b", with: @close_ended_question.alternative_b
    fill_in "Alternative c", with: @close_ended_question.alternative_c
    fill_in "Alternative d", with: @close_ended_question.alternative_d
    fill_in "Correct alternative", with: @close_ended_question.correct_alternative
    fill_in "Description", with: @close_ended_question.description
    fill_in "Difficulty", with: @close_ended_question.difficulty
    click_on "Update Close ended question"

    assert_text "Close ended question was successfully updated"
    click_on "Back"
  end

  test "should destroy Close ended question" do
    visit close_ended_question_url(@close_ended_question)
    click_on "Destroy this close ended question", match: :first

    assert_text "Close ended question was successfully destroyed"
  end
end
