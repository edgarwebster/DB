*** Settings ***

Resource  Keywords.robot

Test setup  setup

#Test teardown  exit

*** Test Cases ***

Buying an Item New User
    [Documentation]  This test executes a new user buying and check the necessary points.
    Select Item and Add to Card
    Proceed Checkout and Verify Card
    Registration
    Check Address and Proceed
    Shipping
    Payment and Check Price