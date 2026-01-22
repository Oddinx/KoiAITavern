# Despliegue en Render

## Ventajas de Render vs Vercel

✅ Almacenamiento persistente  
✅ Mejor para aplicaciones stateful  
✅ Sin límite de timeout (con plan de pago)  
✅ Soporte para volúmenes de datos

## Pasos para desplegar en Render

### 1. Crear repositorio en GitHub

```bash
git remote set-url origin https://github.com/Oddinx/KoiAITavern.git
git push -u origin main
```

### 2. Ir a Render.com

- Ve a https://render.com
- Crea una cuenta si no tienes
- Conecta tu cuenta de GitHub

### 3. Crear nuevo servicio Web

1. Click en "New" → "Web Service"
2. Selecciona tu repositorio `Oddinx/KoiAITavern`
3. Configura:
   - **Name**: koitavern
   - **Environment**: Node
   - **Region**: Oregon (o tu preferida)
   - **Plan**: Starter (o superior si necesitas)
   - **Build Command**: `npm install`
   - **Start Command**: `npm start`

### 4. Variables de entorno

En "Environment", agrega:

```
NODE_ENV=production
PORT=10000
DATA_ROOT=/var/data
```

### 5. Volúmenes (Almacenamiento)

En "Disks", crea:

- **Path**: `/var/data`
- **Name**: `data`
- **Size**: 0.5 GB (mínimo)

### 6. Desplegar

Haz push a `main` y Render desplegará automáticamente

```bash
git add .
git commit -m "Setup for Render deployment"
git push
```

## URLs después del despliegue

Tu aplicación estará disponible en:

```
https://koitavern.onrender.com
```

## Monitoreo

- Dashboard: https://dashboard.render.com
- Logs en tiempo real en el dashboard
- Auto-redeploy con cada push a `main`

## Limpieza

Para eliminar el servicio:

1. Ve a tu servicio en Render
2. Settings → Delete Service

## Solución de problemas

**Error: "Build failed"**

- Verifica que `npm install` funcione localmente
- Comprueba que todas las dependencias estén en `package.json`

**Error: "Out of memory"**

- Usa plan Standard o superior

**Datos se pierden**

- Asegúrate que el volumen esté configurado en `/var/data`
- Verifica que `DATA_ROOT=/var/data` esté en variables de entorno
