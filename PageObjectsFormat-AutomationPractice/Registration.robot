*** Settings ***
Library           Selenium2Library
Resource          Environment.robot
*** Keywords ***


Insert e-mail and press button
      Input text      email_create    ${E-mail}
      click element   //*[@id="SubmitCreate"]

Radio Button
      wait until page contains element   //*[@id="id_gender1"]
      sleep   5s
      click element  //*[@id="id_gender1"]

First Name, Last Name and Password
       Input text   customer_firstname   ${FirstName}
       Input text   customer_lastname    ${LastName}
       Input text   passwd               ${Password}

Birthday
      Select From List By Value  days    ${BirthdayDay}
      Select From List By Value  months  ${BirthdayMonth}
      Select From List By Value  years   ${BirthdayYear}

Company
      Input text   company   ${Company}

Address
      Input text   address1                 ${Address}
      Input text   address2                 ${Address2}
      Input text   city                     ${City}
      Select From List By Label  id_state   ${State}
      Input text   postcode                 ${Postcode}
      Input text   phone_mobile             ${MobilePhone}
      Click Button   submitAccount

Checking Address
      ${CompleteName}  catenate     ${FirstName}    ${LastName}
      Element Should Contain   //*[contains(@class, 'address_firstname address_lastname')]                 ${CompleteName}
      Element Should Contain   //*[contains(@class, 'address_company')]                                    ${Company}
      ${CompleteAddress}     catenate     ${Address}    ${Address2}
      Element Should Contain   //*[contains(@class, 'address_address1 address_address2')]                  ${CompleteAddress}
      ${CityPlusComa}    catenate  SEPARATOR=   ${City}    ,
      ${CityStatePostcode}   catenate     ${CityPlusComa}  ${State}  ${Postcode}
      Element Should Contain   //*[contains(@class, 'address_city address_state_name address_postcode')]   ${CityStatePostcode}
      Element Should Contain   //*[contains(@class, 'address_country_name')]                               ${Country}
      Element Should Contain   //*[contains(@class, 'address_phone_mobile')]                               ${MobilePhone}
      Click element   //*[@id="address_delivery"]/li[7]
      capture page screenshot     ${path_to_save_screenshots_files}/CheckingAddress.png