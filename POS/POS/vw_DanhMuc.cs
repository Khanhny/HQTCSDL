using System;
using System.Windows.Forms;

namespace POS
{
    public partial class vw_DanhMuc : Form
    {
        public vw_DanhMuc()
        {
            InitializeComponent();
        }

        private void vw_DanhMuc_Load(object sender, EventArgs e) { }
        private void flowLayoutPanel1_Paint(object sender, PaintEventArgs e) { }
        private void textBox1_TextChanged_1(object sender, EventArgs e) { }
        private void textBox5_TextChanged(object sender, EventArgs e) { }
        private void textBox7_TextChanged(object sender, EventArgs e) { }

        private void button1_Click(object sender, EventArgs e) => MoMenu("Cà phê");
        private void btn_DanhMuc_TraSua_Click(object sender, EventArgs e) => MoMenu("Trà sữa");
        private void button4_Click(object sender, EventArgs e) => MoMenu("Matcha");
        private void btn_DanhMuc_TraTraiCay_Click(object sender, EventArgs e) => MoMenu("Trà trái cây");

        private void MoMenu(string tenDM)
        {
            vw_Menu f = new vw_Menu(tenDM);
            f.Show();
        }
    }
}