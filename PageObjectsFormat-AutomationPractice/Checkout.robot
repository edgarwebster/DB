*** Settings ***
Library           Selenium2Library
Resource          Environment.robot



*** Keywords ***

Proceed Checkout
        wait until page contains element    //*[@id="layer_cart"]/div[1]/div[2]/div[4]/a
        sleep  5s
        ${Product price}  get text   //*[@id="layer_cart"]/div[1]/div[2]/div[1]/span
        ${Shipping price}  get text  //*[@id="layer_cart"]/div[1]/div[2]/div[2]/span
        ${Total Price}  get text  //*[@id="layer_cart"]/div[1]/div[2]/div[3]/span
        @{Product} =  Set variable  ${Product price}  ${Shipping price}  ${Total Price}
        click link     //*[@id="layer_cart"]/div[1]/div[2]/div[4]/a

        [Return]   @{Product}

Verify Card
        [Arguments]   @{Product}
        wait until page contains element  //*[@id="product_1_1_0_0"]/td[2]/p/a
        Sleep    5s
        Element Should Contain   //*[@id="product_1_1_0_0"]/td[2]/p/a   ${Item}
        Element Should Contain  //*[@id="total_product"]    ${Product[0]}
        Element Should Contain  //*[@id="total_shipping"]  ${Product[1]}
        Element Should Contain  //*[@id="total_price"]     ${Product[2]}
        Click element   //*[@id="total_price"]
        Capture page screenshot     ${path_to_save_screenshots_files}/VerifyCard.png
        Click link     //*[@id="center_column"]/p[2]/a[1]




