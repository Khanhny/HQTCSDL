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
    public partial class vw_ThanhToan : Form
    {
        public vw_ThanhToan()
        {
            InitializeComponent();
        }

        private void btnTienMat_Click(object sender, EventArgs e)
        {
            ChonPhuongThuc(btnTienMat);
        }

        private void btnNganHang_Click(object sender, EventArgs e)
        {
            ChonPhuongThuc(btnNganHang); 
        }
        private void ChonPhuongThuc(Button btnDuocChon)
        {
            // Reset tất cả các nút về màu trắng
            btnTienMat.BackColor = Color.White;
            btnNganHang.BackColor = Color.White;

            // Đổi nút vừa bấm thành màu xanh (LightBlue hoặc mã màu bạn thích)
            btnDuocChon.BackColor = Color.LightBlue;
        }

        private void vw_ThanhToan_Load(object sender, EventArgs e)
        {
            ChonPhuongThuc(btnTienMat);
        }

        private void btnXacNhan_Click(object sender, EventArgs e)
        {
            // 1. Xác định phương thức thanh toán dựa trên màu sắc nút
            string phuongThuc = (btnTienMat.BackColor == Color.LightBlue) ? "Tiền mặt" : "Ngân hàng";

            // 2. (Quan trọng) Gọi Procedure để lưu vào Database trước khi hiện bảng thành công
            // string sql = $"EXEC sp_XacNhanThanhToan @MaDon='{maDon}', @PhuongThuc=N'{phuongThuc}'";
            // DuLieu.ThucThi(sql); 

            // 3. Mở bảng thành công và truyền dữ liệu sang
            using (vw_ThanhCong f = new vw_ThanhCong())
            {
                // Giả sử label hiện tổng tiền của bạn là lblTongTien
                // Chúng ta truyền chuỗi "40.000đ • Tiền mặt" sang Form thành công
                f.thongTinChiTiet = $"{lblTongCongg.Text} • {phuongThuc}";

                this.Hide(); // Ẩn bảng thanh toán đi cho đẹp
                f.ShowDialog(); // Hiện bảng thành công, code sẽ dừng tại đây đợi khách bấm "Đóng"
            }

            // 4. Sau khi f.ShowDialog() đóng lại, ta đóng luôn bảng Thanh Toán này
            this.DialogResult = DialogResult.OK; // Trả kết quả về Menu để Menu biết mà xóa giỏ hàng
            this.Close();
        }
    }
}
