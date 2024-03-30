# QualiAr

<div align="center">
<img src="https://github.com/emanuelgalvao/air-pollution-flutter/blob/main/dev_assets/cover.png" width="600">
</div>
<p align="center"><a href="https://play.google.com/store/apps/details?id=com.emanuelgalvao.qualiar" target="_blank"><img width="150px"src="https://logodownload.org/wp-content/uploads/2017/04/disponivel-google-play-badge.png"></a></p>

### Sobre o projeto

Projeto desenvolvido para a disciplina de Desenvolvimento Híbrido de Aplicativos, presente na Pós-Graduação de Desenvolvimento de Aplicativos Móveis da PUC-PR.

Objetivo do projeto era realizar o desenvolvimento de um aplicativo híbrido utilizando Flutter com o tema `Clima e Meio Ambiente`.

O QualiAr é uma aplicação com o objetivo de mostrar o nível de qualidade de ar em cidades do Brasil.

As informações sobre a qualidade do ar são obtidas através da API de Air Quality da [Open-Meteo](https://open-meteo.com/).

A aplicação não faz a requisição direto para a API da Open-Meteo, foi desenvolvido uma Firebase Cloud Function que funciona como um serviço BFF que realiza as requisições das localidades solicitadas pelo aplicativo e devolve apenas os dados necessários para a exibição.

A aplicação realiza a persistência local dos locais adicionados pelo usuário utilizando Shared Preferences.

A aplicação também foi configurada para funcionar com o modo claro e modo escuro.

### Resultado do Projeto

<div align="center" width="800px">
  <img src="https://github.com/emanuelgalvao/air-pollution-flutter/blob/main/dev_assets/1.png" width="200">
  <img src="https://github.com/emanuelgalvao/air-pollution-flutter/blob/main/dev_assets/2.png" width="200">
  <img src="https://github.com/emanuelgalvao/air-pollution-flutter/blob/main/dev_assets/3.png" width="200">
  <img src="https://github.com/emanuelgalvao/air-pollution-flutter/blob/main/dev_assets/4.png" width="200">
</div></br>
<div align="center" width="800px">
  <img src="https://github.com/emanuelgalvao/air-pollution-flutter/blob/main/dev_assets/5.png" width="200">
  <img src="https://github.com/emanuelgalvao/air-pollution-flutter/blob/main/dev_assets/6.png" width="200">
  <img src="https://github.com/emanuelgalvao/air-pollution-flutter/blob/main/dev_assets/7.png" width="200">
  <img src="https://github.com/emanuelgalvao/air-pollution-flutter/blob/main/dev_assets/8.png" width="200">
</div></br>

### Possíveis melhorias futuras

#### Melhorias Gerais

- Tela de informações de qualidade do ar em algumas capitais mundiais.
- Possibilidade de cadastro e login do usuário.
- Salvamento das preferências do usuário no servidor remoto.
- Possibilidade de adicionar localidades mundiais.

#### Melhorias técnicas

- Melhor organização dos Provider's.
- Otimização de performance componentes e telas.
- Melhoria em relação ao modo claro e escuro.
- Separação de validações que estão sendo realizadas na UI para classes especificas.
- Criação de Testes Unitários.
- Criação de Testes de UI.
