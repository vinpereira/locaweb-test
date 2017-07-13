Feature: Verify the Locaweb Tweets API
    As a developer
    I want to access the Locaweb Tweets API
    In order to verify that the API is working

    @locaweb_tweets_statuscode @locaweb_tweets
    Scenario: Get StatusCode from Locaweb Tweets API
        Given I perform a GET request to Locaweb Tweets service
        Then I should see the Status Code 200
