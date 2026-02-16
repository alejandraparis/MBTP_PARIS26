@AbapCatalog.sqlViewName: 'ZV_CLNTS_LIBP'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Ventas'
@Metadata.ignorePropagatedAnnotations: true
define view ZC_CLNTS_LIB_AP as select from ztb_clnts_lib_ap
{
    key id_libro,
    count( distinct id_cliente ) as Ventas
}
group by id_libro
