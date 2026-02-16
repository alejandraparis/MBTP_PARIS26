@AbapCatalog.sqlViewName: 'ZV_BRANDSP'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Brands'
@Metadata.ignorePropagatedAnnotations: true
define view ZB_BRANDS_AP
  as select from zrent_brands_ap
{
  key marca as Marca,
      url   as Imagen
}
