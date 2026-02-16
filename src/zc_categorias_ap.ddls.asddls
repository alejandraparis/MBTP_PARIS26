@AbapCatalog.sqlViewName: 'ZV_CATEGORIASP'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Categorias'
@Metadata.ignorePropagatedAnnotations: true
define view ZC_CATEGORIAS_AP as select from ztb_catego_ap
{
    key bi_categ as Categoria,
        descripcion as Descripcion
}
