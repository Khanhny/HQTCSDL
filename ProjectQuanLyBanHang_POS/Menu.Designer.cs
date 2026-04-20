using System.Drawing;
using System.Windows.Forms;

namespace ProjectQuanLyBanHang
{
    partial class Menu
    {
        private System.ComponentModel.IContainer components = null;

        // ===== CONTROLS =====
        private MenuStrip menuStrip1;
        private ToolStripMenuItem adminToolStripMenuItem;
        private ToolStripMenuItem thongTinTaiKhoanToolStripMenuItem;
        private ToolStripMenuItem dangXuatToolStripMenuItem;
        private ToolStripMenuItem doanhThuToolStripMenuItem;
        private ToolStripMenuItem lichSuDonHangToolStripMenuItem;

        private FlowLayoutPanel flpDanhMuc;   // Danh mục (phải)
        private FlowLayoutPanel flpSanPham;   // Sản phẩm (giữa)

        private Label lblGioHang;
        internal ListView lbGioHang;           // Giỏ hàng (trái)
        private Label lblTongTienLabel;
        internal Label lblTongTien;

        private Button btnThanhToan;
        private Button btnTang;
        private Button btnGiam;
        private Button btnXoaMon;


        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
                components.Dispose();
            base.Dispose(disposing);
        }

