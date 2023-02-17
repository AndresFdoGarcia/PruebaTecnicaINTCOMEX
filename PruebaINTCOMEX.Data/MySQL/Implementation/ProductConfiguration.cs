using Dapper;
using MySql.Data.MySqlClient;
using PruebaINTCOMEX.Data.Model;
using PruebaINTCOMEX.Data.MySQL.Contract;
using System;
using System.Collections.Generic;
using System.Formats.Asn1;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PruebaINTCOMEX.Data.MySQL.Implementation
{
    public class ProductConfiguration : IProductConfiguration
    {
        private readonly MySQLConfiguration _connectionString;

        public ProductConfiguration(MySQLConfiguration connectionString)
        {
            _connectionString = connectionString;
        }
        protected MySqlConnection dbConnection()
        {
            return new MySqlConnection(_connectionString.ConnectionString);
        }

        public Task<IEnumerable<Product>> GetAllProducts()
        {
            throw new NotImplementedException();
        }

        public Task<IEnumerable<Product>> GetProdByData(RequestApi request)
        {
            var db = dbConnection();
            var fin = request.Name;
            if (request.typeCon == TypeCon.CAT)
            {
                var sql = @"SELECT p.id_producto, p.nombre_producto, 
                GROUP_CONCAT(DISTINCT a.nombre_atributo SEPARATOR ', ') AS atributos, 
                GROUP_CONCAT(DISTINCT c.nombre_categoría SEPARATOR ', ') AS categorias, 
                GROUP_CONCAT(DISTINCT sc.nombre_subcategoría SEPARATOR ', ') AS subcategorias
                FROM Productos p
                JOIN Productos_Atributos pa ON p.id_producto = pa.id_producto
                JOIN Atributos a ON pa.id_atributo = a.id_atributo
                JOIN Atributos_Categorías ac ON a.id_atributo = ac.id_atributo
                JOIN Categorías c ON ac.id_categoría = c.id_categoría
                LEFT JOIN Categorías_Subcategorías cs ON ac.id_categoría = cs.id_categoría
                LEFT JOIN Subcategorías sc ON cs.id_subcategoría = sc.id_subcategoría
                WHERE c.nombre_categoría = '@fin'
                GROUP BY p.id_producto";
                return db.QueryAsync<Product>(sql, new { });
            }
            else
            {
                var sql = @"SELECT p.id_producto, p.nombre_producto, 
                GROUP_CONCAT(DISTINCT a.nombre_atributo SEPARATOR ', ') AS atributos, 
                GROUP_CONCAT(DISTINCT c.nombre_categoría SEPARATOR ', ') AS categorias, 
                GROUP_CONCAT(DISTINCT sc.nombre_subcategoría SEPARATOR ', ') AS subcategorias
                FROM Productos p
                JOIN Productos_Atributos pa ON p.id_producto = pa.id_producto
                JOIN Atributos a ON pa.id_atributo = a.id_atributo
                JOIN Atributos_Categorías ac ON a.id_atributo = ac.id_atributo
                JOIN Categorías c ON ac.id_categoría = c.id_categoría
                 Categorías_Subcategorías cs ON c.id_categoría = cs.id_categoría
                JOIN Subcategorías sc ON cs.id_subcategoría = sc.id_subcategoría
                WHERE sc.nombre_subcategoría = '@fin'
                GROUP BY p.id_producto";
                return db.QueryAsync<Product>(sql, new { });
            }

            
        }
    }
}
