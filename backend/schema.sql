
create extension if not exists "uuid-ossp";

create table teachers (
  id uuid primary key default uuid_generate_v4(),
  email text unique not null,
  name text
);

create table students (
  id uuid primary key default uuid_generate_v4(),
  roll_no varchar(20) unique not null,
  name varchar(100) not null,
  class varchar(10) not null,
  dob date not null,
  created_at timestamp default now()
);

create table subjects (
  id uuid primary key default uuid_generate_v4(),
  name varchar(50) not null,
  code varchar(10) unique not null
);

create table results (
  id uuid primary key default uuid_generate_v4(),
  student_id uuid references students(id) on delete cascade,
  subject_id uuid references subjects(id) on delete cascade,
  marks integer check (marks >= 0 and marks <= 100),
  exam_term varchar(20),
  year integer
);
