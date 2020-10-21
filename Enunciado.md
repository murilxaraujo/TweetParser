# Processando *tweets*:

O seguinte arquivo `tweets.jsonl`,  contém os *tweets* extraídos publicados pelo mundo às 6:29 no dia 14 de maio de 2019.  Cada linha do documento é trecho `json ` com o conteúdo semelhante a seguir:

```json
{'created_at': 'Tue May 14 06:29:57 +0000 2019',
 'entities': {'hashtags': [{'indices': [20, 25], 'text': 'TRAD'}],
  'symbols': [],
  'urls': [],
  'user_mentions': [{'id': 963996555412955136,
    'id_str': '963996555412955136',
    'indices': [3, 18],
    'name': 'Kim Taehyung Brasil',
    'screen_name': 'TaehyungBrasiI'}]},
 'lang': 'pt',
 'source': '<a href="http://twitter.com/download/iphone" rel="nofollow">Twitter for iPhone</a>',
 'text': 'RT @TaehyungBrasiI: #TRAD | O Elite Daily reuniu citações do BTS sobre o Taehyung que mostram o  quanto os membros o valorizam e respeitam…',
  'utc_offset': None,
  'verified': False}}
```

Utilize a linguagem de programação de sua preferência (e quaisquer bibliotecas que sejam necessárias) e escreva um programa que leia o nome de um arquivo JSONL como parâmetro – que seguirá os mesmos moldes do arquivo `tweets.jsonl` listado acima – e imprima as informações solicitadas a seguir, baseado no conteúdo do arquivo lido.

## Condições

Em *todos* os casos abaixo, assuma:

- Os valores decimais são **arrendondados** em duas casas decimais.
- Os valores percentuais são representados como variando entre 0 e 100 e são **arrendondados** em duas casas decimais. Por exemplo, 0.04069 será representado como 4.01. 
- As *hashtags* são impressas sem a cerquilha ''#''.

### 1. Em qual idioma foram postados mais e menos *tweets*? Qual o percentual dos *tweets*?

Imprimir os idiomas com mais e menos *tweets* e calcular os respectivos percentuais, bem como o percentual médio de tweets por língua. Em caso de empate (mais de um idioma nas posições de mais ou menos *tweets*), imprimir todos os idiomas nessas posições que tem a mesmo percentual de *tweets*.

Formato (mais)

```
tweets_max|<código do idioma>|<percentual de tweets>
```

Formato (menos)

```
tweets_min|<código do idioma>|<percentual de tweets>
```

Formato (média)

```
tweets_media|<percentual de tweets>
```

Exemplo:

```
tweets_max|fr|30.00
tweets_min|fi|0.05
tweets_min|sr|0.05
tweets_media|10.23
```

### 2. Quais foram as três *hashtags* mais populares?

Considerando todos os *tweets*, imprimir as três hashtags mais populares. Fazer a comparação considerando maiúsculos e minúsculos.

Formato:

```
hashtags_primeiro|<hashtag>
hashtags_segundo|<hashtag>
hashtags_terceiro|<hashtag>
```

Exemplo:

```
hashtags_primeiro|VAMOSTODOSACERTARESSEDESAFIO
hashtags_segundo|AFF
hashtags_terceiro|VAIDARCERTO
```

### 

### 3. Qual o percentual e a quantidade de *tweets* está em inglês, espanhol, francês ou português e possui pelo menos uma *hashtag*?

Calcular e imprimir o percentual e a quantidade de *tweets*, em relação ao total de *tweets*, que possui inglês, espanhol, francês ou português e possui pelo menos uma *hashtag*.

Formato

```
tweets_selecionados|<percentual>|<quantidade>
```

Exemplo:

```
tweets_selecionados|8.29|100
```

### 4. Qual é a maior e a menor *hashtag* em todos os tweets detectados como inglês, espanhol, francês ou português? Qual idioma e o tamanho dessa hashtag?

Calcular a imprimir as áreas com o maior e menor número de funcionários. Em caso de empate (mais de uma área com o mesmo número máximo ou mínimo de funcionários), todas as áreas dentro daquele critério devem ser impressas.

Formato:

```
hashtag_maior|<hashtag>|<idioma>|<tamanho>
hashtag_menor|<hashtag>|<idioma>|<tamanho>
```

Exemplos:

```
hashtag_maior|VAMOSTODOSACERTARESSEDESAFIO||29
hashtag_menor|AFF||3
```

### Exemplo de saída esperada para o arquivo `tweets.jsonl` dado acima como exemplo:

```
tweets_max|fr|30.00
tweets_min|fi|0.05
tweets_min|sr|0.05
tweets_media|10.23
hashtags_primeiro|VAMOSTODOSACERTARESSEDESAFIO
hashtags_segundo|AFF
hashtags_terceiro|VAIDARCERTO
tweets_selecionados|8.29|100
hashtag_maior|VAMOSTODOSACERTARESSEDESAFIO||29
hashtag_menor|AFF||3
```

