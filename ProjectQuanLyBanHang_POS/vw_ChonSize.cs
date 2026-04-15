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

    public partial class vw_ChonSize : Form
    { 
        public string SizeDuocChon = "M"; // Mặc định là size M
        public decimal GiaSize = 0;
        public string GhiChu = "";
    
        public vw_ChonSize()
        {
            InitializeComponent();
        }

        private void btnL_Click(object sender, EventArgs e)
        {
            SizeDuocChon = "L";
            GiaSize = 10000;

            btnS.BackColor = Color.White;
            btnM.BackColor = Color.White;
            btnL.BackColor = Color.LightBlue;
        }

        private void btnS_Click(object sender, EventArgs e)
        {
            SizeDuocChon = "S";
            GiaSize = -10000; // Hoặc lấy từ View database
                              // Đổi màu để khách biết mình đang chọn nút này
            btnS.BackColor = Color.LightBlue;
            btnM.BackColor = Color.White;
            btnL.BackColor = Color.White;
        }

        private void btnThem_Click(object sender, EventArgs e)
        {
            GhiChu = txbNote.Text; // Lấy nội dung từ cái ô trắng dài bạn vừa kéo
            this.DialogResult = DialogResult.OK; // Đánh dấu là khách nhấn Thêm chứ không phải Huỷ
            this.Close();
        }

        private void btnM_Click(object sender, EventArgs e)
        {
            SizeDuocChon = "M";
            GiaSize = 0;

            btnS.BackColor = Color.White;
            btnM.BackColor = Color.LightBlue;
            btnL.BackColor = Color.White;
        }
    }
}
