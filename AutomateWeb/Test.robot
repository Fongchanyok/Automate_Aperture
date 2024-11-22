*** Settings *** 
Library    SeleniumLibrary


*** Variables ***
${url}                  https://www.saucedemo.com/
${browser}              chrome
${locator_email}        id=user-name
${locator_password}     id=password
${locator_login}        id=login-button
${Firstname}            id=first-name
${Lastname}             id=last-name
${Zip}                  id=postal-code
${Product}              xpath=//[@id="header_container"]/div[2]/span
${item}                 xpath=//[@id="item_4_title_link"]/div
${error}                xpath=//*[@id="login_button_container"]/div/form/div[3]/h3


***Keywords***
Input data fail
        Input Text 	 ${locator_email}    Test
        Input Text 	 ${locator_password}    Test 


*** Test Cases ***
TC01-login pass1
    Set Selenium Speed 	 2s
    Open Browser    https://www.saucedemo.com/    chrome
    Maximize Browser Window
    Wait Until Element Is Visible 	        id=user-name       1s
    Input Text    ${locator_email} 	        standard_user
    Input Text    ${locator_password} 	    secret_sauce
    Click Element    id=login-button
    Click Element 	 id=add-to-cart-sauce-labs-backpack     
    Click Element 	 xpath=//*[@id="shopping_cart_container"]/a
    Click Element 	 id=checkout
    Input Text 	     ${Firstname} 	 Test
    Input Text 	 ${Lastname} 	 Test
    Input Text 	 ${zip} 	 12345    
    Click Element 	 id=continue
    Page Should Contain    Sauce Labs Backpack 	
    Click Element 	 id=finish 	 
    Page Should Contain         Thank you for your order!
    Click Element 	 id=back-to-products 


TC01-login pass2
    Set Selenium Speed 	 2s
    Open Browser    https://www.saucedemo.com/    chrome
    Maximize Browser Window
    Wait Until Element Is Visible 	        id=user-name       1s
    Input Text    ${locator_email} 	        problem_user
    Input Text    ${locator_password} 	    secret_sauce
    Click Element    id=login-button
    Click Element 	 id=add-to-cart-sauce-labs-backpack     
    Click Element 	 xpath=//*[@id="shopping_cart_container"]/a
    Click Element 	 id=checkout
    Input Text 	     ${Firstname} 	 T
    Input Text 	 ${Lastname} 	 ""
    Input Text 	 ${zip} 	 12345    
    Click Element    id=continue
    ${txt}      Get Text        xpath=//*[@id="checkout_info_container"]/div/form/div[1]/div[4]/h3
    Should be Equal As Strings      ${txt}      Error: Last Name is required
    Close Browser
    

TC01-login pass3
    Set Selenium Speed 	 2s
    Open Browser    https://www.saucedemo.com/    chrome
    Maximize Browser Window
    Wait Until Element Is Visible 	        id=user-name       1s
    Input Text    ${locator_email} 	        performance_glitch_user
    Input Text    ${locator_password} 	    secret_sauce
    Click Element    id=login-button
    Click Element 	 id=add-to-cart-sauce-labs-backpack     
    Click Element 	 xpath=//*[@id="shopping_cart_container"]/a
    Click Element 	 id=checkout
    Input Text 	     ${Firstname} 	 Test
    Input Text 	 ${Lastname} 	 Test
    Input Text 	 ${zip} 	 12345    
    Click Element 	 id=continue
    Page Should Contain    Sauce Labs Backpack 	
    Click Element 	 id=finish 	 
    Page Should Contain         Thank you for your order!
    Click Element 	 id=back-to-products 


TC01-login pass4
    Set Selenium Speed 	 2s
    Open Browser    https://www.saucedemo.com/    chrome
    Maximize Browser Window
    Wait Until Element Is Visible 	        id=user-name       1s
    Input Text    ${locator_email} 	        error_user
    Input Text    ${locator_password} 	    secret_sauce
    Click Element    id=login-button
    Click Element 	 id=add-to-cart-sauce-labs-backpack     
    Click Element 	 xpath=//*[@id="shopping_cart_container"]/a
    Click Element 	 id=checkout
    Input Text 	     ${Firstname} 	 Test
    Input Text 	 ${Lastname} 	 ""
    Input Text 	 ${zip} 	 12345    
    Click Element 	 id=continue
    Page Should Contain    Sauce Labs Backpack 	
    Click Element 	 id=finish 	 
    Close Browser


TC01-login pass5
    Set Selenium Speed 	 2s
    Open Browser    https://www.saucedemo.com/    chrome
    Maximize Browser Window
    Wait Until Element Is Visible 	        id=user-name       1s
    Input Text    ${locator_email} 	        visual_user
    Input Text    ${locator_password} 	    secret_sauce
    Click Element    id=login-button
    Click Element 	 id=add-to-cart-sauce-labs-backpack     
    Click Element 	 xpath=//*[@id="shopping_cart_container"]/a
    Click Element 	 id=checkout
    Input Text 	     ${Firstname} 	 Test
    Input Text 	 ${Lastname} 	 Test
    Input Text 	 ${zip} 	 12345    
    Click Element 	 id=continue
    Page Should Contain    Sauce Labs Backpack 	
    Click Element 	 id=finish 	 
    Page Should Contain         Thank you for your order!
    Click Element 	 id=back-to-products 


TC01-login pass6
    Set Selenium Speed 	 2s
    Open Browser    https://www.saucedemo.com/    chrome
    Maximize Browser Window
    Wait Until Element Is Visible 	        id=user-name       1s
    Input Text    ${locator_email} 	        visual_user
    Input Text    ${locator_password} 	    secret_sauce
    Click Element    id=login-button


TC-login fail
        Set Selenium Speed 	 2s
        Open Browser    https://www.saucedemo.com/      chrome
        Wait Until Element Is Visible 	 id=user-name   1s
        Input data fail
        ${txt}      Get Text        ${error}
        should be Equal As Strings      ${txt}      Epic sadface: Username and password do not match any user in this service
        close Browser

TC-login add to cart
    Set Selenium Speed 	 2s
    Open Browser    https://www.saucedemo.com/      chrome
    Wait Until Element Is Visible 	        id=user-name   2s
    Input Text 	 ${locator_email} 	        standard_user
    Input Text 	 ${locator_password} 	    secret_sauce
    Click Element    id=login-button
    Click Element 	 id=add-to-cart-sauce-labs-backpack 
    close Browser


TC-login remove cart
    Set Selenium Speed 	 1s
    Open Browser    https://www.saucedemo.com/      chrome
    Wait Until Element Is Visible 	        id=user-name   1s
    Input Text 	 ${locator_email} 	        standard_user
    Input Text 	 ${locator_password} 	    secret_sauce
    Click Element    id=login-button
    Click Element 	 id=add-to-cart-sauce-labs-backpack 
    sleep       1s
    Click Element       id=remove-sauce-labs-backpack
    close Browser