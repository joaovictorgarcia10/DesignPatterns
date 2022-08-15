# Builder

## O Designer Pattern Builder
<br>

O Builder é um  Padrão de Projeto Criacional que permite a você construir objetos complexos passo a passo. O padrão permite que você produza diferentes tipos e representações de um objeto usando o mesmo código de construção.

<br>

## Problema
<br>

Imagine um objeto complexo que necessite de uma inicialização passo a passo trabalhosa de muitos campos e objetos agrupados. Tal código de inicialização fica geralmente enterrado dentro de um construtor monstruoso com vários parâmetros. Ou pior: espalhado por todo o código cliente.

<br>

- Você pode tornar o programa muito complexo ao criar subclasses para cada possível configuração de um objeto.

<br>

 - Um construtor com vários parâmetros tem um lado ruim: nem todos os parâmetros são necessários todas as vezes.

<br>

## Solução
<br>

O padrão Builder sugere que você extraia o código de construção do objeto para fora de sua própria classe e mova ele para objetos separados chamados builders. “Builder” significa “construtor”, mas não usaremos essa palavra para evitar confusão com os construtores de classe.

<br>


- O padrão Builder permite que você construa objetos complexos passo a passo. O Builder não permite que outros objetos acessem o produto enquanto ele está sendo construído.



<br>


## Prós e contras
<br>

Prós                                                                 |    Contras
-------------------------------------------------------------------- | --------------------------------------------------------------------
Você pode construir objetos passo a passo, adiar as etapas de construção ou rodar etapas recursivamente. |     A complexidade geral do código aumenta uma vez que o padrão exige criar múltiplas classes novas.  
Você pode reutilizar o mesmo código de construção quando construindo várias representações de produtos.  |     .
Princípio de responsabilidade única. Você pode isolar um código de construção complexo da lógica de negócio do produto. | .  
<br>


## Fonte
https://refactoring.guru/pt-br/design-patterns/builder