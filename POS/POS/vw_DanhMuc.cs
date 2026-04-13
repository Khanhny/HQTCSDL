using System;
using System.Data;
using Microsoft.Data.SqlClient;
using System.Windows.Forms;

namespace POS
{
    public partial class vw_DanhMuc : Form
    {
        // Chuỗi kết nối dùng chung cho cả Form
string connectionString = @"Data Source=localhost\SQLEXPRESS01; Initial Catalog=QuanLyBanHang; Integrated Security=True; Encrypt=False;";

        public vw_DanhMuc()
        {
            InitializeComponent();
        }

        // Hàm mở menu dùng chung
        private void MoMenu(string tenDM)
        {
            // Kiểm tra nếu vw_Menu chưa được định nghĩa hoặc lỗi thì sẽ báo ở đây
            try
            {
                vw_Menu f = new vw_Menu(tenDM);
                f.Show();
            }
            catch (Exception ex)
            {
                MessageBox.Show("Lỗi khi mở Menu: " + ex.Message);
            }
        }

        // Các sự kiện nút bấm - Gọi hàm MoMenu
        private void button1_Click(object sender, EventArgs e) => MoMenu("Cà phê");
        private void btn_DanhMuc_TraSua_Click(object sender, EventArgs e) => MoMenu("Trà sữa");
        private void button4_Click(object sender, EventArgs e) => MoMenu("Matcha");
        private void btn_DanhMuc_TraTraiCay_Click(object sender, EventArgs e) => MoMenu("Trà trái cây");

        // Nút Test kết nối (Nếu bạn gán vào button1_Click_1)
        private void button1_Click_1(object sender, EventArgs e)
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                try
                {
                    conn.Open();
                    MessageBox.Show("Kết nối thành công tới Database QuanLyBanHang!", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                    conn.Close();
                }
                catch (Exception ex)
                {
                    MessageBox.Show("Lỗi kết nối: " + ex.Message);
                }
            }
        }

        // Các hàm trống có thể xóa nếu không dùng để code gọn hơn
        private void vw_DanhMuc_Load(object sender, EventArgs e) { }
    } // Đóng class vw_DanhMuc
} // Đóng namespace POS