*** Settings ***
Library           Selenium2Library
Resource          Environment.robot


*** Keywords ***

Select Item
        click image        ${item}

Add to a card
        wait until page contains  Condition
        Select Frame   xpath=//*[contains(@id, 'ancybox-frame')]
        click button  Submit






