# Introdução 

A memória é um componente essencial de um computador. É nela que os dados e instruções são armazenados.

A performance de um computador depende da: **performance do processador** e **performance da memória**.

## Hierarquia de Memória

A memória é organizada em uma hierarquia de memória, onde cada nível é caracterizado por um tempo de acesso, capacidade e custo por bit.
Quanto mais próximo do processador, mais rápido e caro é o nível de memória.

|Tecnologia|Tempo de Acesso (ns)|
|:--------:|:------------------:|
|SRAM (Cache)| 0,2 - 3|
|DRAM (Memória Principal)| 10 - 50|
|SSD (Disco)| 20.000|
|HDD ("Memória Virtual")| 5.000.000|

## Localidade

**Localidade Temporal:** Se um item é referenciado, é provável que ele seja referenciado novamente em um futuro próximo.

**Localidade Espacial:** Se um item é referenciado, é provável que itens próximos a ele sejam referenciados em um futuro próximo.

# Performance de Memória

**Hit:** Quando o dado/instrução está no nível de memória que está sendo acessado (Hierarquia).

**Miss:** Quando o dado/instrução não foi encontrado, precisa ir para o próximo nível.

#### Taxa de Hit
```
Hit Rate = (Número de Hits)/(Número de Acessos)
         = 1 - Miss Rate
```

#### Taxa de Miss
```
Miss Rate = (Número de Misses)/(Número de Acessos)
          = 1 - Hit Rate
```

#### Tempo de Acesso (AMAT)
```
AMAT = Tcache + MRcache * [Tmm + MRmm * Tvm]
```

## Lei de Amdahl

O esforço gasto aumentando a performance de um subsistema é desperdiçado, a menos que o subsistema afete em larga porcentagem a performance do sistema no geral.

# Cache

A cache é uma memória de alta velocidade que armazena uma cópia dos dados/instruções que estão na memória principal.