using System;
using System.Collections.Generic;

namespace TestModel.Models
{
    [Serializable]
    public partial class item
    {
        public item()
        {
        }
        public string ItemGID { get; set; }
        public string ItemID { get; set; }
        public string ItemName { get; set; }
        public string ItemDesc { get; set; }
        public System.DateTime TS { get; set; }

    }
}
