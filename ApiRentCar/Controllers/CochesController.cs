using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace ApiRentCar.Controllers
{
    public class CochesController : ApiController
    {
        // GET: api/Coches (la ruta del navegador)
        //public IEnumerable<string> Get()
        //{
        //    return new string[] { "Hola", "Que tal" };
        //}

      //  public IEnumerable<Coche> Get()
      public RespuestaAPI Get()
        {
            RespuestaAPI resultado = new RespuestaAPI();
            List <Coche> data = new List<Coche>(); 
            try
            {
                Db.Conectar();
                if (Db.EstaLaConexionAbierta())
                {
                    data = Db.DameListaCochesConProcedimientoAlmacenado();
                    resultado.Error = "";
                }
            }
            catch (Exception )
            {
                resultado.Error = "Error";
            }
            resultado.TotalElemento = data.Count;
            resultado.data = data;
            return resultado;
        }



        // GET: api/Coches/5
        public RespuestaAPI Get(long id)
        {
            RespuestaAPI resultado = new RespuestaAPI();
            List<Coche> data = new List<Coche>();
            try
            {
                Db.Conectar();
                if (Db.EstaLaConexionAbierta())
                {
                    data = Db.DameListaCochesConProcedimientoAlmacenadoId(id);
                    resultado.Error = "";
                }
                Db.Desconectar();
            }
            catch (Exception ex)
            {
                resultado.Error = "Error";
            }
            resultado.TotalElemento = data.Count;
            resultado.data = data;
            return resultado;
        }

        // POST: api/Coches
        public void Post([FromBody]string value)
        {
        }

        // PUT: api/Coches/5
        public void Put(int id, [FromBody]string value)
        {
        }

        // DELETE: api/Coches/5
        public void Delete(int id)
        {
        }
    }
}
