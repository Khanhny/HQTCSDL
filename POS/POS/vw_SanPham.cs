using System.Data;
using Microsoft.Data.SqlClient; // Thư viện để làm việc với SQL Server
using System;
using System.Windows.Forms;

namespace POS
{
    public partial class vw_SanPham : Form
    {
        
        // Sửa lại thành TrustServerCertificate (viết liền) hoặc dùng Encrypt=False
        string connectionString = @"Data Source=localhost\SQLEXPRESS01; Initial Catalog=QuanLyBanHang; Integrated Security=True; Encrypt=False;";
        public vw_SanPham()
        {
            InitializeComponent(); // Dòng này PHẢI nằm đầu tiên

            // Thiết lập mặc định
            num_SoLuong.Value = 1;
            rbtn_S.Checked = true; // Tự động chọn Size S ngay khi mở

            // Gọi hàm lấy giá để nó hiện số tiền ngay lập tức
            CapNhatGiaTuDong();
        }

        // Hàm dùng chung để lấy dữ liệu từ giao diện và thêm vào danh sách
        private void ThemMonVaoDonHang()
        {
            // 1. Lấy thông tin từ giao diện
            string tenMon = lb_TenSanPham.Text;
            int soLuong = (int)num_SoLuong.Value;
            string size = "M"; // Mặc định
            if (rbtn_S.Checked) size = "S";
            else if (rbtn_L.Checked) size = "L";

            int donGiaTuSQL = 0;

            // 2. Truy vấn Database để lấy giá đúng theo Size
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                try
                {
                    conn.Open();
                    string sql = "SELECT GiaBan FROM Sanpham WHERE TenSanPham = @ten AND Size = @size";
                    SqlCommand cmd = new SqlCommand(sql, conn);
                    cmd.Parameters.AddWithValue("@ten", tenMon);
                    cmd.Parameters.AddWithValue("@size", size);

                    object result = cmd.ExecuteScalar();
                    if (result != null)
                    {
                        donGiaTuSQL = Convert.ToInt32(result);
                    }
                }
                catch (Exception ex)
                {
                    MessageBox.Show("Lỗi lấy giá: " + ex.Message);
                    return;
                }
            }

            // 3. Thêm vào DataGridView với giá đã lấy từ SQL
            // Định dạng số có dấu chấm phân cách cho đẹp
            string donGiaHienThi = donGiaTuSQL.ToString("N0");
            dataGridView1.Rows.Add(tenMon, size, donGiaHienThi);
        }

        // Sự kiện khi nhấn nút "Quay lại Menu"
        private void btn_ThemSanPhamKhac_Click(object sender, EventArgs e)
        {
            ThemMonVaoDonHang();
            // Đóng form hiện tại và quay về Menu/Danh mục
            this.Close();

            Form menuForm = Application.OpenForms["vw_DanhMuc"];
            if (menuForm != null)
            {
                menuForm.Close();
            }

        }

        private void btn_DenViewChiTietDonHang_Click(object sender, EventArgs e)
        {
            // Gọi hàm xử lý thêm món
            ThemMonVaoDonHang();

            MessageBox.Show("Đã thêm món vào đơn hàng!");

            //// Đóng form hiện tại và quay về Menu/Danh mục
            //this.Close();

            //Form menuForm = Application.OpenForms["vw_Menu"];
            //if (menuForm != null)
            //{
            //    menuForm.Close();
            //}
        }

        private void radioButton2_CheckedChanged(object sender, EventArgs e)
        {
            CapNhatGiaTuDong();
        }

        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            // Để trống
        }

        private void button1_Click(object sender, EventArgs e)
        {

            vw_ChiTietDonHang fDetail = new vw_ChiTietDonHang();
            fDetail.Show();
            this.Close();


        }

        private void label1_Click(object sender, EventArgs e)
        {

        }

        private void btn_LayGiaHienTai_Click(object sender, EventArgs e)
        {
            CapNhatGiaTuDong();
        }
        private void num_SoLuong_ValueChanged(object sender, EventArgs e)
        {
            CapNhatGiaTuDong();
        }
        private void CapNhatGiaTuDong()
        {
            string tenMon = lb_TenSanPham.Text.Trim();
            string size = rbtn_S.Checked ? "S" : (rbtn_M.Checked ? "M" : "L");

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                try
                {
                    conn.Open();
                    // Gọi Procedure sp_CapNhatGiaSanPham có trong Database của bạn
                    SqlCommand cmd = new SqlCommand("sp_CapNhatGiaSanPham", conn);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@TenSanPham", tenMon);
                    cmd.Parameters.AddWithValue("@Size", size);

                    object result = cmd.ExecuteScalar();
                    if (result != null)
                    {
                        int giaGoc = Convert.ToInt32(result);
                        lb_Gia.Text = (giaGoc * (int)num_SoLuong.Value).ToString("N0");
                    }
                }
                catch (Exception ex) { /* Xử lý lỗi kết nối */ }
            }
        }

        private void rbtn_S_CheckedChanged(object sender, EventArgs e)
        {
            CapNhatGiaTuDong();

        }

        private void rbtn_L_CheckedChanged(object sender, EventArgs e)
        {
            CapNhatGiaTuDong();

        }
    }
}