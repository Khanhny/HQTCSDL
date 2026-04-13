namespace POS
{
    partial class vw_SanPham
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            lb_TenSanPham = new Label();
            lb_Gia = new Label();
            num_SoLuong = new NumericUpDown();
            rbtn_S = new RadioButton();
            rbtn_M = new RadioButton();
            rbtn_L = new RadioButton();
            btn_ThemVaoDonHang = new Button();
            btn_ThemSanPhamKhac = new Button();
            dataGridView1 = new DataGridView();
            col_TenSanPham = new DataGridViewTextBoxColumn();
            col_Size = new DataGridViewTextBoxColumn();
            col_DonGia = new DataGridViewTextBoxColumn();
            btn_DenViewChiTietDon = new Button();
            btn_LayGiaHienTai = new Button();
            lb_SoLuong = new Label();
            lb_Size = new Label();
            ((System.ComponentModel.ISupportInitialize)num_SoLuong).BeginInit();
            ((System.ComponentModel.ISupportInitialize)dataGridView1).BeginInit();
            SuspendLayout();
            // 
            // lb_TenSanPham
            // 
            lb_TenSanPham.AutoSize = true;
            lb_TenSanPham.Font = new Font("Agency FB", 19.8000011F, FontStyle.Bold, GraphicsUnit.Point, 0);
            lb_TenSanPham.Location = new Point(282, 55);
            lb_TenSanPham.Name = "lb_TenSanPham";
            lb_TenSanPham.Size = new Size(77, 41);
            lb_TenSanPham.TabIndex = 0;
            lb_TenSanPham.Text = "label1";
            // 
            // lb_Gia
            // 
            lb_Gia.AutoSize = true;
            lb_Gia.Location = new Point(2, 164);
            lb_Gia.Name = "lb_Gia";
            lb_Gia.Size = new Size(88, 20);
            lb_Gia.TabIndex = 1;
            lb_Gia.Text = "Giá hiện tại ";
            lb_Gia.TextAlign = ContentAlignment.BottomCenter;
            // 
            // num_SoLuong
            // 
            num_SoLuong.Location = new Point(96, 204);
            num_SoLuong.Name = "num_SoLuong";
            num_SoLuong.Size = new Size(150, 27);
            num_SoLuong.TabIndex = 2;
            // 
            // rbtn_S
            // 
            rbtn_S.AutoSize = true;
            rbtn_S.Location = new Point(96, 273);
            rbtn_S.Name = "rbtn_S";
            rbtn_S.Size = new Size(38, 24);
            rbtn_S.TabIndex = 3;
            rbtn_S.TabStop = true;
            rbtn_S.Text = "S";
            rbtn_S.UseVisualStyleBackColor = true;
            rbtn_S.CheckedChanged += rbtn_S_CheckedChanged;
            // 
            // rbtn_M
            // 
            rbtn_M.AutoSize = true;
            rbtn_M.Location = new Point(167, 273);
            rbtn_M.Name = "rbtn_M";
            rbtn_M.Size = new Size(43, 24);
            rbtn_M.TabIndex = 4;
            rbtn_M.TabStop = true;
            rbtn_M.Text = "M";
            rbtn_M.UseVisualStyleBackColor = true;
            rbtn_M.CheckedChanged += radioButton2_CheckedChanged;
            // 
            // rbtn_L
            // 
            rbtn_L.AutoSize = true;
            rbtn_L.Location = new Point(238, 273);
            rbtn_L.Name = "rbtn_L";
            rbtn_L.Size = new Size(37, 24);
            rbtn_L.TabIndex = 5;
            rbtn_L.TabStop = true;
            rbtn_L.Text = "L";
            rbtn_L.UseVisualStyleBackColor = true;
            rbtn_L.CheckedChanged += rbtn_L_CheckedChanged;
            // 
            // btn_ThemVaoDonHang
            // 
            btn_ThemVaoDonHang.BackColor = Color.FromArgb(128, 255, 128);
            btn_ThemVaoDonHang.Font = new Font("Segoe UI", 22.2F, FontStyle.Bold, GraphicsUnit.Point, 0);
            btn_ThemVaoDonHang.ImageAlign = ContentAlignment.TopRight;
            btn_ThemVaoDonHang.Location = new Point(83, 317);
            btn_ThemVaoDonHang.Name = "btn_ThemVaoDonHang";
            btn_ThemVaoDonHang.Size = new Size(66, 48);
            btn_ThemVaoDonHang.TabIndex = 6;
            btn_ThemVaoDonHang.Text = "+";
            btn_ThemVaoDonHang.UseVisualStyleBackColor = false;
            btn_ThemVaoDonHang.Click += btn_DenViewChiTietDonHang_Click;
            // 
            // btn_ThemSanPhamKhac
            // 
            btn_ThemSanPhamKhac.BackColor = SystemColors.ActiveCaption;
            btn_ThemSanPhamKhac.Location = new Point(604, 351);
            btn_ThemSanPhamKhac.Name = "btn_ThemSanPhamKhac";
            btn_ThemSanPhamKhac.Size = new Size(184, 29);
            btn_ThemSanPhamKhac.TabIndex = 12;
            btn_ThemSanPhamKhac.Text = "Quay lại Menu";
            btn_ThemSanPhamKhac.UseVisualStyleBackColor = false;
            btn_ThemSanPhamKhac.Click += btn_ThemSanPhamKhac_Click;
            // 
            // dataGridView1
            // 
            dataGridView1.ColumnHeadersHeightSizeMode = DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            dataGridView1.Columns.AddRange(new DataGridViewColumn[] { col_TenSanPham, col_Size, col_DonGia });
            dataGridView1.Location = new Point(346, 122);
            dataGridView1.Name = "dataGridView1";
            dataGridView1.RowHeadersWidth = 51;
            dataGridView1.Size = new Size(405, 188);
            dataGridView1.TabIndex = 13;
            dataGridView1.CellContentClick += dataGridView1_CellContentClick;
            // 
            // col_TenSanPham
            // 
            col_TenSanPham.HeaderText = "Tên Món";
            col_TenSanPham.MinimumWidth = 6;
            col_TenSanPham.Name = "col_TenSanPham";
            col_TenSanPham.Width = 125;
            // 
            // col_Size
            // 
            col_Size.HeaderText = "Size";
            col_Size.MinimumWidth = 6;
            col_Size.Name = "col_Size";
            col_Size.Width = 125;
            // 
            // col_DonGia
            // 
            col_DonGia.HeaderText = "Đơn Giá";
            col_DonGia.MinimumWidth = 6;
            col_DonGia.Name = "col_DonGia";
            col_DonGia.Width = 125;
            // 
            // btn_DenViewChiTietDon
            // 
            btn_DenViewChiTietDon.BackColor = Color.LightCoral;
            btn_DenViewChiTietDon.Location = new Point(604, 386);
            btn_DenViewChiTietDon.Name = "btn_DenViewChiTietDon";
            btn_DenViewChiTietDon.Size = new Size(94, 29);
            btn_DenViewChiTietDon.TabIndex = 14;
            btn_DenViewChiTietDon.Text = "Xong";
            btn_DenViewChiTietDon.UseVisualStyleBackColor = false;
            btn_DenViewChiTietDon.Click += button1_Click;
            // 
            // btn_LayGiaHienTai
            // 
            btn_LayGiaHienTai.Location = new Point(96, 160);
            btn_LayGiaHienTai.Name = "btn_LayGiaHienTai";
            btn_LayGiaHienTai.Size = new Size(94, 29);
            btn_LayGiaHienTai.TabIndex = 15;
            btn_LayGiaHienTai.Text = "  ";
            btn_LayGiaHienTai.UseVisualStyleBackColor = true;
            btn_LayGiaHienTai.Click += btn_LayGiaHienTai_Click;
            // 
            // lb_SoLuong
            // 
            lb_SoLuong.AutoSize = true;
            lb_SoLuong.Location = new Point(2, 206);
            lb_SoLuong.Name = "lb_SoLuong";
            lb_SoLuong.Size = new Size(69, 20);
            lb_SoLuong.TabIndex = 16;
            lb_SoLuong.Text = "Số lượng";
            lb_SoLuong.TextAlign = ContentAlignment.BottomCenter;
            lb_SoLuong.Click += label1_Click;
            // 
            // lb_Size
            // 
            lb_Size.AutoSize = true;
            lb_Size.Location = new Point(2, 273);
            lb_Size.Name = "lb_Size";
            lb_Size.Size = new Size(36, 20);
            lb_Size.TabIndex = 17;
            lb_Size.Text = "Size";
            lb_Size.TextAlign = ContentAlignment.BottomCenter;
            // 
            // vw_SanPham
            // 
            AutoScaleDimensions = new SizeF(8F, 20F);
            AutoScaleMode = AutoScaleMode.Font;
            ClientSize = new Size(800, 450);
            Controls.Add(lb_Size);
            Controls.Add(lb_SoLuong);
            Controls.Add(btn_LayGiaHienTai);
            Controls.Add(btn_DenViewChiTietDon);
            Controls.Add(dataGridView1);
            Controls.Add(btn_ThemSanPhamKhac);
            Controls.Add(btn_ThemVaoDonHang);
            Controls.Add(rbtn_L);
            Controls.Add(rbtn_M);
            Controls.Add(rbtn_S);
            Controls.Add(num_SoLuong);
            Controls.Add(lb_Gia);
            Controls.Add(lb_TenSanPham);
            Name = "vw_SanPham";
            Text = "vw_SanPham";
            ((System.ComponentModel.ISupportInitialize)num_SoLuong).EndInit();
            ((System.ComponentModel.ISupportInitialize)dataGridView1).EndInit();
            ResumeLayout(false);
            PerformLayout();
        }

        #endregion
        private Label lb_Gia;
        private NumericUpDown num_SoLuong;
        private RadioButton rbtn_S;
        private RadioButton rbtn_M;
        private RadioButton rbtn_L;
        private Button btn_ThemVaoDonHang;
        public Label lb_TenSanPham;
        private Button btn_ThemSanPhamKhac;
        private DataGridView dataGridView1;
        private DataGridViewTextBoxColumn col_TenSanPham;
        private DataGridViewTextBoxColumn col_Size;
        private DataGridViewTextBoxColumn col_DonGia;
        private Button btn_DenViewChiTietDon;
        private Button btn_LayGiaHienTai;
        private Label lb_SoLuong;
        private Label lb_Size;
    }
}