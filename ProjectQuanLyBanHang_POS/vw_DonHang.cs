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
    public partial class vw_DonHang : Form
    {
        public vw_DonHang()
        {
            InitializeComponent();
        }

        private void vw_DonHang_Load(object sender, EventArgs e)
        {
            
        }
       // private void LoadDanhSachDonHang()
       // {
         //   try
           // {
                // Gọi View 1 mà tui đã hướng dẫn ở bước trước
             //   string sql = "SELECT MaDon, ThongTinThoiGian, TongTienHienThi FROM vw_DanhSachDonHang ORDER BY ThoiGian DESC";

                // Giả sử bạn dùng DataGridView hoặc ListBox để hiện danh sách bên trái
                // Ở đây tui ví dụ đổ vào DataGridView bên trái (dgvDanhSachDon)
              //  dgvDanhSachDon.DataSource = DuLieu.LayBang(sql);

                // Tùy chỉnh hiển thị cho đẹp
                //dgvDanhSachDon.Columns["MaDon"].HeaderText = "Mã Đơn";
               // dgvDanhSachDon.Columns["ThongTinThoiGian"].HeaderText = "Thời Gian";
                //dgvDanhSachDon.Columns["TongTienHienThi"].HeaderText = "Tổng Tiền";
            //}
            //catch (Exception ex)
            //{
              //  MessageBox.Show("Lỗi load dữ liệu: " + ex.Message);
            //}
        //}
    }
}
