using System.Data;
using Microsoft.Data.SqlClient; // Thay vì System.Data.SqlClientusing System;
using System.Data;
using System.Windows.Forms;

namespace POS
{
    public partial class vw_ChiTietDonHang : Form
    {
        string connectionString = @"Data Source=(localdb)\MSSQLLocalDB; Initial Catalog=QuanLyBanHang; Integrated Security=True; Connect Timeout=30; Encrypt=False; TrustServer Certificate=False;";
        public vw_ChiTietDonHang()
        {
            InitializeComponent();
        }

        // Hàm này dùng để thêm món trực tiếp vào các cột bạn đã thiết kế
        public void ThemMonVaoBang(string ten, string size, int sl, decimal gia)
        {
            decimal thanhTien = sl * gia;

            // dgv_ChiTietDonHang là tên bạn đặt trong file Designer
            dgv_ChiTietDonHang.Rows.Add(ten, size, sl, gia.ToString("N0"), thanhTien.ToString("N0"));
        }

        // Nút quay lại (Bạn nhớ kéo thêm 1 nút Button và đặt tên là btn_QuayLai nhé)
        private void btn_QuayLai_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void button1_Click(object sender, EventArgs e)
        {

        }
    }
}