using System;
using UnitTest.EFModel.Models;
using TestModel.Models;
using System.Collections.Generic;
using System.Linq;
using Microsoft.EntityFrameworkCore;

namespace EFCoreSameKeyException
{
    class Program
    {
        static void Main(string[] args)
        {
            using (var context = new demoContext())
            {
                var defaultPrimaryKey = "TestPK1";
                var newPrimaryKey = "TestPK2";

                context.Database.ExecuteSqlCommand("delete from item_Detail");
                context.Database.ExecuteSqlCommand("delete from item");

                var item1 = new item { ItemGID = defaultPrimaryKey };
                item1.ItemID = item1.ItemGID;
                item1.TS = DateTime.Now;
                item1.itemDetail = new List<itemDetail>();
                var detail1 = new itemDetail()
                {
                    GUID = Guid.NewGuid().ToString(),
                    ItemGID = defaultPrimaryKey,
                    LineId = 1
                };
                item1.itemDetail.Add(detail1);
                context.Set<item>().Add(item1);
                context.SaveChanges();

                var item = context.Set<item>().Find(defaultPrimaryKey);

                var item2 = new item { ItemGID = newPrimaryKey };
                item2.ItemID = item2.ItemGID;
                item2.TS = DateTime.Now;
                item2.itemDetail = new List<itemDetail>();
                item2.itemDetail.Add(new itemDetail
                {
                    ItemGID = defaultPrimaryKey,
                    LineId = 1,
                    GUID = Guid.NewGuid().ToString(),
                });

                context.Set<item>().Add(item2);
                context.SaveChanges();
            }
        }
    }
}
