*** Settings ***
Library           Selenium2Library
Resource          Environment.robot
*** Keywords ***
Open Site
        Open Browser            ${URLwelcome}    ${Browser}

Select Category
        run keyword if  '${Category}'=='women'  click element   //*[@id="block_top_menu"]/ul/li[1]/a
        ...  ELSE IF  '${Category}'=='dresses'    click element      //*[@id="block_top_menu"]/ul/li[2]/a
        ...  ELSE IF  '${Category}'=='t-shirts'    click element      //*[@id="block_top_menu"]/ul/li[3]/a
