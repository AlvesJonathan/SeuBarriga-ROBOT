*** Settings ***
Documentation    Robot Framework Sem Complicação
Library          SeleniumLibrary    timeout=500
Library          String



*** Variables ***
${url}                  https://seubarriga.wcaquino.me/login
${navegador}            chrome
${nome}                 Raiane Barriga
${email}                email305@teste.com
${senha}                123456
${msgSucesso}           Usuário inserido com sucesso
${msgLogin}             Bem vindo, Raiane Barriga!
${dtMovimentacao}       01/05/2013
${dtPagamento}          03/06/2013
${descricao}            Teste de movimentação
${interessado}          TesteBarriga
${valor}                321,69


*** Keywords ***
Acessando o site
    Open Browser                     ${url}    ${navegador}

Novo cadastro
    Open Browser                     ${url}    ${navegador}
    Click Link                       Novo usuário?
    Wait Until Element Is Visible    id=nome 
    Input Text                       id=nome    ${nome} 
    Input Text                       id=email   ${email}
    Input Password                   id=senha   ${senha}
    Click Element                    xpath=/html/body/div[2]/form/input
    Element Text Should Be           css=.alert-success    ${msgSucesso}

Login
    Open Browser                     ${url}    ${navegador}
    Input Text                       id=email   ${email}
    Input Password                   id=senha   ${senha}
    Click Button                     xpath=//button[text()='Entrar']
    Element Text Should Be           css=.alert-success    ${msgLogin}

Movimentação
    Click Link                   Criar Movimentação
    Select From List By Label    id=tipo              Despesa
    Input Text                   id=data_transacao    ${dtMovimentacao}
    Input Text                   id=data_pagamento    ${dtPagamento}
    Input Text                   id=descricao         ${descricao}
    Input Text                   id=interessado       ${interessado}   
    Input Text                   id=valor             ${valor}
    Select From List By Label    id=conta             Conta

*** Test Cases ***
Cenário 01: Acessar o site
    Acessando o site

Cenário 02: Realizar cadastro
    Novo cadastro

Cenário 03: Realizar Login
    Login

#Cenário 04: Criar movimentação
#Cenário cancelado pois o campo conta está sem opções no sistema
#    Login
#    Movimentação
    


     

    
    