using System;
using System.Windows.Forms;

namespace POS
{
    public partial class vw_SanPham : Form
    {
        public vw_SanPham()
        {
            InitializeComponent();
        }

        // Hàm dùng chung để lấy dữ liệu từ giao diện và thêm vào danh sách
        private void ThemMonVaoDonHang()
        {
            // 1. Lấy thông tin từ giao diện
            string tenMon = lb_TenSanPham.Text;
            int soLuong = (int)num_SoLuong.Value;
            string size = "M";
            if (rbtn_S.Checked) size = "S";
            else if (rbtn_L.Checked) size = "L";

            // Giả lập đơn giá (Sau này bạn sẽ lấy từ Database)
            string donGia = "25.000";

            // 2. Thêm một dòng mới vào DataGridView trên chính Form này
            dataGridView1.Rows.Add(tenMon, size, donGia);
        }

        // Sự kiện khi nhấn nút "Quay lại Menu"
        private void btn_ThemSanPhamKhac_Click(object sender, EventArgs e)
        {
            // Gọi hàm xử lý thêm món
            ThemMonVaoDonHang();

            MessageBox.Show("Đã thêm món vào đơn hàng!");

            // Đóng form hiện tại và quay về Menu/Danh mục
            this.Close();

            Form menuForm = Application.OpenForms["vw_Menu"];
            if (menuForm != null)
            {
                menuForm.Close();
            }
        }

        // Sự kiện khi nhấn nút "Thêm vào đơn hàng" (Chuyển sang view chi tiết)
        private void btn_DenViewChiTietDonHang_Click(object sender, EventArgs e)
        {
            ThemMonVaoDonHang();

            vw_ChiTietDonHang fDetail = new vw_ChiTietDonHang();
            fDetail.Show();
            this.Close();
        }

        private void radioButton2_CheckedChanged(object sender, EventArgs e)
        {
            // Để trống
        }

        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            // Để trống
        }
    }
}