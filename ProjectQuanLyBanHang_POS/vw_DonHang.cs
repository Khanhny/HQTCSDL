using System;
using System.Data;
using System.Drawing;
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
            LoadDanhSachDonHang();
        }

        private void LoadDanhSachDonHang()
        {
            try
            {
                DataTable dt = DuLieu.LayBang(
                    "SELECT MaDon, ThoiGian, TongTien, MaCa FROM Donhang ORDER BY ThoiGian DESC");

                dgvDanhSach.DataSource = dt;
                dgvDanhSach.AutoResizeColumns();

                // Đặt header tiếng Việt
                if (dgvDanhSach.Columns.Count >= 4)
                {
                    dgvDanhSach.Columns["MaDon"].HeaderText = "Mã Đơn";
                    dgvDanhSach.Columns["ThoiGian"].HeaderText = "Thời Gian";
                    dgvDanhSach.Columns["TongTien"].HeaderText = "Tổng Tiền";
                    dgvDanhSach.Columns["MaCa"].HeaderText = "Ca";
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show("Lỗi tải đơn hàng:\n" + ex.Message, "Lỗi");
            }
        }

        // Khi click vào đơn hàng → hiện chi tiết bên phải
        private void dgvDanhSach_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            if (e.RowIndex < 0) return;

            try
            {
                string maDon = dgvDanhSach.Rows[e.RowIndex].Cells["MaDon"].Value?.ToString();
                if (string.IsNullOrEmpty(maDon)) return;

                DataTable dt = DuLieu.LayBang(
                    $@"SELECT sp.TenSanPham AS 'Sản Phẩm', ct.Size, ct.SoLuong AS 'Số Lượng',
                              ct.Gia AS 'Đơn Giá', (ct.SoLuong * ct.Gia) AS 'Thành Tiền'
                       FROM Chitietdon ct
                       JOIN Sanpham sp ON ct.MaSanPham = sp.MaSanPham AND ct.Size = sp.Size
                       WHERE ct.MaDon = '{maDon}'");

                dgvChiTiet.DataSource = dt;
                dgvChiTiet.AutoResizeColumns();

                // Tính tổng cộng
                decimal tong = 0;
                foreach (DataRow row in dt.Rows)
                    tong += row["Thành Tiền"] == DBNull.Value ? 0 : Convert.ToDecimal(row["Thành Tiền"]);

                lblTongCong.Text = string.Format("Tổng: {0:N0} đ", tong);
            }
            catch (Exception ex)
            {
                MessageBox.Show("Lỗi tải chi tiết:\n" + ex.Message, "Lỗi");
            }
        }

        private void btnInLai_Click(object sender, EventArgs e)
        {
            if (dgvDanhSach.SelectedRows.Count == 0)
            {
                MessageBox.Show("Chọn đơn hàng cần in!", "Thông báo");
                return;
            }
            string maDon = dgvDanhSach.SelectedRows[0].Cells["MaDon"].Value?.ToString();
            MessageBox.Show($"Chức năng in hóa đơn {maDon} sẽ được tích hợp sau!", "Thông báo",
                MessageBoxButtons.OK, MessageBoxIcon.Information);
        }
        private void dgvDanhSach_SelectionChanged(object sender, EventArgs e)
        {
            if (dgvDanhSach.SelectedRows.Count == 0) return;
            try
            {
                string maDon = dgvDanhSach.SelectedRows[0].Cells["MaDon"].Value?.ToString().Trim();
                if (string.IsNullOrEmpty(maDon)) return;

                DataTable dt = DuLieu.LayBang(
                    $@"SELECT sp.TenSanPham AS 'Sản Phẩm', ct.Size, ct.SoLuong AS 'Số Lượng',
                      ct.Gia AS 'Đơn Giá', (ct.SoLuong * ct.Gia) AS 'Thành Tiền'
               FROM Chitietdon ct
               JOIN Sanpham sp ON ct.MaSanPham = sp.MaSanPham 
                               AND RTRIM(ct.Size) = RTRIM(sp.Size)
               WHERE ct.MaDon = '{maDon}'");

                dgvChiTiet.DataSource = dt;
                dgvChiTiet.AutoResizeColumns();

                decimal tong = 0;
                foreach (DataRow row in dt.Rows)
                    tong += row["Thành Tiền"] == DBNull.Value ? 0 : Convert.ToDecimal(row["Thành Tiền"]);
                lblTongCong.Text = string.Format("Tổng: {0:N0} đ", tong);
            }
            catch (Exception ex)
            {
                MessageBox.Show("Lỗi: " + ex.Message);
            }
        }
    }
}
