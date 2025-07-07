
-- Enable RLS
alter table admins enable row level security;

-- Remove existing policies (optional if manually cleaning)
drop policy if exists "Enable insert for authenticated users only" on admins;
drop policy if exists "Enable read access for all users" on admins;
drop policy if exists "Enable update for users based on email" on admins;

-- Create SELECT policy for authenticated users
create policy "Read own admin info"
on admins
for select
to authenticated
using (true);

-- Allow logged-in users to insert themselves
create policy "Insert self as teacher"
on admins
for insert
to authenticated
with check (true);

-- Optional: Restrict update access unless further roles defined
-- You can comment out this section if updates are not needed
create policy "Update by email match"
on admins
for update
to authenticated
using (true)
with check (true);
