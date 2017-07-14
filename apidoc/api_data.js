define({ "api": [
  {
    "type": "get",
    "url": "/api/v1/most_mentions",
    "title": "Request Users that has more tweets about Locaweb",
    "version": "1.0.0",
    "name": "GetMostMentions",
    "group": "Tweets",
    "success": {
      "examples": [
        {
          "title": "Success-Response:",
          "content": "HTTP/1.1 200 OK\n{\n    \"garnet_koepp\": [\n        {\n            \"user\": {\n                \"profile\": {\n                    \"screen_name\": \"garnet_koepp\",\n                    \"url\": \"http://a0.twimg.com/profile_images/2359746665/1v6zfgqo8g0d3mk7ii5s_normal.jpeg\"\n                },\n                \"followers_info\": {\n                    \"count\": 901\n                }\n            },\n            \"tweet_info\": {\n                \"text\": \"We need to generate the @locaweb \",\n                \"created_at\": \"Mon Sep 24 03:35:21 +0000 2012\",\n                \"retweet_count\": 0,\n                \"favorite_count\": 190\n            }\n        }\n    ]\n}",
          "type": "json"
        }
      ]
    },
    "filename": "./routes/app.rb",
    "groupTitle": "Tweets"
  },
  {
    "type": "get",
    "url": "/api/v1/most_relevants",
    "title": "Request Tweets information about Locaweb",
    "version": "1.0.0",
    "name": "GetMostRelevants",
    "group": "Tweets",
    "success": {
      "examples": [
        {
          "title": "Success-Response:",
          "content": "HTTP/1.1 200 OK\n[\n    {\n        \"user\": {\n            \"profile\": {\n                \"screen_name\": \"goldner_rosalyn_mrs\",\n                \"url\": \"http://a0.twimg.com/profile_images/2359746665/1v6zfgqo8g0d3mk7ii5s_normal.jpeg\"\n            },\n            \"followers_info\": {\n                \"count\": 971\n            }\n        },\n        \"tweet_info\": {\n            \"text\": \"I'll index the cross-platform RAM pixel, that should protocol the @locaweb \",\n            \"created_at\": \"Mon Sep 24 03:35:21 +0000 2012\",\n            \"retweet_count\": 0,\n            \"favorite_count\": 0\n        }\n    }\n]",
          "type": "json"
        }
      ]
    },
    "filename": "./routes/app.rb",
    "groupTitle": "Tweets"
  },
  {
    "success": {
      "fields": {
        "Success 200": [
          {
            "group": "Success 200",
            "optional": false,
            "field": "varname1",
            "description": "<p>No type.</p>"
          },
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "varname2",
            "description": "<p>With type.</p>"
          }
        ]
      }
    },
    "type": "",
    "url": "",
    "version": "0.0.0",
    "filename": "./apidoc/main.js",
    "group": "_home_vinicius_workspace_locaweb_test_apidoc_main_js",
    "groupTitle": "_home_vinicius_workspace_locaweb_test_apidoc_main_js",
    "name": ""
  }
] });
