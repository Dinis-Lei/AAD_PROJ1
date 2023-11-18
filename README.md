### bit serial

|...| encoder | decoder|
|---|---|---|
clock cycles | 16 | 24|

bit serial: encoder.

parallel: decoder.




## CRC

Tendo uma string a(x) de 16 bits, por exemplo:

```
a(x) = 1010 0010 1011 1101

```   

E sabendo a formula da divisão:

```
a(x) × x^p = q(x) × b(x) + r (x)

```

Se utilizarmos um q(x) fixo e que é dado pela norma do CRC que usamos:

```
x8 + x7 + x5 + x2 + x + 1 <=> 1 1010 0111
```

Podemos usar o algoritmo da divisão para chegar ao valor do resto, r(x).
Se usar os valor de exemplo de a(x), acrescenta-se 8 bits com valor 0 a a(x) para garantir que se possa fazer a divisao.

```
    r(x) = 1010 0010 1011 1101 0000 0000 / 1 1010 0111 = 1111 1000
```

Agora no decoder, se somares os valores de r(x) a a(x)×x^p, quando voltares a dividir por q(x) à partida o resto será 0. Se tivesse ocurrido um erro na transmissão que desse flip a algum bit o resto seria diferente de 0.

Logo o output do decoder é só 1 bit a indicar se a string fornecida é divisivel pelo q(x).


$$

    rOut(a_n) =\\
    (a_0 \oplus a_0 \oplus a_0 \oplus a_0 \oplus a_0 \oplus a_0 \oplus a_0) \cdot x^7 + \\
    (a_0 \oplus a_0 \oplus a_0 \oplus a_0 \oplus a_0 \oplus a_0 \oplus a_0 \oplus a_0 \oplus a_0 \oplus a_0) \cdot x^6 + \\
    (a_0 \oplus a_0 \oplus a_0 \oplus a_0 \oplus a_0 \oplus a_0 \oplus a_0 \oplus a_0 \oplus a_0 \oplus a_0) \cdot x^5  + \\
    (a_0 \oplus a_0 \oplus a_0 \oplus a_0 \oplus a_0 \oplus a_0 \oplus a_0) \cdot x^4 + \\
    (a_0 \oplus a_0 \oplus a_0 \oplus a_0 \oplus a_0 \oplus a_0 \oplus a_0) \cdot x^3 + \\
    (a_0 \oplus a_0 \oplus a_0 \oplus a_0 \oplus a_0 \oplus a_0 \oplus a_0) \cdot x^2 + \\
    (a_0 \oplus a_0 \oplus a_0 \oplus a_0 \oplus a_0 \oplus a_0 \oplus a_0 \oplus a_0 \oplus a_0 \oplus a_0) \cdot x^1  + \\
    (a_0 \oplus a_0 \oplus a_0 \oplus a_0 \oplus a_0 \oplus a_0 \oplus a_0 \oplus a_0) \cdot x^0


$$