-- 1. ASEGURAR TABLA MÉDICOS
CREATE TABLE IF NOT EXISTS medicos (
    id SERIAL PRIMARY KEY,
    nombre TEXT NOT NULL,
    apellido TEXT,
    especialidad TEXT,
    telefono TEXT,
    email TEXT,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- 2. HABILITAR RLS Y PERMISOS TOTALES EN TABLAS
ALTER TABLE medicos ENABLE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "permitir_todo_medicos" ON medicos;
CREATE POLICY "permitir_todo_medicos" ON medicos FOR ALL USING (true) WITH CHECK (true);

-- 3. CONFIGURACIÓN DE ALMACENAMIENTO (STORAGE)
-- Asegurar que el bucket ISA_ARCHIVOS exista y sea público
INSERT INTO storage.buckets (id, name, public)
VALUES ('ISA_ARCHIVOS', 'ISA_ARCHIVOS', true)
ON CONFLICT (id) DO UPDATE SET public = true;

-- Políticas para que cualquier persona pueda subir, ver y borrar archivos en ese bucket
DROP POLICY IF EXISTS "subida_publica" ON storage.objects;
CREATE POLICY "subida_publica" ON storage.objects FOR INSERT WITH CHECK (bucket_id = 'ISA_ARCHIVOS');

DROP POLICY IF EXISTS "lectura_publica" ON storage.objects;
CREATE POLICY "lectura_publica" ON storage.objects FOR SELECT USING (bucket_id = 'ISA_ARCHIVOS');

DROP POLICY IF EXISTS "borrado_publico" ON storage.objects;
CREATE POLICY "borrado_publico" ON storage.objects FOR DELETE USING (bucket_id = 'ISA_ARCHIVOS');
