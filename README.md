# ApiTestKarate

Created Integration Tests for endpoints
○ (A) POST /txp/transaction and
○ (B) POST /txp/transaction/range with Karate

Test the following functionalities against different set of input.

* Checked /txp/transaction response against different co2_categories.
* Checked /txp/transaction response against different currencies.
* Checked /txp/transaction response against different modelRegionCode.
* Checked /txp/transaction response against array.
* Checked /txp/transaction response without manadatory fields.
* Checked /txp/transaction response against empty object.

* Checked /txp/transaction/range response against incorrect modelRegionCode.
* Checked /txp/transaction/range response size is equal to the provided array size.
* Checked /txp/transaction/range response size is against the empty array.


Following test cases not given expected output or failed

* Checked /txp/transaction response against different currencies.
 * Expected USD : Actual EUR
 * Above test case return EUR as currency if USD is provided in input.

* Checked /txp/transaction response against different co2_categories.
  * this provide co2_insights only in case of grocery otherwise give null
  
* Checked /txp/transaction response against array.
* Checked /txp/transaction response against empty object.
* Checked /txp/transaction response without manadatory fields.
 * The above three cases fails give response code 400 with message: There is probably a required attribute missing
 
* Checked /txp/transaction/range response against incorrect modelRegionCode.
  *Failed with response code 500 and message: Internal Server Error
  
  
I suggest it requires a better documentation for testing which states, what should be expected against particulat set of input fields.
Currenlty developer have to check manually and compare different set of input and output for validation.

