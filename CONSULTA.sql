-- para ejecutaren base oracle esb_sap , kobatr.9140
    select max(a.fecha_trx) ULTIMA_TX_TRX, max(a.fecha_bct) ULTIMA_TX_BCT, max(b.cod_tienda) CODIGO, max(b.nombre_largo) NOMBRE, MAX(a.tienda_ncr) TIENDA,
    'https://'||max(b.direccion_ip)||':8443/WebFrontBase/~./core/login.zul' URL, sum(a.mnt_total_a_pagar) VENTA_SIN_REDONDEO,
    (sum(a.mnt_total_a_pagar)+sum(a.mnt_redondeo)) VENTA_REDONDEO
    from BCT_KOBA.trx_header a
    inner join FRONT.kobi_tiendas b on a.tienda_ncr = b.tienda_ncr
    where a.tienda_ncr in (select distinct tienda_ncr from trx_header)
    and a.tipo_trx in (1,2) 
    and TRUNC (fecha_trx) = '&FECHA'--dd/mm/aa
   --  and a.tienda_ncr = &tienda --(1125)
    and b.cod_tienda like '6A10%'
    group by a.tienda_ncr--SUBSTR(fecha_trx,1,8)
    ORDER BY 3;
    
    -- consulta
  
