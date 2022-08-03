require "application_system_test_case"

class TweetsTest < ApplicationSystemTestCase
  test "visiting the index" do
    user = create(:user)
    _tweet1 = create(:tweet, user: user, body: "first tweet")
    _tweet2 = create(:tweet, user: user, body: "second tweet")
    _tweet3 = create(:tweet, user: user, body: "third tweet")

    visit root_path(as: user)

    assert_selector "h1", text: "Tweets"
  end

  test "should create tweet" do
    user = create(:user)
    visit tweets_path(as: user)

    click_on "New tweet"
    click_on "Create Tweet"

    assert_text "Tweet was successfully created"
    click_on "Back"
  end

  test "should update Tweet" do
    user = create(:user)
    tweet = create(:tweet, user: user)
    visit root_path(as: user)
    visit tweet_path(tweet)

    click_on "Edit this tweet", match: :first
    click_on "Update Tweet"

    assert_text "Tweet was successfully updated"
    click_on "Back"
  end

  test "should destroy Tweet" do
    user = create(:user)
    tweet = create(:tweet, user: user)
    visit root_path(as: user)
    visit tweet_path(tweet)

    click_on "Destroy this tweet", match: :first

    assert_text "Tweet was successfully destroyed"
  end
end