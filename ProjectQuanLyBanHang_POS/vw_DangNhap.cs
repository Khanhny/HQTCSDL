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
    public partial class Login : Form
    {
        string caDangChon = "";
        public Login()
        {
            InitializeComponent();
        }

        private void label1_Click(object sender, EventArgs e)
        {

        }

        private void label2_Click(object sender, EventArgs e)
        {

        }

        private void textUsername_TextChanged(object sender, EventArgs e)
        {

        }

        private void panel1_Paint(object sender, PaintEventArgs e)
        {

        }

        private void button1_Click(object sender, EventArgs e) //BTNLOGIN
        {
            string matKhauNhap = textPass.Text; // Thay txtPassword bằng ID ô nhập mật khẩu của bạn

            if (string.IsNullOrEmpty(caDangChon))
            {
                MessageBox.Show("Vui lòng chọn ca làm việc!");
                return;
            }

            bool dangNhapThanhCong = false;

            // Kiểm tra mật khẩu theo từng ca
            if (caDangChon == "Ca 1" && matKhauNhap == "111111")
            {
                dangNhapThanhCong = true;
            }
            else if (caDangChon == "Ca 2" && matKhauNhap == "222222")
            {
                dangNhapThanhCong = true;
            }

            // Xử lý kết quả
            if (dangNhapThanhCong)
            {
                Menu f = new Menu(caDangChon);
                this.Hide();
                f.ShowDialog();
                this.Show();
            }
            else
            {
                MessageBox.Show("Mật khẩu không chính xác cho " + caDangChon);
            }
        }

        private void buttonThoat_Click(object sender, EventArgs e)
        {
            Application.Exit();
        }

        private void Login_FormClosing(object sender, FormClosingEventArgs e)
        {
            if (MessageBox.Show("Bạn có chắc muốn thoát không?", "Xác nhận", MessageBoxButtons.YesNo, MessageBoxIcon.Question) == DialogResult.No)
            {
                e.Cancel = true; // Hủy sự kiện đóng form
            }
        }

        private void rbtnShift1_CheckedChanged(object sender, EventArgs e)
        {
            caDangChon = "Ca 1";
            // Thêm hiệu ứng để người dùng biết đã chọn (VD: đổi màu nền)
            rbtnShift1.BackColor = Color.LightBlue;
            rbtnShift2.BackColor = Color.White;
        }

        private void rbtnShift2_CheckedChanged(object sender, EventArgs e)
        {
            caDangChon = "Ca 2";
            rbtnShift2.BackColor = Color.LightBlue;
            rbtnShift1.BackColor = Color.White;
        }
    }
}
