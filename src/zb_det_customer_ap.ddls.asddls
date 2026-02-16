@AbapCatalog.sqlViewName: 'ZV_DET_CUSTP'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Details customer'
@Metadata.allowExtensions: true
define view ZB_DET_CUSTOMER_AP
  as select from zrent_custome_ap
{
  key doc_id    as ID,
      matricula as Matricula,
      nombres   as Nombre,
      apellidos as Apellidos,
      email     as Correo,
      cntr_type as TipoContrato
}
