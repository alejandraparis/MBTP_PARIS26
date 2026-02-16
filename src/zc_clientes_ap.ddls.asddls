@AbapCatalog.sqlViewName: 'ZV_CLIENTESP'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Clientes'
@Metadata.allowExtensions: true
@UI.headerInfo: {
  typeName: 'Cliente',  
  title : { type :#STANDARD,
         value: 'NombreCompleto' },
  description : { type :#STANDARD,
                value: 'IdCliente' },
 imageUrl : 'Imagen'
}
define view ZC_CLIENTES_AP
  as select from ztb_clientes_ap  as Clientes
    inner join   ztb_clnts_lib_ap as Clnts on Clnts.id_cliente = Clientes.id_cliente
{
  key Clnts.id_libro      as IDLibro,
  key Clientes.id_cliente as IDCliente,
  key Clientes.tipo_acceso         as Acceso,
      Clientes.nombre              as Nombre,
      Clientes.apellidos           as Apellido,
      Clientes.email               as Email,
      Clientes.url                 as Imagen,
      concat_with_space( Clientes.nombre,  Clientes.apellidos, 1 ) as NombreCompleto
}
