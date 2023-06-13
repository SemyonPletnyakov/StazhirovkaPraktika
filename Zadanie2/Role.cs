using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Zadanie2
{
    public class Role
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public bool ReadSportEvents { get; set; }
        public bool ChangeSportEvents { get; set; }
        public bool ChangeUsers { get; set; }
        public List<User> Users { get; set; }
    }
}