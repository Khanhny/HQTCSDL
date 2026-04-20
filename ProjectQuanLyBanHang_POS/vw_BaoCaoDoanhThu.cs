using System;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Windows.Forms;

namespace ProjectQuanLyBanHang
{
    public partial class vw_BaoCaoDoanhThu : Form
    {
        public vw_BaoCaoDoanhThu()
        {
            InitializeComponent();
        }

        private void vw_BaoCaoDoanhThu_Load(object sender, EventArgs e)
        {
            // Load danh sách ca vào combobox
            try
            {
                cboChonCa.Items.Clear();
                DataTable dt = DuLieu.LayBang("SELECT MaCa FROM Calamviec");
                foreach (DataRow row in dt.Rows)
                    cboChonCa.Items.Add(row["MaCa"].ToString().Trim());
                if (cboChonCa.Items.Count > 0) cboChonCa.SelectedIndex = 0;
            }
            catch { }
            // Mặc định chọn Ngày và disable combobox ca
            radNgay.Checked = true;
            cboChonCa.Enabled = false;

            // Gắn event cho radCa nếu chưa có trong Designer
            radCa.CheckedChanged += rbCa_CheckedChanged;
        }

        private void btnXemBaoCao_Click(object sender, EventArgs e)
        {
            try
            {
                dgvBaoCao.DataSource = null;

                if (radCa.Checked)
                    LoadBaoCaoCa();
                else if (radGio.Checked)
                    LoadBaoCaoGio();
                else
                    LoadBaoCaoNgay();
            }
            catch (Exception ex)
            {
                MessageBox.Show("Lỗi tải báo cáo:\n" + ex.Message, "Lỗi");
            }
        }

        private void LoadBaoCaoCa()
        {
            string maCa = cboChonCa.SelectedItem?.ToString() ?? "";
            if (string.IsNullOrEmpty(maCa)) { MessageBox.Show("Chọn ca trước!"); return; }

            DataTable dt = DuLieu.LayBang(
                $"SELECT MaCa, CAST(ThoiGian AS DATE) AS Ngay, SUM(TongTien) AS DoanhThu " +
                $"FROM Donhang WHERE MaCa='{maCa}' GROUP BY MaCa, CAST(ThoiGian AS DATE)");

            HienThiBaoCao(dt, "Doanh thu theo ca: " + maCa);
        }

        private void LoadBaoCaoGio()
        {
            DateTime ngay = dtpNgay.Value.Date;
            DataTable dt = DuLieu.LayBang(
                $"SELECT DATEPART(HOUR, ThoiGian) AS Gio, SUM(TongTien) AS DoanhThu, COUNT(MaDon) AS SoDon " +
                $"FROM Donhang WHERE CAST(ThoiGian AS DATE)='{ngay:yyyy-MM-dd}' " +
                $"GROUP BY DATEPART(HOUR, ThoiGian) ORDER BY Gio");

            HienThiBaoCao(dt, "Doanh thu theo giờ ngày " + ngay.ToString("dd/MM/yyyy"));
        }

        private void LoadBaoCaoNgay()
        {
            DateTime ngay = dtpNgay.Value.Date;
            DataTable dt = DuLieu.LayBang(
                $"SELECT CAST(ThoiGian AS DATE) AS Ngay, SUM(TongTien) AS TongDoanhThu, COUNT(MaDon) AS SoDon " +
                $"FROM Donhang WHERE CAST(ThoiGian AS DATE)='{ngay:yyyy-MM-dd}' " +
                $"GROUP BY CAST(ThoiGian AS DATE)");

            HienThiBaoCao(dt, "Doanh thu ngày " + ngay.ToString("dd/MM/yyyy"));
        }

        private void HienThiBaoCao(DataTable dt, string tieuDe)
        {
            dgvBaoCao.DataSource = dt;
            dgvBaoCao.AutoResizeColumns();
            dgvBaoCao.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.Fill;
            // Tính tổng cộng
            decimal tongCong = 0;
            foreach (DataRow row in dt.Rows)
            {
                if (dt.Columns.Contains("DoanhThu"))
                    tongCong += row["DoanhThu"] == DBNull.Value ? 0 : Convert.ToDecimal(row["DoanhThu"]);
                else if (dt.Columns.Contains("TongDoanhThu"))
                    tongCong += row["TongDoanhThu"] == DBNull.Value ? 0 : Convert.ToDecimal(row["TongDoanhThu"]);
            }

            lblTongCong.Text = string.Format("{0:N0} đ", tongCong);
            this.Text = "Báo cáo - " + tieuDe;
        }

        private void rbCa_CheckedChanged(object sender, EventArgs e)
        {
            cboChonCa.Enabled = radCa.Checked;
        }
    }
}
