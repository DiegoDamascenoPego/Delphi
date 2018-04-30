<div style="text-align:center" markdown="1">

![TSTRINGGRIDOBJECT](Package_Grid.png) 
</div>

# TStringGridObject 

Componente para **mostrar**  e **manipular** uma lista de objetos.

Em projetos RAD onde não são utilizados os componentes **DATAWARE** existe a dificuldade de exibir e manipular uma lista de objetos.

O componente é baseado no **TSTRINGRID** porém foram criado os seguintes recursos:

* **Customizar Colunas em Design Time**
>Proporciona ao programador em tempo Design  a capacidade de customizar os campos da grid,
reduzindo o tempo de customização das informação.

* **Interagir com objeto**
>OS eventos disponibilizados na GRID oferecem os seguintes recursos:
>* **UpdateGrid**: É o evento principal responsável por receber um objeto do tipo **TObjectList**
e preencher as informações na células da **GRID**.
>* **TBeginEditEvent**: É o evento que define se a informação pode ser alterada
>* **TValidateEditEvent**: É o evento que aplica uma determina validação antes de permitir que o objeto seja alterado.
>* **TEditEvent**: É o Evento que pode ser utilizado durante a alteração do objeto
>* **TEndEditEvent**: É o evento disparado quando a alteração do objeto foi finalizada

<div style="text-align:center" markdown="1">

![TSTRINGGRIDOBJECT](Package_CEP.png) 
</div>

# TEDITCEP 
