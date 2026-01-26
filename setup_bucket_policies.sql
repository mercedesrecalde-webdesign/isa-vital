-- =============================================
-- POLICIES PARA BUCKET "isa-archivos"
-- Ejecutar en: Supabase Dashboard > SQL Editor
-- =============================================

-- 1. PERMITIR SUBIR ARCHIVOS (INSERT)
CREATE POLICY "Permitir subida pública" ON storage.objects
    FOR INSERT 
    WITH CHECK (bucket_id = 'isa-archivos');

-- 2. PERMITIR VER/DESCARGAR ARCHIVOS (SELECT)
CREATE POLICY "Permitir lectura pública" ON storage.objects
    FOR SELECT 
    USING (bucket_id = 'isa-archivos');

-- 3. PERMITIR ELIMINAR ARCHIVOS (DELETE)
CREATE POLICY "Permitir eliminación pública" ON storage.objects
    FOR DELETE 
    USING (bucket_id = 'isa-archivos');

-- =============================================
-- ALTERNATIVA: Configurar desde el Dashboard
-- =============================================
-- Si prefieres hacerlo manualmente:
-- 1. Ir a Storage > isa-archivos > Policies
-- 2. Crear policy "Allow public uploads" con INSERT
-- 3. Crear policy "Allow public downloads" con SELECT
-- =============================================
