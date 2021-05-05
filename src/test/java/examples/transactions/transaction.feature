Feature: sample transaction test

  #header authrorization need to be reset after specific interval
  Background:
    * url 'https://public-de.sandbox.api-ecolytiq.com:443'
    * header Authorization = 'Bearer ' + 'eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6ImVjb2x5dGlxLW9hdXRoLWp3dCJ9.eyJzY29wZSI6WyJhbGwiXSwiZXhwIjoxNjIwMTU1MjAyLCJqdGkiOiIxMzcwMDQ3Zi0wNDg2LTQzZDMtYmUwMS03ZjdhMzQ0NDY1NjciLCJjbGllbnRfaWQiOiJ0ZXN0bmFiaWwtc2FuZGJveC1jbGllbnQtcGlVREprIn0.YvE6UM1Vc9G8UAtPEhxpvRSr1ilo2Ng2s1GriX4cvdwg8ZuMGmX0UyuZH6tr-dXk7e0ojNZxIZ0SLhoNiQIby3ibWKMYpwKDQuX3zEZeq33FxbzvDM0KMME3EWNNL2C79XfGT-dxPryFtPzdvSGH-mjZ-J7z_AM8hbwunVNQNR-mrgQMD3INBOoqY5npAu1H3BSTWu3gEgOXJGifzoxebF8XysGGcRlVEecCs8n-0zvMeMOV4fE1JPfVGxeBWuPLejwHgTZMbOSfeC8nQqShBRaLYyWXBfnbbwmxeMsMLdi-vM-60ps1U6z-m2J3HbpcoD9KELfkZF7nvu4msLk_dA'


  Scenario: check transaction response against groceries
    Given path 'txp/transaction'
    And def payload = read('/data/aldi_request.json')
    And param modelRegionCode = 'UK'
    And request payload
    When method post
    Then status 200
    And match response.tx.amount == '50.70'
    And match response.tx.currency == 'EUR'
    And match response.co2_category == 'Groceries'
    And match response.co2_footprint == '#notnull'

  Scenario: check transaction response against Catering
    Given path 'txp/transaction'
    And def payload = read('/data/rewe_request.json')
    And param contentCodes = 'lopp'
    And request payload
    When method post
    Then status 200
    And match response.tx.currency != 'USD'
    And match response.co2_category == 'Catering'
    And match response.co2_insights == null
      #"accepting wrong currency and not giving any co2_insights




  Scenario: check transaction response against array
    Given path 'txp/transaction'
    And def payload = read('/data/aldi_5_requests.json')
    And request payload
    When method post
    Then status 400
        #error":""Invalid Request. Message not readable. There is probably a required attribute missing.

  Scenario: check transaction response against empty object
    Given path 'txp/transaction'
    And def payload = read('/data/empty_request.json')
    And param modelRegionCode = 'FR'
    And request payload
    When method post
    Then status 400
     #error":""Invalid Request. Message not readable. There is probably a required attribute missing.

  Scenario: check transaction response against empty object
    Given path 'txp/transaction'
    And def payload = read('/data/missingfileds_request.json')
    And request payload
    When method post
    Then status 400
    #error":""Invalid Request. Message not readable. There is probably a required attribute missing.