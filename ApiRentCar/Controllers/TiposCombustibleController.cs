using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace ApiRentCar.Controllers
{
    public class TiposCombustibleController : ApiController
    {
        // GET: api/TiposCombustible
        //public IEnumerable<string> Get()
        //{
        //    return new string[] { "value1", "value2" };
        //}
        public RespuestaAPI Get()
        { 
             RespuestaAPI resultado = new RespuestaAPI();
        List<TiposCombustible> data = new List<TiposCombustible>();
            try
            {
                Db.Conectar();
                if (Db.EstaLaConexionAbierta())
                {
                    data = Db.GetTiposCombustibles(); 
                  
                }
                resultado.Error = "";
                Db.Desconectar();

            }
            catch (Exception)
            {
                resultado.TotalElemento = 0;
                resultado.Error = "Se produjo un error";

            }

            resultado.TotalElemento = data.Count;
            resultado.dataTipoCombustible = data;
            return resultado;
        }




        // GET: api/TiposCombustible/5
        public string Get(int id)
        {
            return "value";
        }

        // POST: api/TiposCombustible
        public void Post([FromBody]string value)
        {
        }

        // PUT: api/TiposCombustible/5
        public void Put(int id, [FromBody]string value)
        {
        }

        // DELETE: api/TiposCombustible/5
        public void Delete(int id)
        {
        }
    }
}
