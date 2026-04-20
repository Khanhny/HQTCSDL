using System;
using System.Data.SqlClient;
using System.Drawing;
using System.Windows.Forms;

namespace ProjectQuanLyBanHang
{
    public partial class vw_ThanhToan : Form
    {
        private string _maDon;
        private string _maCa;
        private decimal _tongTien;

        // Constructor 3 tham số cho Menu.cs gọi
        public vw_ThanhToan(string maDon, string maCa, decimal tongTien)
        {
            InitializeComponent();
            _maDon = maDon;
            _maCa = maCa;
            _tongTien = tongTien;
        }

        private void vw_ThanhToan_Load(object sender, EventArgs e)
        {
            // Hiển thị tổng tiền lên label (tên label lấy từ Designer gốc)
            lblTongCongg.Text = string.Format("{0:N0} đ", _tongTien);
            ChonPhuongThuc(btnTienMat);
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
            btnTienMat.BackColor = Color.White;
            btnNganHang.BackColor = Color.White;
            btnDuocChon.BackColor = Color.LightBlue;
        }

        private void btnXacNhan_Click(object sender, EventArgs e)
        {
            string phuongThuc = (btnTienMat.BackColor == Color.LightBlue) ? "Tiền mặt" : "Ngân hàng";

            try
            {
                using (var conn = DuLieu.GetConnection())
                {
                    conn.Open();
                    var cmd = new SqlCommand("sp_ThanhToanDonHang", conn);
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@MaDon", _maDon);
                    cmd.Parameters.AddWithValue("@MaCa", _maCa);
                    cmd.ExecuteNonQuery();
                }

                using (var fThanhCong = new vw_ThanhCong())
                {
                    fThanhCong.thongTinChiTiet = $"{string.Format("{0:N0}đ", _tongTien)} • {phuongThuc}";
                    this.Hide();
                    fThanhCong.ShowDialog();
                }

                this.DialogResult = DialogResult.OK;
                this.Close();
            }
            catch (Exception ex)
            {
                MessageBox.Show("Lỗi thanh toán:\n" + ex.Message, "Lỗi",
                    MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void btnHuy_Click(object sender, EventArgs e)
        {
            this.DialogResult = DialogResult.Cancel;
            this.Close();
        }
    }
}
