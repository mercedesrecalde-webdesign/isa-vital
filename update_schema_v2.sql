-- =============================================
-- ACTUALIZACIÓN DE ESQUEMA - ISA VITAL (ESTILO RECALDE CONNECT)
-- Ejecutar en: Supabase Dashboard > SQL Editor
-- =============================================

-- 1. ACTUALIZAR TABLA INSUMOS
-- Agregamos las columnas necesarias para el seguimiento detallado
ALTER TABLE insumos ADD COLUMN IF NOT EXISTS min INTEGER DEFAULT 0;
ALTER TABLE insumos ADD COLUMN IF NOT EXISTS casa INTEGER DEFAULT 0;
ALTER TABLE insumos ADD COLUMN IF NOT EXISTS anterior INTEGER DEFAULT 0;
ALTER TABLE insumos ADD COLUMN IF NOT EXISTS pedido INTEGER DEFAULT 0;
ALTER TABLE insumos ADD COLUMN IF NOT EXISTS recibido INTEGER DEFAULT 0;
-- Renombramos 'cantidad' a 'deposito' si es necesario, o creamos 'deposito'
ALTER TABLE insumos ADD COLUMN IF NOT EXISTS deposito INTEGER DEFAULT 0;

-- 2. ACTUALIZAR TABLA PEDIDOS
-- Agregamos espacio para subir formularios y recetas
ALTER TABLE pedidos ADD COLUMN IF NOT EXISTS receta_url TEXT;
ALTER TABLE pedidos ADD COLUMN IF NOT EXISTS formulario_url TEXT;

-- 3. ACTUALIZAR TABLA TURNOS (Asegurar formato de hora)
-- (Ya lo hicimos antes pero aseguramos consistencia)
ALTER TABLE turnos ADD COLUMN IF NOT EXISTS fecha DATE;
ALTER TABLE turnos ADD COLUMN IF NOT EXISTS hora TEXT; -- Formato HH:mm
