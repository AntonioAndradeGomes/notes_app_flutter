<h2 align = 'center'>Notes app<h2>
<br>
<h2 align  =  "center"> Tópicos 📝 </h2>

- [Visão Geral](#visão-geral)
- [Dependências](#dependências)
- [Como Usar](#como-usar)
- [Capturas de Tela](#capturas-de-tela)

<br>
<div id = 'esp'>

##  Visão Geral
É um simples aplicativo de notas feito em [Flutter](https://flutter.dev/), similar ao Keep feito pela Google.
Para armazenamento das notas é usado o Sqlite como banco de dados do aplicativo. 
Foi usado na codificação o Mobx como gerenciador de estado da aplicação. 
</div>

<br>

<div id = 'dependências'>

## Dependências

* [Flutter Staggered Grid View](https://pub.dev/packages/flutter_staggered_grid_view)
* [Auto Size Text](https://pub.dev/packages/auto_size_text)
* [Sqflite](https://pub.dev/packages/sqflite)
* [Path](https://pub.dev/packages/path)
* [Shared Preferences](https://pub.dev/packages/shared_preferences)
* [Flutter Mobx](https://pub.dev/packages/flutter_mobx)
* [Mobx](https://pub.dev/packages/mobx)
* [Intl](https://pub.dev/packages/intl)
* [Build Runner](https://pub.dev/packages/build_runner)
* [Mobx Codegen](https://pub.dev/packages/mobx_codegen)
  
<div>
<br>

<div id = 'como-usar'>

## Como Usar

    `` `
    Primeiramente, configure corretamente o ambiente de desenvolvimento Flutter em sua máquina, consulte https://flutter.dev/docs/get-started/install

    - Clone este repositório
    $ git clone https://github.com/AntonioAndradeGomes/notes_app_flutter

    - Entre no diretório
    $ cd notes_app_flutter

    - Instale as dependências
    $ flutter pub get

    - Execute o gerador de código mobx
    $ flutter pub run build_runner watch

    - Após o gerador de código aprensentar que a tarefa teve sucesso; pare o gerador e execute o aplicativo
    $ flutter run
    `` `
</div>

<div id = 'capturas-de-tela'>

## Capturas de Tela

<table>
    <tr>
        <td><img src="docs/img/1.jpg"></td>
        <td><img src="docs/img/2.jpg"></td>
        <td><img src="docs/img/3.jpg"></td>
        <td><img src="docs/img/4.jpg"></td>
    </tr>
    <tr>
        <td><img src="docs/img/5.jpg"></td>
        <td><img src="docs/img/6.jpg"></td>
        <td><img src="docs/img/7.jpg"></td>
        <td><img src="docs/img/8.jpg"></td>
    </tr>
    <tr>
        <td><img src="docs/img/9.jpg"></td>
    </tr>
</table>

</div>