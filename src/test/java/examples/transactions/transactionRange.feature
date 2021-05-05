Feature: sample transactionRange test

  #header authrorization need to be reset after specific interval
  Background:
    * url 'https://public-de.sandbox.api-ecolytiq.com:443'
    * header Content-Type = 'application/json'
    * header Authorization = 'Bearer ' + 'eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6ImVjb2x5dGlxLW9hdXRoLWp3dCJ9.eyJzY29wZSI6WyJhbGwiXSwiZXhwIjoxNjIwMTQ3OTUzLCJqdGkiOiIxNmY5ZDcyOC00YzQ3LTQ3OTQtOWI1ZS02NmVlMTllYTc5ODYiLCJjbGllbnRfaWQiOiJ0ZXN0bmFiaWwtc2FuZGJveC1jbGllbnQtcGlVREprIn0.bWU3WmvcxCBL41o5_pC75p4VOohKHhXRYrNoIYMOnYglIiP2PCIIBEvqHJUvkoy0rtvJlGNQNV-sfKLk7yfjn5rfLA0Ol3iQWHfu84PJ8Q8mrMvapdfv9uRi_ALBBu-SNFTFbsD1YG4Xa0RgezcXWDx_hG9JQ33quoNhOIcKG5QYbkItO6hjOBqEDD-Kqk6p_fwjnP1McnF36gDcfSihydT2wEdNQWKG0r-lbBiTzaPgq037NOtIcDekQYnSxaEp6TXHVjadRRW-8Jm4xjIdWVv31MROeVkc9LBc5AvuCON8syFmnKLEQktFjugyT2ZvTA1VDNZ5AI15imiwrwQHKg'


  Scenario: check transaction as object
    Given path 'txp/transaction/range'
    And def payload = read('/data/aldi_request.json')
    And request payload
    When method post
    Then status 500
    #error":"Unreadable response


  Scenario: check transaction count for five values
    Given path 'txp/transaction/range'
    And def payload = read('/data/aldi_5_requests.json')
    And param modelRegionCode = 'UK'
    And request payload
    When method post
    Then status 200
    And match response == '#[5]'

  Scenario: check transaction count for 100 values
    Given path 'txp/transaction/range'
    And def payload = read('/data/aldi_100_requests.json')
    And request payload
    When method post
    Then status 200
    And match response == '#[100]'


  Scenario: check transaction count for empty array
    Given path 'txp/transaction/range'
    And def payload = read('/data/emptyarr_request.json')
    And request payload
    When method post
    Then status 200
    And match response == '#[0]'

  Scenario: wrong model region code
    Given path 'txp/transaction/range'
    And def payload = read('/data/aldi_5_requests.json')
    And param modelRegionCode = 'UKk'
    And request payload
    When method post
    Then status 500
      #error":"Internal Server Error
