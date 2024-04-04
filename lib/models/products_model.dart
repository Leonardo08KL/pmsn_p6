class ProductosModel {
  int? idProducto;
  String? nomProducto;
  String? desProductos;
  int? precioProducto;

  ProductosModel(
      {this.idProducto,
      this.nomProducto,
      this.desProductos,
      this.precioProducto});

  factory ProductosModel.fromMap(Map<String, dynamic> producto) {
    return ProductosModel(
      idProducto: producto['idProducto'],
      nomProducto: producto['nomProducto'],
      desProductos: producto['desProductos'],
      precioProducto: producto['precioProducto'],
    );
  }
}
