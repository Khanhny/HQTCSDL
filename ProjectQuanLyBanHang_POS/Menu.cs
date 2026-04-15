using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace ProjectQuanLyBanHang
{
    public partial class Menu : Form
    {
        public Menu()
        {
            InitializeComponent();
        }

        private void nmCountFood_ValueChanged(object sender, EventArgs e)
        {

        }

        private void menuStrip1_ItemClicked(object sender, ToolStripItemClickedEventArgs e)
        {

        }

        private void panel1_Paint(object sender, PaintEventArgs e)
        {

        }

        private void cbBoxswitchTable_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        private void đăngXuấtToolStripMenuItem_Click(object sender, EventArgs e)
        {
            this.Close(); 

        }

        private void thôngTinCáNhânToolStripMenuItem_Click(object sender, EventArgs e)
        {
            AccountProfile accountProfile = new AccountProfile();
            accountProfile.ShowDialog();
        }

        private void adminToolStripMenuItem_Click(object sender, EventArgs e)
        {
            
        }

        private void thôngTinTàiKhoảnToolStripMenuItem_Click(object sender, EventArgs e)
        {

        }

        private void TableManeger_Load(object sender, EventArgs e)
        {

        }

        private void lbGioHang_Click(object sender, EventArgs e)
        {

        }

        private void doanhThuToolStripMenuItem_Click(object sender, EventArgs e)
        {
            // 1. Khởi tạo Form Báo cáo doanh thu
            vw_BaoCaoDoanhThu f = new vw_BaoCaoDoanhThu();

            // 2. Căn giữa màn hình để giao diện chuyên nghiệp
            f.StartPosition = FormStartPosition.CenterParent;

            // 3. Hiển thị Form dưới dạng Dialog (khóa Menu cho đến khi đóng báo cáo)
            f.ShowDialog();
        }

        private void lịchSửĐơnHàngToolStripMenuItem_Click(object sender, EventArgs e)
        {
            // 1. Khởi tạo Form đơn hàng
            vw_DonHang f = new vw_DonHang();

            // 2. Căn giữa màn hình so với Form Menu
            f.StartPosition = FormStartPosition.CenterParent;

            // 3. Hiển thị Form (ShowDialog để người dùng xử lý xong mới quay lại Menu)
            f.ShowDialog();
        }
        //-------------------Danh Mục--------------------
        //void LoadCategory()
        //{
        // 1. Lấy danh sách danh mục từ DB (giả sử dùng class kết nối của bạn)
        //   DataTable dt = DuLieu.LayBang("SELECT * FROM DanhMuc");

        //   flpCategory.Controls.Clear(); // Xóa các nút cũ

        //  foreach (DataRow item in dt.Rows)
        //  {
        //      Button btn = new Button() { Width = 100, Height = 40 };
        //     btn.Text = item["TenDanhMuc"].ToString();
        //     btn.Tag = item["MaDanhMuc"]; // Lưu mã để tí nữa lọc món

        // Gán sự kiện khi click vào danh mục
        //    btn.Click += btnCategory_Click;

        ///    flpCategory.Controls.Add(btn);
        //  }
        //}

    }

}
