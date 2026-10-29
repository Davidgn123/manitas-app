-- =====================================================
-- Manitas: Esquema de base de datos (Supabase / PostgreSQL)
-- =====================================================

-- 1. Categorías de servicio
create table if not exists categories (
  id serial primary key,
  name text not null unique
);

insert into categories (name) values
  ('Plomería'), ('Electricidad'), ('Carpintería'), ('Soldadura'), ('Pintura')
on conflict (name) do nothing;

-- 2. Perfil de cada usuario (cliente o técnico)
create table if not exists profiles (
  id uuid primary key references auth.users(id) on delete cascade,
  full_name text not null,
  phone text,
  role text not null check (role in ('client', 'technician')),
  avatar_url text,
  created_at timestamptz default now()
);

-- 3. Datos extra de los técnicos
create table if not exists technician_profiles (
  id uuid primary key references profiles(id) on delete cascade,
  bio text,
  coverage_radius_km int default 10 check (coverage_radius_km > 0),
  latitude numeric(9,6),
  longitude numeric(9,6)
);

-- 4. Especialidades del técnico (relación muchos a muchos)
create table if not exists technician_categories (
  technician_id uuid references technician_profiles(id) on delete cascade,
  category_id int references categories(id),
  primary key (technician_id, category_id)
);

-- 5. Solicitudes de servicio
create table if not exists service_requests (
  id uuid primary key default gen_random_uuid(),
  client_id uuid not null references profiles(id),
  technician_id uuid not null references technician_profiles(id),
  category_id int not null references categories(id),
  description text not null,
  address text not null,
  status text not null default 'pending'
    check (status in ('pending', 'quoted', 'accepted', 'completed', 'cancelled')),
  created_at timestamptz default now()
);

-- 6. Fotos de la solicitud (máximo 5, se validará en la app)
create table if not exists request_images (
  id uuid primary key default gen_random_uuid(),
  request_id uuid not null references service_requests(id) on delete cascade,
  image_url text not null
);

-- 7. Ofertas de precio
create table if not exists offers (
  id uuid primary key default gen_random_uuid(),
  request_id uuid not null references service_requests(id) on delete cascade,
  price int not null check (price > 0),
  status text not null default 'pending'
    check (status in ('pending', 'accepted', 'rejected')),
  created_at timestamptz default now()
);

-- 8. Mensajes del chat
create table if not exists messages (
  id uuid primary key default gen_random_uuid(),
  request_id uuid not null references service_requests(id) on delete cascade,
  sender_id uuid not null references profiles(id),
  content text not null,
  created_at timestamptz default now()
);

-- 9. Calificaciones (una sola por servicio)
create table if not exists reviews (
  id uuid primary key default gen_random_uuid(),
  request_id uuid not null unique references service_requests(id),
  rating int not null check (rating between 1 and 5),
  comment text check (char_length(comment) <= 500),
  tags text[],
  created_at timestamptz default now()
);

-- =====================================================
-- Seguridad: Row Level Security
-- =====================================================
alter table categories enable row level security;
alter table profiles enable row level security;
alter table technician_profiles enable row level security;
alter table technician_categories enable row level security;
alter table service_requests enable row level security;
alter table request_images enable row level security;
alter table offers enable row level security;
alter table messages enable row level security;
alter table reviews enable row level security;

-- =====================================================
-- Políticas
-- =====================================================
drop policy if exists "Cualquiera puede ver las categorías" on categories;
create policy "Cualquiera puede ver las categorías"
on categories
for select
using (true);