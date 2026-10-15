-- Daily Tracker: database setup. Run once in Supabase -> SQL Editor.

create table if not exists public.tasks (
  id          uuid primary key default gen_random_uuid(),
  user_id     uuid not null default auth.uid() references auth.users(id) on delete cascade,
  name        text not null,
  position    integer not null default 0,
  archived    boolean not null default false,
  created_on  date not null default current_date,
  archived_on date
);

create table if not exists public.completions (
  task_id uuid not null references public.tasks(id) on delete cascade,
  day     date not null,
  user_id uuid not null default auth.uid() references auth.users(id) on delete cascade,
  primary key (task_id, day)
);

create table if not exists public.settings (
  user_id   uuid primary key default auth.uid() references auth.users(id) on delete cascade,
  threshold integer not null default 80 check (threshold between 50 and 100),
  grace_day boolean not null default true
);

create index if not exists completions_user_day_idx on public.completions (user_id, day);
create index if not exists tasks_user_idx on public.tasks (user_id);

-- Row-level security: every row is private to the user who owns it.
alter table public.tasks       enable row level security;
alter table public.completions enable row level security;
alter table public.settings    enable row level security;

drop policy if exists "own tasks"       on public.tasks;
drop policy if exists "own completions" on public.completions;
drop policy if exists "own settings"    on public.settings;

create policy "own tasks" on public.tasks
  for all to authenticated
  using ((select auth.uid()) = user_id)
  with check ((select auth.uid()) = user_id);

create policy "own completions" on public.completions
  for all to authenticated
  using ((select auth.uid()) = user_id)
  with check ((select auth.uid()) = user_id);

create policy "own settings" on public.settings
  for all to authenticated
  using ((select auth.uid()) = user_id)
  with check ((select auth.uid()) = user_id);

-- Only signed-in users may touch these tables; anonymous visitors get nothing.
grant select, insert, update, delete on public.tasks, public.completions, public.settings to authenticated;
revoke all on public.tasks, public.completions, public.settings from anon;
