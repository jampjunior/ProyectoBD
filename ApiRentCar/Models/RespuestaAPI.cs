using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ApiRentCar
{
    public class RespuestaAPI
    {
        public int TotalElemento { get; set; }


        public string Error { get; set; }


        public List<Coche> data { get; set; }
    }
}