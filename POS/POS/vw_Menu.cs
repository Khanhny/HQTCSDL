using System.Data;
using Microsoft.Data.SqlClient; // Thay vì System.Data.SqlClient
using System;
using System.Windows.Forms;

namespace POS
{
    public partial class vw_Menu : Form
    {
        string connectionString = @"Data Source=(localdb)\MSSQLLocalDB; Initial Catalog=QuanLyBanHang; Integrated Security=True; Connect Timeout=30; Encrypt=False; TrustServer Certificate=False;";
        private string loaiMenu = "";

        public vw_Menu(string tenDM)
        {
            InitializeComponent();
            this.loaiMenu = tenDM;
            if (txtb_Menu != null) txtb_Menu.Text = tenDM.ToUpper();
        }

        private void vw_Menu_Load(object sender, EventArgs e)
        {
            // 1. Ẩn tất cả các nút món ăn trước
            btn_CaPheDen.Visible = btn_CaPheSua.Visible = btn_Americano.Visible = false;
            btn_TraSuaTruyenThong.Visible = btn_TraSuaOlong.Visible = false;
            btn_TraNho.Visible = btn_TraVai.Visible = btn_TraDao.Visible = false;
            btn_TraDau.Visible = btn_TraMangCau.Visible = false;
            btn_MatchaLatte.Visible = btn_MatchaDau.Visible = false;

            // 2. Chỉ hiện các nút tương ứng với danh mục được chọn
            if (loaiMenu == "Cà phê")
            {
                btn_CaPheDen.Visible = btn_CaPheSua.Visible = btn_Americano.Visible = true;
            }
            else if (loaiMenu == "Trà sữa")
            {
                btn_TraSuaTruyenThong.Visible = btn_TraSuaOlong.Visible = true;
            }
            else if (loaiMenu == "Trà trái cây")
            {
                btn_TraNho.Visible = btn_TraVai.Visible = btn_TraDao.Visible = btn_TraDau.Visible = btn_TraMangCau.Visible = true;
            }
            else if (loaiMenu == "Matcha")
            {
                btn_MatchaLatte.Visible = btn_MatchaDau.Visible = true;
            }
        }

        private void button3_Click(object sender, EventArgs e) { }

        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }

        private void ChonMon_Click(object sender, EventArgs e)
        {
            // 1. Xác định nút nào vừa được nhấn
            Button btnDaNhan = (Button)sender;

            // 2. Khởi tạo Form sản phẩm
            vw_SanPham f = new vw_SanPham();

            // 3. Gán chữ trên nút (ví dụ: "Trà nho") vào Label của Form mới
            // Vì bạn đã để Public nên dòng này sẽ không báo lỗi nữa
            f.lb_TenSanPham.Text = btnDaNhan.Text;

            // 4. Hiển thị Form lên
            f.ShowDialog();
        }
    }
}