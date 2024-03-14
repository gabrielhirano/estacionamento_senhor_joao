
# Aplicativo de Registro de Entrada e Saída de Caminhões
Este é um aplicativo simples desenvolvido para registrar a entrada e saída de caminhões em um estacionamento. O aplicativo possui uma única tela onde os usuários podem registrar quando um caminhão entra ou sai do estacionamento. Além disso, há uma área na tela que exibe o horário atual e a vaga ocupada no momento.

## Tecnologias Utilizadas
O aplicativo foi desenvolvido utilizando as seguintes tecnologias:

### Flutter: Framework de desenvolvimento de aplicativos móveis multiplataforma.
### Versão Utilizada: 3.18

### Dart: Linguagem de programação utilizada pelo Flutter.
### Versão Utilizada: 3.3.0

### BLoC (Business Logic Component): Gerenciador de estado para separar a lógica de negócios da interface do usuário.

Clean Architecture: Arquitetura de software que promove a separação de responsabilidades em camadas independentes, facilitando a manutenção e teste do código.

## Funcionalidades
O aplicativo possui as seguintes funcionalidades:

Registro de Entrada de Caminhão: Os usuários podem registrar quando um caminhão entra no estacionamento, fornecendo os detalhes necessários, como o número da vaga e a hora de entrada.

Registro de Saída de Caminhão: Os usuários podem registrar quando um caminhão sai do estacionamento, fornecendo os detalhes necessários, como o número da vaga e a hora de saída.

Exibição do Horário Atual e Vaga Ocupada: Uma área na tela exibe o horário atual e a vaga ocupada no momento. Essa informação é atualizada automaticamente conforme os registros de entrada e saída são feitos.

## Persistência de Dados
Todos os dados são armazenados localmente no dispositivo do usuário. Os registros de entrada e saída de caminhões são armazenados localmente para garantir que as informações estejam disponíveis mesmo sem conexão com a internet. Uma abstração da comunicação foi implementada para facilitar futuras integrações com fontes de dados remotas, permitindo a adição de um Remote Data Source para consumo de API externa, se necessário.

## Teste
Foram realizados testes unitários para as classes data_source, repository e model. No entanto, os testes para os arquivos bloc ainda não foram concluídos devido a uma compreensão limitada sobre o assunto. Estou ciente das práticas de utilização de mocktail e bloc_test para este propósito. 
Enquanto isso, algumas demandas urgentes surgiram, o que exigiu priorização dessas tarefas. Os testes dos widgets também ficarão pendentes, embora sejam relativamente simples, devido à pressão do tempo.


