## Problema: Two Sum (LeetCode)

### O que o problema pede

Dado um array de inteiros `nums` e um inteiro `target`, você precisa **encontrar os índices de dois números em `nums` cuja soma seja exatamente `target`**.  
As regras principais são:

- Você **não pode reutilizar o mesmo elemento duas vezes**.
- Sempre existe **exatamente uma solução válida**.
- A resposta deve ser retornada como uma lista/array com **dois índices**: `[indice1, indice2]`.

Exemplo:

- Entrada: `nums = [2, 7, 11, 15]`, `target = 9`  
- Saída: `[0, 1]`  
- Explicação: `nums[0] + nums[1] = 2 + 7 = 9`

---

## Passo a passo da solução implementada (`solucao.py`)

Nesta solução, a ideia é **percorrer a lista** e, para cada número, **verificar se existe outro número à frente que complete a soma** para chegar no `target`.

### 1. Entender a lógica principal

Para cada posição `i` do array:

1. Pegamos o valor atual: `nums[i]`.
2. Calculamos a diferença que falta para chegar no `target`:  
   \[
   diferenca = target - nums[i]
   \]
3. Verificamos se essa `diferenca` existe em alguma posição **após** `i` na lista.
4. Se existir, retornamos os dois índices:  
   - o índice atual `i`;
   - o índice onde a `diferenca` foi encontrada.

### 2. Explicando o código, passo a passo

No arquivo `solucao.py` temos, de forma simplificada, a seguinte lógica:

1. **Loop principal**:
   - Percorremos a lista com um `for`:
     - `for i in range(len(nums)):`  
       Aqui, `i` é o índice do elemento atual.

2. **Cálculo da diferença**:
   - `diferenca = target - nums[i]`  
     Isso responde à pergunta:  
     > "Quanto falta para o número atual chegar no valor `target`?"

3. **Busca da diferença no restante da lista**:
   - `if diferenca in nums[i+1:]:`  
     - `nums[i+1:]` pega apenas os elementos **à frente** do índice atual `i`.  
     - Verificamos se a `diferenca` está nessa sublista.

4. **Cálculo do índice do segundo número**:
   - `nums[i+1:].index(diferenca)` devolve o índice **relativo à sublista**.
   - Para transformar isso em índice do array original, somamos `i + 1`:
     - `indice_segundo = nums[i+1:].index(diferenca) + i + 1`

5. **Retorno do resultado**:
   - Assim que encontramos a combinação correta, retornamos:
     - `return [i, indice_segundo]`

Esse fluxo garante que:

- Nunca usamos o mesmo elemento duas vezes (pois buscamos só em `nums[i+1:]`).
- Assim que encontramos a primeira combinação válida, já encerramos a função.

### 3. Complexidade da solução atual

- **Tempo**:  
  - Para cada elemento, usamos o operador `in` e o método `index` em uma sublista, o que torna a solução, no pior caso, **\(O(n^2)\)**.
- **Memória**:
  - Usamos apenas variáveis simples, então a complexidade de espaço é **\(O(1)\)**.

---

## Alternativa mais eficiente (ideia para evolução)

Uma forma mais eficiente de resolver o mesmo problema é usando um **dicionário (hash map)**:

- Em vez de procurar a diferença em uma sublista (varrendo a lista várias vezes),
  nós:
  - Percorremos o array **apenas uma vez**;
  - Guardamos em um dicionário os valores já vistos e seus índices;
  - A cada novo número, verificamos se o seu "complemento" (`target - nums[i]`) já está guardado no dicionário.

Essa abordagem reduz a complexidade de tempo para **\(O(n)\)**, pois cada elemento é processado apenas uma vez e a busca no dicionário é, em média, \(O(1)\).

Mesmo assim, a solução atual do arquivo `solucao.py` já resolve corretamente o problema e é ótima para **entender a lógica passo a passo**, antes de partir para otimizações.


