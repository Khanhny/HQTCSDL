using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace POS
{
    public partial class vw_BaoCaoDoanhThu : Form
    {
        public vw_BaoCaoDoanhThu()
        {
            InitializeComponent();
        }

        private void radioButton3_CheckedChanged(object sender, EventArgs e)
        {
            cboChonCa.Enabled = false;
        }

        private void vw_BaoCaoDoanhThu_Load(object sender, EventArgs e)
        {
            dateTimePickerNgay.Value = DateTime.Today;

            cboChonCa.Items.Clear();
            cboChonCa.Items.Add("Ca 1");
            cboChonCa.Items.Add("Ca 2");
            cboChonCa.SelectedIndex = 0;

            // Mặc định chọn Ngày
            radNgay.Checked = true;

            // Ẩn ComboBox Ca khi mới mở
            cboChonCa.Enabled = false;
        }

        private void radCa_CheckedChanged(object sender, EventArgs e)
        {
            cboChonCa.Enabled = radCa.Checked;
        }

        private void radGio_CheckedChanged(object sender, EventArgs e)
        {
            cboChonCa.Enabled = false;
        }
        // =============================================
        // NÚT XEM BÁO CÁO
        // =============================================
        private void btnXemBaoCao_Click(object sender, EventArgs e)
        {
            DateTime ngayChon = dateTimePickerNgay.Value.Date;

            if (radGio.Checked)
                LoadBaoCaoTheoGio(ngayChon);
            else if (radCa.Checked)
                LoadBaoCaoTheoCa(ngayChon);
            else
                LoadBaoCaoTheoNgay(ngayChon);
        }
        private void LoadBaoCaoTheoNgay(DateTime ngay)
        {
            DataTable dt = new DataTable();
            dt.Columns.Add("Mã Đơn");
            dt.Columns.Add("Thời Gian");
            dt.Columns.Add("Ca");
            dt.Columns.Add("Tổng Tiền");

            dt.Rows.Add("DH01", "08:00", "Ca 1", 100000);
            dt.Rows.Add("DH02", "10:30", "Ca 1", 200000);
            dt.Rows.Add("DH03", "14:00", "Ca 2", 150000);

            dvgBaoCao.DataSource = dt;

            lblTongCong.Text = "Tổng Cộng: 450,000 đ";
        }
        private void LoadBaoCaoTheoGio(DateTime ngay)
        {
            DataTable dt = new DataTable();
            dt.Columns.Add("Giờ");
            dt.Columns.Add("Số Đơn");
            dt.Columns.Add("Tổng Tiền");

            dt.Rows.Add("08:00", 5, 200000);
            dt.Rows.Add("09:00", 3, 150000);
            dt.Rows.Add("10:00", 7, 300000);
            dt.Rows.Add("11:00", 4, 180000);

            dvgBaoCao.DataSource = dt;

            lblTongCong.Text = "Tổng Cộng: 830,000 đ";
        }
        private void LoadBaoCaoTheoCa(DateTime ngay)
        {
            DataTable dt = new DataTable();
            dt.Columns.Add("Ca");
            dt.Columns.Add("Số Đơn");
            dt.Columns.Add("Tổng Tiền");

            dt.Rows.Add("Ca 1", 10, 500000);
            dt.Rows.Add("Ca 2", 8, 400000);
            dt.Rows.Add("Ca 3", 6, 350000);

            dvgBaoCao.DataSource = dt;

            lblTongCong.Text = "Tổng Cộng: 1,250,000 đ";
        }

        private void dvgBaoCao_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }
    }
}
