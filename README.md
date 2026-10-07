# Gestão Pro — Pequenos Comércios

Sistema web responsivo para gestão de pequenos comércios.

## Módulos
- Dashboard e indicadores
- PDV / vendas
- Produtos e categorias
- Controle de estoque
- Clientes
- Fornecedores
- Financeiro e despesas
- Orçamentos
- Relatórios
- Usuários e perfis
- Configurações e backup

## Execução
A aplicação é estática: abra `index.html` ou publique o repositório pelo GitHub Pages.

## Arquitetura
A versão inicial usa uma camada de dados local em `localStorage`, isolada no objeto `db`. Isso permite substituir a persistência por uma API/Supabase futuramente sem refazer a interface.

## Próximas evoluções
- Login real e recuperação de senha
- Banco de dados multiempresa
- Permissões por módulo
- Sincronização em tempo real entre dispositivos
- Emissão de NFC-e/NF-e conforme integração fiscal
- Impressão de comprovantes
- Contas a pagar/receber completas
- Compras e fornecedores
- Auditoria de alterações
- PWA e notificações
