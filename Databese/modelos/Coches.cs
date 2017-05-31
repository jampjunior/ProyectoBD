using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Database
{
    class Coche
    {
        public long id { get; set; }
        public string Matricula { get; set; }
        public string Color { get; set; }
        public decimal Cilindrada { get; set; }
        public int NPlazas { get; set; }
        public DateTime fechaMatriculacion { get; set; }
        public Marca marca { get; set; }
        public TiposCombustible tipoCombustible{ get; set; }

    }
}
