using System;
using System.Collections.Generic;

namespace Database
{
    public class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Conectando a la base de datos");
            Db database = new Db();
            database.Conectar();

            if (database.EstaLaConexionAbierta())
            {
                Usuario nuevoUsuario = new Usuario() //se ejecuta una vez
                {
                    //hiddenId = 0,
                    //id = "",
                    firstName = "Hola2",
                    lastName = "LA DEL BOMBO",
                    email = "aa2vsasa@kk.com",
                    password = "dssssssdssd",
                    photoUrl = "",
                    searchPreferences = "",
                    status = false,
                    deleted = false,
                    isAdmin = false,
                };
                database.intercambioUsuario(nuevoUsuario); //crear usuario
                //  si quieres borrar comento esta y listo
                Console.WriteLine("Nuevo Usuario ingresado, pulsa una tecla para continuar");
                Console.ReadKey();

                nuevoUsuario.firstName += " modificado!!";
                database.Actualizar(nuevoUsuario);
                Console.WriteLine("Usuario Actualizado");
                Console.ReadKey();

                database.EliminarUsuario("aa2vsasa@kk.com"); //aqui se pone el hiddenId que lo quiera borrar
                Console.WriteLine("Usuario Borrado pulse una tecla para continuar");
                Console.ReadKey();
                List <Usuario> listaUsuarios = database.DameLosUsuarios();
                listaUsuarios.ForEach(usuario =>
                {
                    Console.WriteLine(
                            " hiddenId: " + usuario.hiddenId
                            +
                            " id: " + usuario.id
                            +
                            " email: " + usuario.email
                            +
                            " password: " + usuario.password
                            +
                            " nombre: " + usuario.firstName
                            +
                            " Apellidos: " + usuario.lastName
                            +
                            " photoUrl: " + usuario.photoUrl
                            );
                });
            }
            database.Desconectar();
            database = null;
            Console.ReadKey();
        }


    }
}


