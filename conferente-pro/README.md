# CONFERENTE PRO

Primeira versão do sistema de tarefas para conferência e expedição de um único CD.

## Recursos
- Painel com tarefas de hoje, concluídas, em andamento e atrasadas.
- Cadastro de tarefas: cross-docking, transferências de estoque, separação, conferência de cargas, carregamento e expedição.
- Data, horário, código/referência, prioridade, operador, status e observações.
- Cronograma diário, semanal e mensal.
- Cadastro de operadores e visão das tarefas atribuídas.
- Histórico de alterações e conclusão.
- Layout responsivo para celular e computador.

## Abrir
Arquivo principal: `index.html`.

## Importante: dados compartilhados
Esta versão inicial guarda os dados no armazenamento local do navegador. Portanto, os dados não são sincronizados automaticamente entre celulares e computadores diferentes. Para acesso compartilhado real, é necessário conectar um banco de dados online (por exemplo, Supabase) e configurar autenticação/permissões. Não inserir dados confidenciais até essa integração estar pronta.

## Publicação
A página web ficará disponível quando o GitHub Pages estiver habilitado para o repositório. Como este aplicativo está em `conferente-pro/index.html`, a URL de publicação será a página do repositório seguida de `/conferente-pro/`, se o Pages estiver configurado para a branch `main` e a pasta raiz.
