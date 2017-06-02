using System;
using System.Collections.Generic;

namespace Database
{
    public class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Conectando a la base de datos");
            Db.Conectar();

            if (Db.EstaLaConexionAbierta())
            {
                //List<MarcasNCoches> lista = Db.DameListaMarcasNCoches();
                //lista.ForEach(elemento => 
                //{
                //    Console.WriteLine(
                //            " Marca: " + elemento.marca
                //            +
                //            " Nº de coches: " + elemento.nCoches
                //            );
                //});

                List<Coche> listaCoches = Db.DameListaCochesConProcedimientoAlmacenado();
                listaCoches.ForEach(coche =>
                {
                    Console.WriteLine(
                        @"Matrícula: " + coche.matricula +
                        " Marca: " + coche.marca.denominacion

                        );
                });
            }
            Db.Desconectar();
            Console.ReadKey();
        }

       //// public static void ObtenerUsuarios()
       // {
       //     Console.WriteLine("Conectando a la base de datos");
       //     Db.Conectar();

       //     if (Db.EstaLaConexionAbierta())
       //     {
       //         Usuario nuevoUsuario = new Usuario()
       //         {
       //             //hiddenId = 0,
       //             //id = "",
       //             firstName = "MANOLO",
       //             lastName = "EL DEL BOMBO",
       //             email = "kk3@kk.com",
       //             password = "123456",
       //             photoUrl = "",
       //             searchPreferences = "",
       //             status = false,
       //             deleted = false,
       //             isAdmin = false,
       //         };
       //         Db.InsertarUsuario(nuevoUsuario);
       //         Console.WriteLine("Usuario insertado, pulsa una tecla para continuar...");
       //         Console.ReadKey();

       //         nuevoUsuario.firstName += " modificado!!";
       //         Db.ActualizarUsuario(nuevoUsuario);
       //         Console.WriteLine("Usuario actualizado, pulsa una tecla para continuar...");
       //         Console.ReadKey();

       //         Db.EliminarUsuario("kk3@kk.com");
       //         Console.WriteLine("Usuario eliminado, pulsa una tecla para continuar...");

       //         List<Usuario> listaUsuarios = Db.DameLosUsuarios();
       //         listaUsuarios.ForEach(usuario =>
       //         {
       //             Console.WriteLine(
       //                     " hiddenId: " + usuario.hiddenId
       //                     +
       //                     " id: " + usuario.id
       //                     +
       //                     " email: " + usuario.email
       //                     +
       //                     " password: " + usuario.password
       //                     +
       //                     " nombre: " + usuario.firstName
       //                     +
       //                     " Apellidos: " + usuario.lastName
       //                     +
       //                     " photoUrl: " + usuario.photoUrl
       //                     );
       //         });
       //     }
       //     Db.Desconectar();
       //     Console.ReadKey();

       // }
    }
}