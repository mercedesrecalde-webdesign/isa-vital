-- 1. CREAR BUCKET SI NO EXISTE (Requiere que la extensión storage esté activa)
INSERT INTO storage.buckets (id, name, public)
VALUES ('ISA_ARCHIVOS', 'ISA_ARCHIVOS', true)
ON CONFLICT (id) DO UPDATE SET public = true;

-- 2. PERMITIR SUBIDAS PÚBLICAS (ANÓNIMAS)
DROP POLICY IF EXISTS "permitir_subida_publica" ON storage.objects;
CREATE POLICY "permitir_subida_publica" ON storage.objects
FOR INSERT WITH CHECK (bucket_id = 'ISA_ARCHIVOS');

-- 3. PERMITIR LECTURA PÚBLICA (ANÓNIMA)
DROP POLICY IF EXISTS "permitir_lectura_publica" ON storage.objects;
CREATE POLICY "permitir_lectura_publica" ON storage.objects
FOR SELECT USING (bucket_id = 'ISA_ARCHIVOS');

-- 4. PERMITIR BORRADO (Opcional, por seguridad)
DROP POLICY IF EXISTS "permitir_borrado_publico" ON storage.objects;
CREATE POLICY "permitir_borrado_publico" ON storage.objects
FOR DELETE USING (bucket_id = 'ISA_ARCHIVOS');
