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

    public partial class vw_ThanhCong : Form
    {
        // Tạo một biến public để nhận dữ liệu từ Form kia gửi sang
        public string thongTinChiTiet = "";
        public vw_ThanhCong()
        {
            InitializeComponent();
        }

        private void pictureBox1_Click(object sender, EventArgs e)
        {

        }

        private void btnDong_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void vw_ThanhCong_Load(object sender, EventArgs e)
        {
            lblChiTiet.Text = thongTinChiTiet;
        }

        private void lblThanhCong_Click(object sender, EventArgs e)
        {

        }
    }
}
