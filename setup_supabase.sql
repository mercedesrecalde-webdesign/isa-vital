-- =============================================
-- SCRIPT SQL PARA SUPABASE - ISA VITAL
-- Ejecutar en: Supabase Dashboard > SQL Editor
-- =============================================

-- 1. CREAR TABLA ANALISIS
CREATE TABLE IF NOT EXISTS analisis (
    id SERIAL PRIMARY KEY,
    nombre TEXT NOT NULL,
    fecha DATE NOT NULL,
    tipo TEXT DEFAULT 'laboratorio',
    archivo_url TEXT,
    notas TEXT,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- 2. HABILITAR RLS (Row Level Security) - Opcional pero recomendado
ALTER TABLE analisis ENABLE ROW LEVEL SECURITY;

-- 3. POLICY PARA PERMITIR LECTURA Y ESCRITURA PÚBLICA
-- (Para uso simple sin autenticación)
CREATE POLICY "Permitir lectura pública" ON analisis
    FOR SELECT USING (true);

CREATE POLICY "Permitir inserción pública" ON analisis
    FOR INSERT WITH CHECK (true);

CREATE POLICY "Permitir actualización pública" ON analisis
    FOR UPDATE USING (true);

CREATE POLICY "Permitir eliminación pública" ON analisis
    FOR DELETE USING (true);

-- =============================================
-- VERIFICAR TABLA TURNOS (si no existe o necesita campos nuevos)
-- =============================================

-- Si la tabla turnos no tiene los nuevos campos, ejecutar:
-- ALTER TABLE turnos ADD COLUMN IF NOT EXISTS fecha DATE;
-- ALTER TABLE turnos ADD COLUMN IF NOT EXISTS hora TEXT;
-- ALTER TABLE turnos ADD COLUMN IF NOT EXISTS lugar TEXT;
-- ALTER TABLE turnos ADD COLUMN IF NOT EXISTS notas TEXT;

-- =============================================
-- NOTA: Si la tabla turnos ya existe con estructura diferente,
-- puede que necesites adaptarla. Avisame si hay errores.
-- =============================================
