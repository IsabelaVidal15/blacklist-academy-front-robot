*** Settings ***
Documentation    Arquivo com variáveis locais e palavras-chave da funcionalidade de usuário

Resource    ../../resources/base.resource

*** Variables ***
${menu_cadastros}    id=Cadastros
${menu_usuarios}    id=Usuários

${botao_novo_cadastro}     css=button[class="css-fvzsut"]
${modal_novo_cadastro}    css=div.css-g7173l > div > form > h5
${campo_nome_completo}    css=input[name="fullName"]
${campo_email_modal_novo_cadastro}      id=mail
${perfil_acesso}    ADMIN
${campo_perfil_acesso}    css=input[name="accessProfile"]
${campo_cpf}     id=cpf    
${campo_senha}      css=input[name="password"]
${campo_confirme_a_senha}      css=input[name="confirmPassword"]
${botao_salvar_novo}     css=button[class="css-1vmo4go"]

${botao_editar}    (//button[@id='edit'])[1]
${modal_editar_cadastro}    css=div.css-g7173l > div > form > h5


*** Keywords ***
Clicar no menu "Cadastros > Usuários"
    Wait Until Element Is Visible    ${menu_cadastros}
    Click Element    ${menu_cadastros}

    Wait Until Element Is Visible    ${menu_usuarios}
    Click Element    ${menu_usuarios}
    
    Sleep    ${TIMEOUT}
    Location Should Be    ${URL}/user

Clicar no botão "Novo Cadastro"
    Wait Until Element Is Visible    ${botao_novo_cadastro}
    Click Element    ${botao_novo_cadastro}

    Wait Until Element Is Visible    ${modal_novo_cadastro}

Informar os campos necessários
    [Arguments]    ${nome_completo}    ${email}    ${cpf}   ${senha_confirme_a_senha}
    Wait Until Element Is Visible    ${campo_nome_completo}
    Click Element    ${campo_nome_completo}
    Input Text    ${campo_nome_completo}    ${nome_completo}

    Wait Until Element Is Visible    ${campo_email_modal_novo_cadastro}
    Click Element    ${campo_email_modal_novo_cadastro}
    Input Text    ${campo_email_modal_novo_cadastro}    ${email}

    Wait Until Element Is Visible    ${campo_perfil_acesso}
    Click Element    ${campo_perfil_acesso}
    Input Text    ${campo_perfil_acesso}    ${perfil_acesso}

    Wait Until Element Is Visible    ${campo_cpf}
    Click Element    ${campo_cpf}
    Input Text    ${campo_cpf}    ${cpf}

    Wait Until Element Is Visible    ${campo_senha}
    Click Element    ${campo_senha}
    Input Text    ${campo_senha}    ${senha_confirme_a_senha}

    Wait Until Element Is Visible    ${campo_confirme_a_senha}
    Click Element    ${campo_confirme_a_senha}
    Input Text    ${campo_confirme_a_senha}    ${senha_confirme_a_senha}

Clicar no botão "SALVAR NOVO"
    Wait Until Element Is Visible    ${botao_salvar_novo}
    Click Element    ${botao_salvar_novo}

    Capture Page Screenshot

Apresentar a tela "Usuários"
    Sleep    ${TIMEOUT}
    Location Should Be    ${URL}/user

Clicar no botão "Editar"
    Wait Until Element Is Visible    ${botao_editar}
    Click Element    ${botao_editar}

Apresentar o modal "Editar Cadastro"
    Wait Until Element Is Visible    ${modal_editar_cadastro}
