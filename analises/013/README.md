# Análise de Viagens a Serviço – Portal da Transparência

**autor**: Wellington M Santos - Cientista de Dados

**contato**: [linkedin/in/wellington-moreira-santos](https://www.linkedin.com/in/wellington-moreira-santos/)

## 1. Contexto e Entendimento do Negócio

Este projeto realiza uma análise exploratória dos dados de viagens custeadas pela Administração Pública Federal, disponíveis no [Portal da Transparência](https://portaldatransparencia.gov.br/viagens/visao-geral).

O objetivo é entender **como os recursos públicos são utilizados em deslocamentos oficiais**, respondendo perguntas como:

* Quais órgãos concentram maiores despesas?
* Quais cargos tem maiores despesas médias?
* Quais destinos mais demandam verba?
* Há padrões sazonais ou comportamentais nas viagens?

Os dados analisados contêm informações sobre:

* Órgão superior e órgão solicitante
* Situação e urgência da viagem
* Identificação do viajante
* Valores gastos (diárias, passagens e despesas adicionais)
* Datas e destinos

---

## 2. Metodologia

1. **Coleta** – Dados carregados a partir de arquivo CSV obtido do Portal da Transparência.
2. **Limpeza** – Padronização de colunas, remoção de valores inconsistentes e conversão de tipos.
3. **Análise Exploratória** – Distribuições, rankings e segmentações.
4. **Visualização** – Gráficos com `Matplotlib` e `Seaborn` para facilitar interpretação.

---

## 3. Principais Insights

* **Órgãos com maiores despesas**: Identificou-se concentração significativa dos gastos em poucos órgãos, como Ministério da Educação, Ministério da Defesa e Ministério da Justiça e Segurança Pública, porém mais de R$ 700 Milhões não estão identificados e lideram as despesas.
* **Polícias Federais**: Se somarmos as despesas da Polícia Federal com as da Polícia Rodoviária Federal temos o total impressionante de R$ 357 Milhões. Mostrando o impacto dessas instituições no orçamento.
* **Perfil do viajante**: Predominância de servidores vinculados sem identificação, mas também há despesas relevantes tanto para Presidência da República, viagens à China do Ministério de Agricultura e Pecuária e Polícia Federal.
* **Padrões temporais**: Maior volume de viagens concentrado em determinados períodos do ano, possivelmente atrelado a eventos oficiais e compromissos institucionais. Destaque para Janeiro e Novembro.
* **Destinos mais custosos**: Os dados estão protegidos por sigilo.
* **Cargos relevantes**: Cargos não identificados ou protegidos por sigilo lideram em despesas, são seguidos por profissionais como: Professores, Técnicos de seguro social, analista ambiental e mais.

---

## 4. Possíveis Aplicações

* **Controle de gastos públicos** – Facilitar auditoria e acompanhamento por órgãos de controle.
* **Planejamento orçamentário** – Apoiar previsões de despesas anuais com deslocamentos.
* **Políticas de economia** – Identificar oportunidades para reduzir custos com viagens.
