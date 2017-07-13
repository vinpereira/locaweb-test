Feature: Verify my app's API
    As a developer
    I want to access my app's API
    In order to verify that the API is working

    @my_app_most_relevants_api @my_app_api
    Scenario: Get most relevants tweets using my app's API
        Given I perform a GET request to "most_relevants" endpoint
        Then I should see the Status Code 200
        And I should not get an empty response

    @my_app_most_mentions_api @my_app_api
    Scenario: Get users that more mentions Locaweb using my app's API
        Given I perform a GET request to "most_mentions" endpoint
        Then I should see the Status Code 200
        And I should not get an empty response

    @my_app_most_revelant @my_app
    Scenario: Get most relevants tweets using mocked data
        Given I have a mocked data
        When I perform a mocked GET request to Locaweb API service
        Then I should get the relevants tweets

    @my_app_most_mentions @my_app
    Scenario: Get users that more mentions Locaweb using mocked data
        Given I have a mocked data
        When I perform a mocked GET request to Locaweb API service
        Then I should get a list with users