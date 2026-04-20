using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;

namespace ProjectQuanLyBanHang
{
    public static class DuLieu
    {
        private static readonly string connectionString =
            "Server=localhost\\SQLEXPRESS;Database=POS;Integrated Security=True;";

        public static SqlConnection GetConnection()
        {
            return new SqlConnection(connectionString);
        }

        // Trả về DataTable từ câu SELECT
        public static DataTable LayBang(string sql)
        {
            DataTable dt = new DataTable();
            using (SqlConnection conn = GetConnection())
            {
                conn.Open();
                SqlDataAdapter da = new SqlDataAdapter(sql, conn);
                da.Fill(dt);
            }
            return dt;
        }

        // Thực thi INSERT/UPDATE/DELETE, trả về số dòng bị ảnh hưởng
        public static int ThucThi(string sql)
        {
            using (SqlConnection conn = GetConnection())
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand(sql, conn);
                return cmd.ExecuteNonQuery();
            }
        }

        // Gọi Stored Procedure với parameters, trả về DataTable
        public static DataTable GoiSP(string tenSP, SqlParameter[] parameters = null)
        {
            DataTable dt = new DataTable();
            using (SqlConnection conn = GetConnection())
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand(tenSP, conn);
                cmd.CommandType = CommandType.StoredProcedure;
                if (parameters != null)
                    cmd.Parameters.AddRange(parameters);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(dt);
            }
            return dt;
        }

        // Gọi SP có OUTPUT parameter
        public static int GoiSP_Output(string tenSP, SqlParameter[] parameters)
        {
            using (SqlConnection conn = GetConnection())
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand(tenSP, conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddRange(parameters);
                cmd.ExecuteNonQuery();
                // Tìm OUTPUT parameter và trả về
                foreach (SqlParameter p in parameters)
                {
                    if (p.Direction == ParameterDirection.Output)
                        return Convert.ToInt32(p.Value);
                }
                return 0;
            }
        }

        // Lấy giá trị scalar
        public static object LayGiaTri(string sql)
        {
            using (SqlConnection conn = GetConnection())
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand(sql, conn);
                return cmd.ExecuteScalar();
            }
        }
    }
}

