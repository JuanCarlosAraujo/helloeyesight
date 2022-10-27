class Cliente {
  var nombre;
  var apellido;
  var telefono;
  Cliente({this.nombre, this.apellido, this.telefono});
}

List<Cliente> listaClientes = [
  Cliente(nombre: 'Socrates', apellido: 'Atenas', telefono: '11111'),
  Cliente(nombre: 'Platon', apellido: 'Atenas', telefono: '22222'),
  Cliente(nombre: 'Aristoteles', apellido: 'Atenas', telefono: '33333'),
  Cliente(nombre: 'Marco', apellido: 'Aurelio', telefono: '44444')
];
