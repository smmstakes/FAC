# Introdução

## Definição

São caminhos compartilhados por vários dispositivos, que permitem a comunicação entre eles.

São as vias que trafegam dados, sinais de controle e instruções que são trocados entre os diferentes módulos de um computador.

>**NOTA:** A interligação do computador a um dispositivo externo é feita através de um barramento, chamado de **portas**.


# Barramentos

Lembra uma CPU:
- **Potência:** provê a energia necessária para o funcionamento dos dispositivos.
- **Endereços:** Carrega as informações sobre a localização dos dados e instruções.
- **Controle:** Indica qual dispositivo tem autorização para usar o barramento e com qual finalidade.
- **Dados:** Carrega as informações que serão processadas. 


## Tipos

- **Processador-Memória (Barramento Interno):** É o barramento que interliga a CPU à memória principal. É o mais rápido de todos. São curtos, extremamente velozes e de alta capacidade de transmissão de dados entre a CPU e a memória.

- **E/S (I/O):** Mais longos e permite a comunicação ente diferentes tipos de dispositivos com *largura de bandas diferentes.*

- **Barramento Backplane (Barramento Compartilhado):** Geralmente construído no chassis da máquina e conecta a CPU, os dispositivos de I/O e a memória.

### Forma de Transmissão

- **Serial:** Conjunto reduzido de linhas físicas através do qual os dados a serem transmitidos são enviados um bit por vez. É mais lento, mas mais barato e mais simples de implementar.

- **Paralelo:** Possui várias linhas dispostas paralelamente de forma que é possível encaminhar mais de 1 bit por vez (Geralmente: 1 *byte* ou *palavra* por vez). É mais rápido, mas mais caro e mais complexo de implementar.


## Largura de Barramento

Para tentar aumenta a **largura de banda** do barramento temos:

1. Diminuir o período de relógio do barramento, ou seja, **mais transferências por segundo**.
2. Aumentar a **largura do barramento**, ou seja, **mais bits por transferência**.
   
>**NOTA:** Em algumas tecnologias há o barramento multiplexado, onde ora trafega endereço, ora trafega dados.

>**IMPORTANTE:** Essas buscas por melhorias podem causar problemas de retrocompatibilidade e compatibilidade entre dispositivos.


## Controle

As arquiteturas mais recentes permitem que haja a troca de papéis (Emissor e Receptor) entre os dispositiveos a depender das transações. Há dois esquemas para controle de barramento no cenário em que mais de um dispositivo pode ser o emissor:

1. Centralizado
2. Descentralizado

### Centralizado (Daisy Chain?)

Há um dispositivo central que controla o acesso ao barramento. Esse dispositivo é chamado de **Controlador de Barramento** ou **Controlador de Memória**. Pode ser embutido na CPU ou ser um dispositivo separado.

Há apenas uma linha para realizar os pedidos de controle do barramento, *mútiplos pedidos podem se sobrepor, ou então há pedidos ou não*.

Concede o controle por uma linha serial, o sinal passa por uma ordem de dispositivos e aquele que não demandou o controle passa o sinal de autorização adiante.

### Descentralizado 

Nesse modelo os dispositivos devem monitorar as linhas e pedidos, controlando o barramento apenas quando julgarem ser necessário.


## Periféricos e Controladores de I/O

Para cada tipo de periférico há um controlador específico. O controlador de I/O é um dispositivo que se comunica com o barramento e com o periférico.

