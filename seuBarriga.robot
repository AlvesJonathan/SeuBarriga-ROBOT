*** Settings ***
Documentation    Robot Framework Sem Complicação
Library          SeleniumLibrary    timeout=500
Library          String

*** Variables ***
${url}          https://seubarriga.wcaquino.me/login
${navegador}    chrome
${nome}         Raiane Barriga
${email}        email304@teste.com
${senha}        123456
${msgSucesso}   Usuário inserido com sucesso
${msgLogin}     Bem vindo, Jonathan teste!


*** Keywords ***
Entrando no site
    Open Browser                     ${url}    ${navegador}
    Maximize Browser Window

Novo cadastro
    Open Browser                     ${url}    ${navegador}
    Maximize Browser Window
    Click Link                       Novo usuário?
    Wait Until Element Is Visible    id=nome 
    Input Text                       id=nome    ${nome} 
    Input Text                       id=email   ${email}
    Input Password                   id=senha   ${senha}
    Click Element                    xpath=/html/body/div[2]/form/input
    Element Text Should Be           css=.alert-success    ${msgSucesso}

Login
    Open Browser                     ${url}    ${navegador}
    Maximize Browser Window
    Input Text                       id=email   ${email}
    Input Password                   id=senha   ${senha}
    Click Button                     xpath=//button[text()='Entrar']
    Element Text Should Be           css=.alert-success    ${msgLogin}
    

*** Test Cases ***
Acessando
    Entrando no site

Realizando cadastro
   Novo cadastro

Realizando Login
    Login

    


     

    
    