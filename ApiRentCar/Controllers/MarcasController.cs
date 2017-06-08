using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace ApiRentCar.Controllers
{
    public class MarcasController : ApiController
    {
        // GET: api/Marcas
        // public IEnumerable<string> Get()
        public RespuestaAPI Get()
        {
            RespuestaAPI resultado = new RespuestaAPI();
            List<Marca> dataMarca = new List<Marca>(); //ojo con esto lo que pones aqui lo pones abajo

            try
            {
                Db.Conectar();
                if (Db.EstaLaConexionAbierta())
                {
                    dataMarca = Db.GetMarcas();
                    resultado.TotalElemento = dataMarca.Count;
                }
                Db.Desconectar();

            }
            catch (Exception)
            {
                resultado.TotalElemento = 0;
                resultado.Error = "Se produjo un error";

            }

            resultado.TotalElemento = dataMarca.Count;
            resultado.dataMarca = dataMarca;
            return resultado;

        }

        // GET: api/Marcas/5
        public RespuestaAPI Get(int id)
        {
            RespuestaAPI resultado = new RespuestaAPI();
            List<Marca> listaMarca = new List<Marca>();
            try
            {
                Db.Conectar();

                if (Db.EstaLaConexionAbierta())
                {
                    listaMarca = Db.GetMarcasPorId(id);
                    //dataMarca = Db.GetMarcasPorId( id); // fallo
                    //resultado.TotalElemento = dataMarca.Count;
                    resultado.Error = "";
                    Db.Desconectar();
                }
               

            }
            catch (Exception)
            {
                
                resultado.Error = "Se produjo un error";

            }

            resultado.TotalElemento = listaMarca.Count;
            resultado.dataMarca = listaMarca;
            return resultado;
        }

        // POST: api/Marcas
        [HttpPost]
        public IHttpActionResult Post([FromBody]Marca marca)
        {
            RespuestaAPI respuesta = new RespuestaAPI();
            respuesta.Error = "";
            int filasAfectadas = 0;
            try
            {
                Db.Conectar();
                if (Db.EstaLaConexionAbierta())
                {
                    filasAfectadas = Db.AgregarMarca(marca);

                }
                respuesta.TotalElemento = filasAfectadas;
                    Db.Desconectar();
            }
            catch (Exception ex)
            {

                respuesta.TotalElemento = 0;
                respuesta.Error = "Petardaso te salió men";
            }
            
            return Ok(respuesta);

        }

        // PUT: api/Marcas/5
        public void Put(int id, [FromBody]string value)
        {
        }

        // DELETE: api/Marcas/5
        public void Delete(int id)
        {
        }
    }
}
