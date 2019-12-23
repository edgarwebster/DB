*** Settings ***
Library           Selenium2Library
Resource          Environment.robot


*** Keywords ***

Checking Type and Get Price
        Sleep  3s
        Page Should Contain   ${Item}

Proceed Payment
        Click element  //*[contains(@class, 'bankwire')]

Finish
        Click element     //*[contains(@class, 'button btn btn-default button-medium')]
        Click element   //*[@id="center_column"]/div/strong[4]
        Capture page screenshot     ${path_to_save_screenshots_files}/Finish.png
