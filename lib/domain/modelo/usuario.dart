class Usuario {
  var user;
  var pass;
  var nombre;
  var apellido;
  Usuario({this.nombre, this.apellido, this.user, this.pass});
}

Usuario user = Usuario(
    user: 'qwerty', pass: '12345', nombre: 'alvaro', apellido: 'villalobos');