        private void InitializeComponent()
        {
            components = new System.ComponentModel.Container();

            // ── MenuStrip ──────────────────────────────────────
            menuStrip1 = new MenuStrip();
            adminToolStripMenuItem = new ToolStripMenuItem("Admin");
            thongTinTaiKhoanToolStripMenuItem = new ToolStripMenuItem("Thông tin tài khoản");
            dangXuatToolStripMenuItem = new ToolStripMenuItem("Đăng xuất");
            doanhThuToolStripMenuItem = new ToolStripMenuItem("Doanh thu");
            lichSuDonHangToolStripMenuItem = new ToolStripMenuItem("Lịch sử đơn hàng");

            adminToolStripMenuItem.DropDownItems.Add(doanhThuToolStripMenuItem);
            adminToolStripMenuItem.DropDownItems.Add(lichSuDonHangToolStripMenuItem);
            thongTinTaiKhoanToolStripMenuItem.DropDownItems.Add(dangXuatToolStripMenuItem);

            menuStrip1.Items.Add(adminToolStripMenuItem);
            menuStrip1.Items.Add(thongTinTaiKhoanToolStripMenuItem);
            menuStrip1.BackColor = Color.FromArgb(45, 45, 48);
            menuStrip1.ForeColor = Color.White;
            foreach (ToolStripItem i in menuStrip1.Items) i.ForeColor = Color.White;

            doanhThuToolStripMenuItem.Click += doanhThuToolStripMenuItem_Click;
            lichSuDonHangToolStripMenuItem.Click += lichSuDonHangToolStripMenuItem_Click;
            dangXuatToolStripMenuItem.Click += dangXuatToolStripMenuItem_Click;
            thongTinTaiKhoanToolStripMenuItem.Click += thongTinTaiKhoanToolStripMenuItem_Click;

            // ── GIỎ HÀNG (cột trái) ──────────────────────────
            lblGioHang = new Label
            {
                Text = "Giỏ Hàng",
                Font = new Font("Segoe UI", 13f, FontStyle.Bold),
                Dock = DockStyle.Top,
                Height = 38,
                TextAlign = ContentAlignment.MiddleLeft,
                Padding = new Padding(6, 0, 0, 0),
                BackColor = Color.FromArgb(45, 45, 48),
                ForeColor = Color.White
            };

            lbGioHang = new ListView
            {
                Dock = DockStyle.Fill,
                View = View.Details,
                FullRowSelect = true,
                GridLines = true,
                Font = new Font("Segoe UI", 9f),
                BorderStyle = BorderStyle.None
            };
          

            lblTongTienLabel = new Label
            {
                Text = "Tổng Tiền:",
                Font = new Font("Segoe UI", 11f, FontStyle.Bold),
                Height = 32,
                Dock = DockStyle.Left,
                Width = 100,
                TextAlign = ContentAlignment.MiddleLeft
            };

            lblTongTien = new Label
            {
                Text = "0 đ",
                Font = new Font("Segoe UI", 12f, FontStyle.Bold),
                ForeColor = Color.Red,
                Dock = DockStyle.Fill,
                TextAlign = ContentAlignment.MiddleRight
            };

            Panel pnlTongTien = new Panel { Height = 36, Dock = DockStyle.Bottom };
            pnlTongTien.Controls.Add(lblTongTien);
            pnlTongTien.Controls.Add(lblTongTienLabel);


            btnThanhToan = new Button
            {
                Text = "Thanh Toán",
                Height = 42,
                Dock = DockStyle.Bottom,
                Font = new Font("Segoe UI", 11f, FontStyle.Bold),
                BackColor = Color.FromArgb(0, 150, 80),
                ForeColor = Color.White,
                FlatStyle = FlatStyle.Flat,
                Cursor = Cursors.Hand
            };
            btnThanhToan.FlatAppearance.BorderSize = 0;
            btnThanhToan.Click += btnThanhToan_Click;

            btnTang = new Button
            {
                Text = "＋",
                Width = 50,
                Height = 36,
                Font = new Font("Segoe UI", 11f, FontStyle.Bold),
                BackColor = Color.SteelBlue,
                ForeColor = Color.White,
                FlatStyle = FlatStyle.Flat,
                Cursor = Cursors.Hand
            };
            btnTang.FlatAppearance.BorderSize = 0;
            btnTang.Click += btnTang_Click;

            btnGiam = new Button
            {
                Text = "－",
                Width = 50,
                Height = 36,
                Font = new Font("Segoe UI", 11f, FontStyle.Bold),
                BackColor = Color.Gray,
                ForeColor = Color.White,
                FlatStyle = FlatStyle.Flat,
                Cursor = Cursors.Hand
            };
            btnGiam.FlatAppearance.BorderSize = 0;
            btnGiam.Click += btnGiam_Click;

            btnXoaMon = new Button
            {
                Text = "🗑 Xóa",
                Width = 80,
                Height = 36,
                Font = new Font("Segoe UI", 9f, FontStyle.Bold),
                BackColor = Color.Crimson,
                ForeColor = Color.White,
                FlatStyle = FlatStyle.Flat,
                Cursor = Cursors.Hand
            };
            btnXoaMon.FlatAppearance.BorderSize = 0;
            btnXoaMon.Click += btnXoaMon_Click;

            Panel pnlActions = new Panel { Height = 40, Dock = DockStyle.Bottom };
            pnlActions.Controls.Add(btnXoaMon);
            pnlActions.Controls.Add(btnGiam);
            pnlActions.Controls.Add(btnTang);
            btnTang.Dock = DockStyle.Left;
            btnGiam.Dock = DockStyle.Left;
            btnXoaMon.Dock = DockStyle.Fill;

            Panel pnlCart = new Panel { Dock = DockStyle.Left, Width = 370, Padding = new Padding(0) };
            pnlCart.Controls.Add(lbGioHang);
            pnlCart.Controls.Add(pnlTongTien);
            pnlCart.Controls.Add(pnlActions);
            pnlCart.Controls.Add(btnThanhToan);
            pnlCart.Controls.Add(lblGioHang);

            // ── DANH MỤC (cột phải) ──────────────────────────
            Label lblDanhMucTitle = new Label
            {
                Text = "Danh Mục",
                Font = new Font("Segoe UI", 11f, FontStyle.Bold),
                Dock = DockStyle.Top,
                Height = 38,
                TextAlign = ContentAlignment.MiddleCenter,
                BackColor = Color.FromArgb(45, 45, 48),
                ForeColor = Color.White
            };

            flpDanhMuc = new FlowLayoutPanel
            {
                Dock = DockStyle.Fill,
                AutoScroll = true,
                FlowDirection = FlowDirection.TopDown,
                WrapContents = false,
                Padding = new Padding(6)
            };

            Panel pnlDanhMuc = new Panel { Dock = DockStyle.Right, Width = 135 };
            pnlDanhMuc.Controls.Add(flpDanhMuc);
            pnlDanhMuc.Controls.Add(lblDanhMucTitle);

            // ── SẢN PHẨM (giữa) ──────────────────────────────
            Label lblSanPhamTitle = new Label
            {
                Text = "Thực Đơn",
                Font = new Font("Segoe UI", 11f, FontStyle.Bold),
                Dock = DockStyle.Top,
                Height = 38,
                TextAlign = ContentAlignment.MiddleCenter,
                BackColor = Color.FromArgb(45, 45, 48),
                ForeColor = Color.White
            };

            flpSanPham = new FlowLayoutPanel
            {
                Dock = DockStyle.Fill,
                AutoScroll = true,
                Padding = new Padding(6)
            };

            Panel pnlSanPham = new Panel { Dock = DockStyle.Fill };
            pnlSanPham.Controls.Add(flpSanPham);
            pnlSanPham.Controls.Add(lblSanPhamTitle);

            // ── FORM ─────────────────────────────────────────
            this.Text = "POS - Quản Lý Bán Nước";
            this.Size = new Size(1000, 650);
            this.StartPosition = FormStartPosition.CenterScreen;
            this.BackColor = Color.WhiteSmoke;
            this.MainMenuStrip = menuStrip1;
            this.Load += Menu_Load;

            this.Controls.Add(pnlSanPham);
            this.Controls.Add(pnlDanhMuc);
            this.Controls.Add(pnlCart);
            this.Controls.Add(menuStrip1);
        }
    }
}
