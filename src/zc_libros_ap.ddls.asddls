@AbapCatalog.sqlViewName: 'ZV_LIBROSP'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Libros'
@Search.searchable: true
@Metadata.allowExtensions: true
@UI.headerInfo: {
  typeName: 'Libro',
  typeNamePlural: 'Libros',
  title : { type :#STANDARD,
         value: 'Titulo' },
  description : { type :#STANDARD,
                value: 'Titulo' },
 imageUrl : 'Imagen'
}
define view ZC_LIBROS_AP
  as select from    ztb_libros_ap   as Libros
    inner join      ztb_catego_ap   as Catego on Libros.bi_categ = Catego.bi_categ
    left outer join ZC_CLNTS_LIB_AP as Ventas on Libros.id_libro = Ventas.id_libro
  association [0..*] to ZC_CLIENTES_AP as _Clientes on $projection.IDLibro = _Clientes.IDLibro
{

  key Libros.id_libro    as IDLibro,
      Libros.titulo      as Titulo,
      Libros.bi_categ    as Categoria,
      Libros.autor       as Autor,
      Libros.editorial   as Editorial,
      Libros.idioma      as Idioma,
      Libros.paginas     as Paginas,
      @Semantics.amount.currencyCode: 'Moneda'
      Libros.precio      as Precio,
      case
      when Ventas.Ventas < 1 then 0
      when Ventas.Ventas = 1 then 1
      when Ventas.Ventas = 2 then 2
      when Ventas.Ventas > 2 then 3
      else 0
      end                as Ventas,
      case Ventas.Ventas
      when 0 then ''
      else ''
      end as Text,
      @Semantics.currencyCode
      Libros.moneda      as Moneda,
      Libros.formato     as Formato,
      Catego.descripcion as Descripcion,
      Libros.url         as Imagen,
      _Clientes

}
