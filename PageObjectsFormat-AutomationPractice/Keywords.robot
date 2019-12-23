*** Settings ***
Library           Selenium2Library
Resource  Home.robot
Resource  Categories.robot
Resource  Checkout.robot
Resource  Registration.robot
Resource  Shipping.robot
Resource  Payment.robot

*** Keywords ***
setup
    Open Site
exit
    close all browsers

Select Item and Add to Card
    [Documentation]  This keyword add a choosen item to card and verify if it
    Select Category
    Select Item
    Wait Until Element Is Not Visible   http://automationpractice.com/img/loader.gif
    Add to a card
    Log to console  \n Item added to Card


Proceed Checkout and Verify Card
    [Documentation]  This keyword proceeds the checkout no inputs are needed
    @{Product price}  Proceed Checkout
    Verify Card  @{Product price}
    Log to Console  Checkout Proceeded


Registration
    [Documentation]  This keyword execute all the restration of a new user.
    Insert e-mail and press button
    Radio Button
    First Name, Last Name and Password
    Birthday
    Company
    Address
    Log to console  Registration Done

Check Address and Proceed
    [Documentation]  This keyword checks the data according to the registration
    Checking Address
    Click Element  //*[contains(@class, 'button btn btn-default button-medium')]
    Log to Console  Address checked

Shipping
    [Documentation]  This keyword with the terms and proceeds to shipping
    Agree with terms
    Proceed Shipping
    Log to Console  Shipping proceeded

Payment and Check Price
    [Documentation]  This keyword execute the payment and check it.
    Checking Type and Get Price
    ${Price}    Get text  total_price
    Proceed Payment
    Element Should Contain   //*[@id="amount"]   ${Price}
    Click element  //*[@id="center_column"]/form/div/p[4]
    Capture page screenshot     ${path_to_save_screenshots_files}/PaymentAndCheckPrice.png
    Finish
    Element Should Contain  //*[@id="center_column"]/div/span/strong  ${Price}
    Log to console  Payment executed and checked
