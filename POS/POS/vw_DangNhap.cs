using System.Data;
using Microsoft.Data.SqlClient; // Thay vì System.Data.SqlClientusing System;
using System.Windows.Forms;

namespace POS
{
    public partial class vw_DangNhap : Form
    {
        string connectionString = @"Data Source=(localdb)\MSSQLLocalDB; Initial Catalog=QuanLyBanHang; Integrated Security=True; Connect Timeout=30; Encrypt=False; TrustServer Certificate=False;";
        public vw_DangNhap()
        {
            InitializeComponent();
        }

        private void btnEnter_Click(object sender, EventArgs e)
        {
            if (txtbPass.Text == "111111")
            {
                MessageBox.Show("Đăng nhập thành công!");
                vw_DanhMuc f = new vw_DanhMuc();
                f.Show();
                this.Hide();
            }
            else
            {
                MessageBox.Show("Sai mật khẩu!");
            }
        }

        // Các hàm này giữ lại để không bị lỗi "not exist"
        private void btnCa1_Click(object sender, EventArgs e) { }
        private void btnCa2_Click(object sender, EventArgs e) { }
        private void btnCa1_CheckedChanged(object sender, EventArgs e) { }
        private void btnCa2_CheckedChanged_1(object sender, EventArgs e) { }
        private void txtbPass_TextChanged(object sender, EventArgs e) { }
    }
}