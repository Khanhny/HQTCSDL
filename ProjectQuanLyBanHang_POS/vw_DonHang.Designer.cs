using System.Drawing;
using System.Windows.Forms;

namespace ProjectQuanLyBanHang
{
    partial class vw_DonHang
    {
        private System.ComponentModel.IContainer components = null;

        private DataGridView dgvDanhSach;
        private DataGridView dgvChiTiet;
        internal Label lblTongCong;
        private Button btnInLai;

        protected override void Dispose(bool disposing)
        {
            if (disposing && components != null) components.Dispose();
            base.Dispose(disposing);
        }

        private void InitializeComponent()
        {
            // Danh sách đơn hàng (trái)
            Label lblLeft = new Label
            {
                Text = "Danh Sách Đơn Hàng",
                Font = new Font("Segoe UI", 10f, FontStyle.Bold),
                Dock = DockStyle.Top,
                Height = 30,
                TextAlign = ContentAlignment.MiddleCenter,
                BackColor = Color.FromArgb(45, 45, 48),
                ForeColor = Color.White
            };

            dgvDanhSach = new DataGridView
            {
                Dock = DockStyle.Fill,
                ReadOnly = true,
                AllowUserToAddRows = false,
                SelectionMode = DataGridViewSelectionMode.FullRowSelect,
                AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.Fill,
                BackgroundColor = Color.White,
                BorderStyle = BorderStyle.None
            };
            dgvDanhSach.CellClick += dgvDanhSach_CellClick;
            this.dgvDanhSach.SelectionChanged += new System.EventHandler(this.dgvDanhSach_SelectionChanged);

            Panel pnlLeft = new Panel { Dock = DockStyle.Left, Width = 280 };
            pnlLeft.Controls.Add(dgvDanhSach);
            pnlLeft.Controls.Add(lblLeft);

            // Chi tiết đơn hàng (phải)
            Label lblRight = new Label
            {
                Text = "Chi Tiết Đơn Hàng",
                Font = new Font("Segoe UI", 10f, FontStyle.Bold),
                Dock = DockStyle.Top,
                Height = 30,
                TextAlign = ContentAlignment.MiddleCenter,
                BackColor = Color.FromArgb(45, 45, 48),
                ForeColor = Color.White
            };

            dgvChiTiet = new DataGridView
            {
                Dock = DockStyle.Fill,
                ReadOnly = true,
                AllowUserToAddRows = false,
                AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.Fill,
                BackgroundColor = Color.White,
                BorderStyle = BorderStyle.None
            };

            lblTongCong = new Label
            {
                Text = "Tổng: 0 đ",
                Font = new Font("Segoe UI", 11f, FontStyle.Bold),
                ForeColor = Color.Red,
                Dock = DockStyle.Bottom,
                Height = 32,
                TextAlign = ContentAlignment.MiddleRight,
                Padding = new Padding(0, 0, 10, 0)
            };

            btnInLai = new Button
            {
                Text = "In Lại Hóa Đơn",
                Dock = DockStyle.Bottom,
                Height = 36,
                Font = new Font("Segoe UI", 9.5f),
                BackColor = Color.SteelBlue,
                ForeColor = Color.White,
                FlatStyle = FlatStyle.Flat,
                Cursor = Cursors.Hand
            };
            btnInLai.FlatAppearance.BorderSize = 0;
            btnInLai.Click += btnInLai_Click;

            Panel pnlRight = new Panel { Dock = DockStyle.Fill };
            pnlRight.Controls.Add(dgvChiTiet);
            pnlRight.Controls.Add(lblTongCong);
            pnlRight.Controls.Add(btnInLai);
            pnlRight.Controls.Add(lblRight);

            this.Text = "Lịch Sử Đơn Hàng";
            this.Size = new Size(750, 500);
            this.StartPosition = FormStartPosition.CenterParent;
            this.Load += vw_DonHang_Load;

            this.Controls.Add(pnlRight);
            this.Controls.Add(pnlLeft);
        }
    }
}
