
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;

namespace Database
{
    public static class Db
    {
        private static SqlConnection conexion = null;

        public static void Conectar()
        {
            try
            {
                // PREPARO LA CADENA DE CONEXIÓN A LA BD
                string cadenaConexion = @"Server=.\sqlexpress;
                                          Database=testdb;
                                          User Id=testeruser;
                                          Password=!Curso@2017;";

                // CREO LA CONEXIÓN
                conexion = new SqlConnection();
                conexion.ConnectionString = cadenaConexion;

                // TRATO DE ABRIR LA CONEXION
                conexion.Open();

                //// PREGUNTO POR EL ESTADO DE LA CONEXIÓN
                //if (conexion.State == ConnectionState.Open)
                //{
                //    Console.WriteLine("Conexión abierta con éxito");
                //    // CIERRO LA CONEXIÓN
                //    conexion.Close();
                //}
            }
            catch (Exception)
            {
                if (conexion != null)
                {
                    if (conexion.State != ConnectionState.Closed)
                    {
                        conexion.Close();
                    }
                    conexion.Dispose();
                    conexion = null;
                }
            }
            finally
            {
                // DESTRUYO LA CONEXIÓN
                //if (conexion != null)
                //{
                //    if (conexion.State != ConnectionState.Closed)
                //    {
                //        conexion.Close();
                //        Console.WriteLine("Conexión cerrada con éxito");
                //    }
                //    conexion.Dispose();
                //    conexion = null;
                //}
            }
        }

        public static bool EstaLaConexionAbierta()
        {
            return conexion.State == ConnectionState.Open;
        }

        public static void Desconectar()
        {
            if (conexion != null)
            {
                if (conexion.State != ConnectionState.Closed)
                {
                    conexion.Close();
                }
            }
        }

        public static List<Usuario> DameLosUsuarios()
        {
            //Usuario[]     usuarios = null;
            List<Usuario> usuarios = null;
            // PREPARO LA CONSULTA SQL PARA OBTENER LOS USUARIOS
            string consultaSQL = "SELECT * FROM Users;";
            // PREPARO UN COMANDO PARA EJECUTAR A LA BASE DE DATOS
            SqlCommand comando = new SqlCommand(consultaSQL, conexion);
            // RECOJO LOS DATOS
            SqlDataReader reader = comando.ExecuteReader();
            usuarios = new List<Usuario>();

            while (reader.Read())
            {
                usuarios.Add(new Usuario()
                {
                    hiddenId = int.Parse(reader["hiddenId"].ToString()),
                    id = reader["id"].ToString(),
                    email = reader["email"].ToString(),
                    password = reader["password"].ToString(),
                    firstName = reader["firstName"].ToString(),
                    lastName = reader["lastName"].ToString(),
                    photoUrl = reader["photoUrl"].ToString(),
                    searchPreferences = reader["searchPreferences"].ToString(),
                    status = bool.Parse(reader["status"].ToString()),
                    deleted = (bool)reader["deleted"],
                   isAdmin = Convert.ToBoolean(reader["isAdmin"])

                });
            }

            // DEVUELVO LOS DATOS
            return usuarios;
        }


        public static void intercambioUsuario(Usuario usuario)// nombre que se le pone a elegir para ponerlo luego abajo
        {
            // PREPARO LA CONSULTA SQL PARA INSERTAR AL NUEVO USUARIO
            string consultaSQL = @"INSERT INTO Users (
                                                email
                                               ,password
                                               ,firstName
                                               ,lastName
                                               ,photoUrl
                                               ,searchPreferences
                                               ,status
                                               ,deleted
                                               ,isAdmin
                                               )
                                         VALUES (";
            consultaSQL += "'" + usuario.email + "'";
            consultaSQL += ",'" + usuario.password + "'";
            consultaSQL += ",'" + usuario.firstName + "'";
            consultaSQL += ",'" + usuario.lastName + "'";
            consultaSQL += ",'" + usuario.photoUrl + "'";
            consultaSQL += ",'" + usuario.searchPreferences + "'";
            consultaSQL += "," + (usuario.status ? "1" : "0");
            //esto es igual que el status
            //if (usuario.status)
            //{
            //    consultaSQL += ",0";
            //}
            consultaSQL += "," + (usuario.deleted ? "1" : "0"); //primer pedazo se concantena con lo que venga detrás un 0 o un 1.
            consultaSQL += "," + (usuario.isAdmin ? "1" : "0");
            consultaSQL += ");";

            // PREPARO UN COMANDO PARA EJECUTAR A LA BASE DE DATOS
            SqlCommand comando = new SqlCommand(consultaSQL, conexion);
            // RECOJO LOS DATOS
            comando.ExecuteNonQuery();
        }

       
        public static void EliminarUsuario (string email){

        
            string consultaSQL = @"DELETE FROM Users WHERE email ='" + email + "';"; //pasa el identificador que se quiera borrar

            // PREPARO UN COMANDO PARA EJECUTAR A LA BASE DE DATOS
            SqlCommand comando = new SqlCommand(consultaSQL, conexion);
            // RECOJO LOS DATOS
            comando.ExecuteNonQuery();

        }

        public static void Actualizar(Usuario usuario) {
            string consultaSQL= @"UPDATE Users";
   
             
            consultaSQL += " SET password = '" + usuario.password +"'";
            consultaSQL += " , firstName =  '" + usuario.firstName + "'";
            consultaSQL += " , lastName ='" + usuario.lastName + "'";
            consultaSQL += " , photoUrl ='" + usuario.photoUrl + "'";
            consultaSQL += " , searchPreferences ='" + usuario.searchPreferences + "'";
            consultaSQL += " , status = " + (usuario.status ? "1" : "0");
            consultaSQL += " , deleted = " + (usuario.deleted ? "1" : "0");
            consultaSQL += " , isAdmin = " + (usuario.isAdmin ? "1" : "0");
            consultaSQL += " WHERE email= '" + usuario.email + "';";

            SqlCommand comando = new SqlCommand(consultaSQL, conexion);
            // RECOJO LOS DATOS
            comando.ExecuteNonQuery();


        }




    }//final db


}//final Database
