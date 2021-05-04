Feature: sample transaction test

  Background:
    * url 'https://public-de.sandbox.api-ecolytiq.com:443'
    * header Content-Type = 'application/json'
    * header Authorization = 'Bearer ' + 'eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6ImVjb2x5dGlxLW9hdXRoLWp3dCJ9.eyJzY29wZSI6WyJhbGwiXSwiZXhwIjoxNjIwMTQ2MjEzLCJqdGkiOiI2MzQ1NGNmMi02NWVkLTQxOTUtOTQ3ZC05Y2U5ZmEwZTUwODMiLCJjbGllbnRfaWQiOiJ0ZXN0bmFiaWwtc2FuZGJveC1jbGllbnQtcGlVREprIn0.eWj5WczSDTv458iV0UqhE2iDz-rmlFGOSoFpl9ge9974FRTjCtuB21y-DUIoFilvgFfNmFzzn_-T3OYS_cnn8nC0ti5lxlmimfqIdtvhD2RCUf9Kshcr-QKAweuEYJM_UWlzrsWhLG4VT2I_ICPSqIjvt8P2iasJ-Hdo7pqkBCFtqBiuvm3Ke_MwzdGNlp8JqSEWu2gakxxzsZBCGkLxPozbGQtpQwoYpOl6PrH0L6MNNwzgn2kpmgP0mW2UlQcHLWkTI-g7Cz0wdRDSg8gdxyY134zF2TeP4qz5Rj67L2-Btfkxzy7xpAxjDU-MeseqFwy6O02PDZmfOilH5IZ1sg'


  Scenario: get transaction amount
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

  Scenario: get transaction amount
    Given path 'txp/transaction'
    And def payload = read('/data/rewe_request.json')
    And param contentCodes = 'lopp'
    And request payload
    When method post
    Then status 200
    And match response.tx.currency != 'USD'
    And match response.co2_category == 'Catering'
    And match response.co2_insights == null

  Scenario: get transaction amount
    Given path 'txp/transaction'
    And def payload = read('/data/aldi_5_requests.json')
    And request payload
    When method post
    Then status 400

  Scenario: get transaction amount
    Given path 'txp/transaction'
    And def payload = read('/data/empty_request.json')
    And param modelRegionCode = 'FR'
    And request payload
    When method post
    Then status 400


