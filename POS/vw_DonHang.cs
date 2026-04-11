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
    public partial class vw_DonHang : Form
    {
        public vw_DonHang()
        {
            InitializeComponent();
            this.Load += vw_DonHang_Load;
        }
        class DonHang
        {
            public string MaDon { get; set; }
            public DateTime ThoiGian { get; set; }

            public override string ToString()
            {
                return MaDon + " - " + ThoiGian.ToString("HH:mm");
            }
        }
        List<DonHang> dsDon = new List<DonHang>();
        private void listBox1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        private void vw_DonHang_Load(object sender, EventArgs e)
        {
            dsDon.Add(new DonHang { MaDon = "DH01", ThoiGian = DateTime.Now.AddHours(-3) });
            dsDon.Add(new DonHang { MaDon = "DH02", ThoiGian = DateTime.Now.AddHours(-2) });
            dsDon.Add(new DonHang { MaDon = "DH03", ThoiGian = DateTime.Now.AddHours(-1) });

            lbDonHang.DataSource = dsDon;

            // UI đẹp hơn
            dgvChiTiet.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.Fill;
            dgvChiTiet.RowHeadersVisible = false;
        }

        private void lbDonHang_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (lbDonHang.SelectedItem is DonHang dh)
            {
                LoadChiTietFake(dh.MaDon);
            }
        }
        private void LoadChiTietFake(string maDon)
        {
            DataTable dt = new DataTable();
            dt.Columns.Add("Tên Món");
            dt.Columns.Add("Số Lượng");
            dt.Columns.Add("Đơn Giá");
            dt.Columns.Add("Thành Tiền");

            if (maDon == "DH01")
            {
                dt.Rows.Add("Trà sữa", 2, 30000, 60000);
                dt.Rows.Add("Trà cam đào", 1, 20000, 20000);
            }
            else if (maDon == "DH02")
            {
                dt.Rows.Add("Cà phê sữa", 3, 25000, 75000);
            }
            else
            {
                dt.Rows.Add("Cà phê đen", 2, 20000, 40000);
                dt.Rows.Add("Matcha Latte", 2, 15000, 30000);
            }

            dgvChiTiet.DataSource = dt;

            // 🔹 Tính tổng tiền
            int tong = 0;
            foreach (DataRow row in dt.Rows)
            {
                tong += Convert.ToInt32(row["Thành Tiền"]);
            }

            lbTongCong.Text = "Tổng cộng: " + tong.ToString("N0") + " đ";
        }
    }
}
