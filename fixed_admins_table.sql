
-- Drop the existing admins table if needed
drop table if exists admins;

-- Create correct admins table structure
create table admins (
  id uuid primary key default uuid_generate_v4(),
  email text unique not null,
  name text,
  role text check (role in ('superadmin', 'teacher')) not null
);

-- Insert sample superadmin and teacher
insert into admins (email, name, role) values
('superadmin@example.com', 'Super Admin', 'superadmin'),
('teacher1@example.com', 'Mr. Sharma', 'teacher');
