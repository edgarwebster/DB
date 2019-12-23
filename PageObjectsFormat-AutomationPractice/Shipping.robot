*** Settings ***
Library           Selenium2Library
Resource          environment.robot
*** Keywords ***


Agree with terms
      Select checkbox   cgv

Proceed Shipping
      click element   //*[contains(@class, 'button btn btn-default standard-checkout button-mediu')]


