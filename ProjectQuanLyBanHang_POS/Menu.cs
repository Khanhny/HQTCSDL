using System;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Windows.Forms;

namespace ProjectQuanLyBanHang
{

    public partial class Menu : Form
    {
        
        public Menu()
        {
            InitializeComponent();
        }
        // ===== BIẾN TRẠNG THÁI =====
        private string _maCa;           // Mã ca đang làm việc
        private string _maDonHienTai;   // Mã đơn hàng đang mở
        private string _maDanhMucDangChon = "";

        public Menu(string maCa)
        {
            InitializeComponent();
            _maCa = maCa;
        }

        // ===================================================
        //  KHỞI TẠO FORM
        // ===================================================
        private void Menu_Load(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(_maCa))
            {
                MessageBox.Show("_maCa bị null! Kiểm tra lại chỗ gọi new Menu()");
                return;
            }
            TaoDonHangMoi();
            LoadDanhMuc();
        }

        // ===================================================
        //  TẠO ĐƠN HÀNG MỚI KHI MỞ CA
        // ===================================================
        private void TaoDonHangMoi()
        {
            try
            {
                var maDonParam = new SqlParameter("@MaDonMoi", SqlDbType.Char, 4)
                {
                    Direction = ParameterDirection.Output
                };

                using (var conn = DuLieu.GetConnection())
                {
                    conn.Open();
                    var cmd = new SqlCommand("sp_TaoDonHangMoi", conn);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add(new SqlParameter("@MaCa", _maCa));
                    cmd.Parameters.Add(maDonParam);
                    cmd.ExecuteNonQuery();
                }

                _maDonHienTai = maDonParam.Value?.ToString().Trim();
            }
            catch (Exception ex)
            {
                MessageBox.Show("Lỗi tạo đơn hàng:\n" + ex.Message, "Lỗi", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        // ===================================================
        //  LOAD DANH MỤC → Sinh nút động bên phải
        // ===================================================
        private void LoadDanhMuc()
        {
            try
            {
                // Panel chứa nút danh mục: flpDanhMuc (FlowLayoutPanel)
                flpDanhMuc.Controls.Clear();

                DataTable dt = DuLieu.LayBang("SELECT MaDanhMuc, TenDanhMuc FROM Danhmuc");

                // Nút "Tất cả"
                Button btnAll = TaoBtnDanhMuc("Tất cả", "");
                btnAll.BackColor = Color.SteelBlue;
                btnAll.ForeColor = Color.White;
                flpDanhMuc.Controls.Add(btnAll);

                foreach (DataRow row in dt.Rows)
                {
                    string ma = row["MaDanhMuc"].ToString();
                    string ten = row["TenDanhMuc"].ToString();
                    flpDanhMuc.Controls.Add(TaoBtnDanhMuc(ten, ma));
                }

                // Mặc định load tất cả sản phẩm
                LoadSanPham("");
            }
            catch (Exception ex)
            {
                MessageBox.Show("Lỗi load danh mục:\n" + ex.Message, "Lỗi");
            }
        }

        private Button TaoBtnDanhMuc(string ten, string maDanhMuc)
        {
            Button btn = new Button
            {
                Text = ten,
                Tag = maDanhMuc,
                Width = 110,
                Height = 45,
                Font = new Font("Segoe UI", 9f, FontStyle.Bold),
                BackColor = Color.WhiteSmoke,
                FlatStyle = FlatStyle.Flat,
                Cursor = Cursors.Hand,
                Margin = new Padding(4)
            };
            btn.FlatAppearance.BorderColor = Color.LightGray;
            btn.Click += BtnDanhMuc_Click;
            return btn;
        }

        private void BtnDanhMuc_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            _maDanhMucDangChon = btn.Tag.ToString();

            // Reset màu tất cả nút
            foreach (Control c in flpDanhMuc.Controls)
                if (c is Button b) { b.BackColor = Color.WhiteSmoke; b.ForeColor = Color.Black; }

            btn.BackColor = Color.SteelBlue;
            btn.ForeColor = Color.White;

            LoadSanPham(_maDanhMucDangChon);
        }

        // ===================================================
        //  LOAD SẢN PHẨM → Sinh nút động
        // ===================================================
        private void LoadSanPham(string maDanhMuc)
        {
            try
            {
                // Panel chứa nút sản phẩm: flpSanPham (FlowLayoutPanel)
                flpSanPham.Controls.Clear();

                string sql = string.IsNullOrEmpty(maDanhMuc)
                    ? @"SELECT DISTINCT sp.MaSanPham, sp.TenSanPham, sp.GiaBan, dm.TenDanhMuc
                        FROM Sanpham sp JOIN Danhmuc dm ON sp.MaDanhMuc = dm.MaDanhMuc"
                    : $@"SELECT DISTINCT sp.MaSanPham, sp.TenSanPham, sp.GiaBan, dm.TenDanhMuc
                         FROM Sanpham sp JOIN Danhmuc dm ON sp.MaDanhMuc = dm.MaDanhMuc
                         WHERE sp.MaDanhMuc = '{maDanhMuc}'";

                DataTable dt = DuLieu.LayBang(sql);

                // Dùng tên sản phẩm để loại trùng (vì có nhiều size)
                var tenDaHien = new System.Collections.Generic.HashSet<string>();

                foreach (DataRow row in dt.Rows)
                {
                    string tenSP = row["TenSanPham"].ToString();
                    if (tenDaHien.Contains(tenSP)) continue;
                    tenDaHien.Add(tenSP);

                    string maSP = row["MaSanPham"].ToString();
                    string tenDM = row["TenDanhMuc"].ToString();

                    Panel card = TaoCardSanPham(maSP, tenSP, tenDM);
                    flpSanPham.Controls.Add(card);
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show("Lỗi load sản phẩm:\n" + ex.Message, "Lỗi");
            }
        }

        private Panel TaoCardSanPham(string maSP, string tenSP, string tenDM)
        {
            Panel card = new Panel
            {
                Width = 130,
                Height = 110,
                BackColor = Color.White,
                BorderStyle = BorderStyle.FixedSingle,
                Margin = new Padding(6),
                Cursor = Cursors.Hand,
                Tag = maSP
            };

            Label lblTen = new Label
            {
                Text = tenSP,
                Font = new Font("Segoe UI", 9f, FontStyle.Bold),
                TextAlign = ContentAlignment.MiddleCenter,
                Dock = DockStyle.Top,
                Height = 50,
                Padding = new Padding(4),
                BackColor = Color.FromArgb(230, 245, 255)
            };

            Label lblDM = new Label
            {
                Text = tenDM,
                Font = new Font("Segoe UI", 8f),
                ForeColor = Color.Gray,
                TextAlign = ContentAlignment.MiddleCenter,
                Dock = DockStyle.Fill
            };

            Label lblChon = new Label
            {
                Text = "➕ Thêm",
                Font = new Font("Segoe UI", 8.5f, FontStyle.Bold),
                ForeColor = Color.SteelBlue,
                TextAlign = ContentAlignment.MiddleCenter,
                Dock = DockStyle.Bottom,
                Height = 28,
                BackColor = Color.AliceBlue
            };

            card.Controls.Add(lblDM);
            card.Controls.Add(lblTen);
            card.Controls.Add(lblChon);

            // Click vào bất kỳ chỗ nào trên card đều mở chọn size
            EventHandler clickHandler = (s, e) => MoChonSize(maSP, tenSP);
            card.Click += clickHandler;
            lblTen.Click += clickHandler;
            lblDM.Click += clickHandler;
            lblChon.Click += clickHandler;

            // Hover effect
            card.MouseEnter += (s, e) => card.BackColor = Color.FromArgb(240, 248, 255);
            card.MouseLeave += (s, e) => card.BackColor = Color.White;

            return card;
        }

        // ===================================================
        //  MỞ FORM CHỌN SIZE → THÊM VÀO GIỎ
        // ===================================================
        private void MoChonSize(string maSP, string tenSP)
        {
            if (string.IsNullOrEmpty(_maDonHienTai))
            {
                MessageBox.Show("Chưa có đơn hàng! Vui lòng tạo đơn mới.", "Thông báo");
                return;
            }

            using (var formSize = new vw_ChonSize(tenSP))
            {
                if (formSize.ShowDialog() == DialogResult.OK)
                {
                    ThemSanPhamVaoDon(maSP, formSize.SizeDuocChon, 1);
                }
            }
        }

        // ===================================================
        //  THÊM SẢN PHẨM VÀO ĐƠN (gọi SP)
        // ===================================================
        private void ThemSanPhamVaoDon(string maSP, string size, int soLuong)
        {
            try
            {
               
                var parameters = new SqlParameter[]
                {
                    new SqlParameter("@MaDon", _maDonHienTai),
                    new SqlParameter("@MaCa", _maCa),
                    new SqlParameter("@MaSanPham", maSP),
                    new SqlParameter("@Size", size),
                    new SqlParameter("@SoLuong", soLuong)
                };

                using (var conn = DuLieu.GetConnection())
                {
                    conn.Open();
                    var cmd = new SqlCommand("sp_ThemSanPhamVaoDon", conn);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddRange(parameters);
                    cmd.ExecuteNonQuery();
                }

                LoadGioHang();
            }
            catch (Exception ex)
            {
                MessageBox.Show("Lỗi thêm sản phẩm:\n" + ex.Message, "Lỗi");
            }
        }

        // ===================================================
        //  LOAD GIỎ HÀNG (ListView)
        // ===================================================
        public void LoadGioHang()
        {
            try
            {
                if (string.IsNullOrEmpty(_maDonHienTai)) return;

                lbGioHang.Items.Clear();

                // Dùng header nếu chưa có
                if (lbGioHang.Columns.Count == 0)
                {
                    lbGioHang.View = View.Details;
                    lbGioHang.FullRowSelect = true;
                    lbGioHang.GridLines = true;
                    lbGioHang.Columns.Add("Sản phẩm", 140);
                    lbGioHang.Columns.Add("Size", 45);
                    lbGioHang.Columns.Add("SL", 35);
                    lbGioHang.Columns.Add("Đơn giá", 75);
                    lbGioHang.Columns.Add("T.Tiền", 85);
                }

                string sql = $@"SELECT ct.MaSanPham, sp.TenSanPham, ct.Size, ct.SoLuong, ct.Gia,
                                       (ct.SoLuong * ct.Gia) AS ThanhTien
                                FROM Chitietdon ct
                                JOIN Sanpham sp ON ct.MaSanPham = sp.MaSanPham AND ct.Size = sp.Size
                                WHERE ct.MaDon = '{_maDonHienTai}'";

                DataTable dt = DuLieu.LayBang(sql);
                decimal tongTien = 0;

                foreach (DataRow row in dt.Rows)
                {
                    ListViewItem item = new ListViewItem(row["TenSanPham"].ToString());
                    item.SubItems.Add(row["Size"].ToString());
                    item.SubItems.Add(row["SoLuong"].ToString());
                    item.SubItems.Add(string.Format("{0:N0}đ", row["Gia"]));
                    item.SubItems.Add(string.Format("{0:N0}đ", row["ThanhTien"]));
                    item.Tag = row["MaSanPham"].ToString(); // để xóa
                    lbGioHang.Items.Add(item);
                    tongTien += Convert.ToDecimal(row["ThanhTien"]);
                }

                lblTongTien.Text = string.Format("{0:N0} đ", tongTien);
            }
            catch (Exception ex)
            {
                MessageBox.Show("Lỗi load giỏ hàng:\n" + ex.Message, "Lỗi");
            }
        }

        // ===================================================
        //  XÓA MÓN KHỎI GIỎ (double-click hoặc nút xóa)
        // ===================================================
        // Thay thế method lbGioHang_DoubleClick cũ bằng cách thêm các method mới

        private void XoaMonKhoiGio()
        {
            if (lbGioHang.SelectedItems.Count == 0) return;

            string maSP = lbGioHang.SelectedItems[0].Tag.ToString();
            string size = lbGioHang.SelectedItems[0].SubItems[1].Text.Trim();

            try
            {
                using (var conn = DuLieu.GetConnection())
                {
                    conn.Open();
                    var cmd = new SqlCommand("sp_XoaSanPhamKhoiDon", conn);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddRange(new SqlParameter[]
                    {
                new SqlParameter("@MaDon", _maDonHienTai),
                new SqlParameter("@MaSanPham", maSP),
            
                    });
                    cmd.ExecuteNonQuery();
                }
                LoadGioHang();
            }
            catch (Exception ex)
            {
                MessageBox.Show("Lỗi xóa:\n" + ex.Message);
            }
        }

        private void CapNhatSoLuong(int delta)
        {
            if (lbGioHang.SelectedItems.Count == 0) return;

            string maSP = lbGioHang.SelectedItems[0].Tag.ToString();
            string size = lbGioHang.SelectedItems[0].SubItems[1].Text.Trim();
            int soLuongHienTai = int.Parse(lbGioHang.SelectedItems[0].SubItems[2].Text);
            int soLuongMoi = soLuongHienTai + delta;

            if (soLuongMoi <= 0)
            {
                XoaMonKhoiGio();
                return;
            }

            try
            {
                string sql = $@"UPDATE Chitietdon SET SoLuong = {soLuongMoi}
                        WHERE MaDon = '{_maDonHienTai}' 
                        AND MaSanPham = '{maSP}' 
                        AND Size = '{size}'";
                using (var conn = DuLieu.GetConnection())
                {
                    conn.Open();
                    new SqlCommand(sql, conn).ExecuteNonQuery();
                }
                LoadGioHang();
            }
            catch (Exception ex)
            {
                MessageBox.Show("Lỗi cập nhật số lượng:\n" + ex.Message);
            }
        }

        private void btnTang_Click(object sender, EventArgs e) => CapNhatSoLuong(+1);
        private void btnGiam_Click(object sender, EventArgs e) => CapNhatSoLuong(-1);
        private void btnXoaMon_Click(object sender, EventArgs e) => XoaMonKhoiGio();

        // ===================================================
        //  THANH TOÁN
        // ===================================================
        private void btnThanhToan_Click(object sender, EventArgs e)
        {
            if (lbGioHang.Items.Count == 0)
            {
                MessageBox.Show("Giỏ hàng đang trống!", "Thông báo",
                    MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return;
            }

            decimal tongTien = 0;
            decimal.TryParse(lblTongTien.Text.Replace("đ", "").Replace(",", "").Trim(), out tongTien);

            using (var formTT = new vw_ThanhToan(_maDonHienTai, _maCa, tongTien))
            {
                if (formTT.ShowDialog() == DialogResult.OK)
                {
                    // Thanh toán xong → tạo đơn mới
                    TaoDonHangMoi();
                    LoadGioHang();
                }
            }
        }


        // ===================================================
        //  MENU STRIP - Doanh thu / Đơn hàng / Đăng xuất
        // ===================================================
        private void doanhThuToolStripMenuItem_Click(object sender, EventArgs e)
        {
            var f = new vw_BaoCaoDoanhThu();
            f.StartPosition = FormStartPosition.CenterParent;
            f.ShowDialog();
        }

        private void lichSuDonHangToolStripMenuItem_Click(object sender, EventArgs e)
        {
            var f = new vw_DonHang();
            f.StartPosition = FormStartPosition.CenterParent;
            f.ShowDialog();
        }

        private void dangXuatToolStripMenuItem_Click(object sender, EventArgs e)
        {
            if (MessageBox.Show("Đăng xuất khỏi ca làm việc?", "Xác nhận",
                MessageBoxButtons.YesNo, MessageBoxIcon.Question) == DialogResult.Yes)
            {
                new Login().Show();
                this.Close();
            }
        }

        private void thongTinTaiKhoanToolStripMenuItem_Click(object sender, EventArgs e)
        {
            AccountProfile f = new AccountProfile();
            f.ShowDialog();
        }
    }
}
