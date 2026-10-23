-- CONFERENTE PRO — execute no SQL Editor do projeto Supabase dedicado a este sistema.
-- Acesso compartilhado: usuários autenticados no mesmo projeto acessam o mesmo quadro.
create extension if not exists pgcrypto;

create table if not exists public.cp_operators (
  id uuid primary key default gen_random_uuid(),
  name text not null unique,
  created_by uuid references auth.users(id) on delete set null,
  created_at timestamptz not null default now()
);

create table if not exists public.cp_tasks (
  id uuid primary key default gen_random_uuid(),
  title text not null,
  type text not null check (type in (
    'Cross-docking',
    'Transferências de estoque',
    'Separação de materiais',
    'Conferência de cargas',
    'Carregamento e expedição'
  )),
  code text,
  date date not null,
  time time,
  operator text,
  priority text not null default 'Normal' check (priority in ('Baixa','Normal','Alta','Urgente')),
  status text not null default 'A fazer' check (status in ('A fazer','Em andamento','Aguardando','Concluído','Cancelado')),
  notes text,
  created_by uuid references auth.users(id) on delete set null,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  completed_at timestamptz
);

create table if not exists public.cp_history (
  id uuid primary key default gen_random_uuid(),
  action text not null,
  task_title text,
  task_type text,
  operator_name text,
  detail text,
  created_at timestamptz not null default now()
);

alter table public.cp_operators enable row level security;
alter table public.cp_tasks enable row level security;
alter table public.cp_history enable row level security;

drop policy if exists "cp_operators_shared_authenticated" on public.cp_operators;
create policy "cp_operators_shared_authenticated" on public.cp_operators
for all to authenticated using (true) with check (true);

drop policy if exists "cp_tasks_shared_authenticated" on public.cp_tasks;
create policy "cp_tasks_shared_authenticated" on public.cp_tasks
for all to authenticated using (true) with check (true);

drop policy if exists "cp_history_shared_authenticated" on public.cp_history;
create policy "cp_history_shared_authenticated" on public.cp_history
for all to authenticated using (true) with check (true);

grant select, insert, update, delete on public.cp_operators to authenticated;
grant select, insert, update, delete on public.cp_tasks to authenticated;
grant select, insert, update, delete on public.cp_history to authenticated;


-- Atualização do fluxo de etapas: execute também em bancos já existentes.
alter table public.cp_tasks drop constraint if exists cp_tasks_status_check;
alter table public.cp_tasks alter column status set default 'Aguardando';
update public.cp_tasks set status = case status
  when 'A fazer' then 'Aguardando'
  when 'Em andamento' then 'Iniciado'
  when 'Concluído' then 'Finalizado'
  when 'Cancelado' then 'Aguardando'
  else status
end;
alter table public.cp_tasks add constraint cp_tasks_status_check
  check (status in ('Aguardando','Iniciado','Finalizado','Expedido'));
