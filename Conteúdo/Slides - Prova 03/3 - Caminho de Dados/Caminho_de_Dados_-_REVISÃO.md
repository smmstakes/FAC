# Introdução 

## Microarquitetura

Há multiplas implementações de uma única arquitetura: 
- **Single Cycle:** Cada instrução é executada em um único ciclo de clock
- **Multi Cycle:** Cada instrução é quebrada em séries de pequenos passos, cada um executado em um ciclo de clock
- **Pipeline:** Cada instrução é quebrada em séries de pequenos passos, cada um executado em um ciclo de clock, porém, cada passo é executado por um componente diferente

# Single Cycle

- Simples
- O tempo de ciclo é limitado pela instrução mais lenta (**lw**)
- Memórias de instrução e dados **separadas**
- **Não** é possível executar mais de uma instrução por ciclo
- 3 *somadores/ULAs*
  
# Multi Cycle

- Memória de instrução e dados **unificadas**
- Instruções mais simples tomam menos ciclos/passos
- Pode reutilizar o hardware
- Tempo de ciclo mais rápido
- Velocidade de clock mais elevada
  
# Pipeline

- Paralelismo temporal
- Divide o *Single Cycle* em passos menores:
  - Fetch: Busca a instrução
  - Decode: Decodifica a instrução
  - Execute: Executa a instrução
  - Memory: Acessa a memória
  - Writeback: Escreve o resultado
- Adiciona registradores entre os passos

## Hazards

- **Data:** Quando uma instrução depende do resultado de outra que ainda não foi escrita (o valor do registrador ainda não foi atualizado)
- **Control:** Quando uma instrução depende de uma instrução anterior que altera o fluxo de controle (branch, jump, etc)

## Data Hazards

Para controlar os *data hazards*, podemos:

- Inserir **nop** (no operation) entre as instruções
  - Insere até o resultado estar pronto para ser usado
- Reordenar as instruções
- Encaminhar o resultado para a próxima instrução
  - *Forwarding*
  - Checa se o registrador fonte do *Estágio de Execução* combinam com o registrador destino da instrução na *Memória ou Writeback*. Se sim, usa o valor do registrador destino da *Memória ou Writeback*.
- **Stall** no processador
  - Se o registrador fonte no *Estágio de Decodificação* for o mesmo que o registrador destino no *Estágio de Execução* **e** a instrução no *Estágio de Execução* é um **lw**. Realiza **Stall os estágios de Busca e Decodificação e faz um FLUSH no estágio de Execução**.

