# CONFERENTE PRO

Sistema de controle das tarefas de um único Centro de Distribuição (CD), com interface responsiva para celular e computador.

## O que foi incluído

- Painel com tarefas do dia, concluídas, em andamento e atrasadas.
- Cadastro, edição, conclusão, reabertura e exclusão de tarefas.
- Operações: Cross-docking; Transferências de estoque; Separação de materiais; Conferência de cargas; Carregamento e expedição.
- Atribuição de operador, data, horário, prioridade, código/referência e observações.
- Cronograma por dia, semana e mês.
- Cadastro de operadores, filtros por tipo/status/responsável e histórico de alterações.
- Exportação CSV de tarefas.
- Layout responsivo para iPhone e desktop.

## Importante: ativar o banco compartilhado

O site usa Supabase Auth + banco PostgreSQL para que os dados sejam iguais em dispositivos diferentes. Para proteger o acesso, **não use um projeto de outro sistema**: crie/seleciona um projeto Supabase dedicado ao CONFERENTE PRO.

1. No Supabase, abra o projeto dedicado e vá a **SQL Editor**.
2. Execute todo o arquivo [supabase-schema.sql](./supabase-schema.sql).
3. Em **Project Settings / API**, copie a Project URL e a chave pública **publishable** (ou anon legada). Nunca use `service_role`/secret key no navegador.
4. Abra o site e toque em **Conexão**. Cole a URL e a chave pública.
5. Crie a conta de acesso de cada integrante. Entre usando e-mail e senha.
6. Depois de criar as contas da equipe, desative o cadastro público de novos usuários nas configurações de Auth do Supabase, se não quiser que pessoas externas criem contas. A política de acesso do esquema permite que todos os usuários autenticados nesse projeto compartilhem o mesmo quadro.

## Publicação

O código fica em `conferente-pro/index.html`. Se o GitHub Pages estiver habilitado para o repositório, a página poderá ser publicada no caminho correspondente à pasta; a publicação precisa ser conferida nas configurações **Settings → Pages** do GitHub.

## Observações

- A conexão com um banco Supabase dedicado é necessária antes do uso multi-dispositivo. Não conecte a base do BV Lanches ou de outro sistema.
- A chave publicável pode aparecer no navegador; a proteção dos dados depende das políticas RLS do SQL e da autenticação. Nunca publique a chave secreta.
- Os relatórios são limitados às tarefas e sua exportação, conforme solicitado.
