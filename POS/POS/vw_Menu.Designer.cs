namespace POS
{
    partial class vw_Menu
    {
        private System.ComponentModel.IContainer components = null;

        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null)) components.Dispose();
            base.Dispose(disposing);
        }

        private void InitializeComponent()
        {
            btn_CaPheDen = new Button();
            btn_CaPheSua = new Button();
            btn_Americano = new Button();
            btn_TraSuaTruyenThong = new Button();
            btn_TraSuaOlong = new Button();
            btn_TraNho = new Button();
            btn_TraVai = new Button();
            btn_TraDao = new Button();
            btn_TraDau = new Button();
            btn_TraMangCau = new Button();
            btn_MatchaLatte = new Button();
            btn_MatchaDau = new Button();
            txtb_Menu = new TextBox();
            SuspendLayout();
            // 
            // btn_CaPheDen
            // 
            btn_CaPheDen.Location = new Point(461, 53);
            btn_CaPheDen.Name = "btn_CaPheDen";
            btn_CaPheDen.Size = new Size(157, 37);
            btn_CaPheDen.TabIndex = 0;
            btn_CaPheDen.Text = "Cà phê đen";
            btn_CaPheDen.Click += ChonMon_Click;
            // 
            // btn_CaPheSua
            // 
            btn_CaPheSua.Location = new Point(622, 53);
            btn_CaPheSua.Name = "btn_CaPheSua";
            btn_CaPheSua.Size = new Size(157, 37);
            btn_CaPheSua.TabIndex = 1;
            btn_CaPheSua.Text = "Cà phê sữa";
            btn_CaPheSua.Click += ChonMon_Click;
            // 
            // btn_Americano
            // 
            btn_Americano.Location = new Point(461, 96);
            btn_Americano.Name = "btn_Americano";
            btn_Americano.Size = new Size(157, 37);
            btn_Americano.TabIndex = 2;
            btn_Americano.Text = "Americano";
            btn_Americano.Click += button3_Click;
            // 
            // btn_TraSuaTruyenThong
            // 
            btn_TraSuaTruyenThong.Location = new Point(622, 96);
            btn_TraSuaTruyenThong.Name = "btn_TraSuaTruyenThong";
            btn_TraSuaTruyenThong.Size = new Size(157, 36);
            btn_TraSuaTruyenThong.TabIndex = 0;
            btn_TraSuaTruyenThong.Text = "Trà sữa truyền thống";
            btn_TraSuaTruyenThong.Click += ChonMon_Click;
            // 
            // btn_TraSuaOlong
            // 
            btn_TraSuaOlong.Location = new Point(461, 138);
            btn_TraSuaOlong.Name = "btn_TraSuaOlong";
            btn_TraSuaOlong.Size = new Size(157, 36);
            btn_TraSuaOlong.TabIndex = 3;
            btn_TraSuaOlong.Text = "Trà sữa Olong";
            btn_TraSuaOlong.Click += ChonMon_Click;
            // 
            // btn_TraNho
            // 
            btn_TraNho.Location = new Point(461, 264);
            btn_TraNho.Name = "btn_TraNho";
            btn_TraNho.Size = new Size(157, 36);
            btn_TraNho.TabIndex = 4;
            btn_TraNho.Text = "Trà nho";
            btn_TraNho.Click += ChonMon_Click;
            // 
            // btn_TraVai
            // 
            btn_TraVai.Location = new Point(624, 264);
            btn_TraVai.Name = "btn_TraVai";
            btn_TraVai.Size = new Size(155, 36);
            btn_TraVai.TabIndex = 8;
            btn_TraVai.Text = "Trà vải";
            btn_TraVai.Click += ChonMon_Click;
            // 
            // btn_TraDao
            // 
            btn_TraDao.Location = new Point(624, 222);
            btn_TraDao.Name = "btn_TraDao";
            btn_TraDao.Size = new Size(155, 36);
            btn_TraDao.TabIndex = 6;
            btn_TraDao.Text = "Trà đào";
            btn_TraDao.Click += ChonMon_Click;
            // 
            // btn_TraDau
            // 
            btn_TraDau.Location = new Point(461, 222);
            btn_TraDau.Name = "btn_TraDau";
            btn_TraDau.Size = new Size(157, 36);
            btn_TraDau.TabIndex = 5;
            btn_TraDau.Text = "Trà dâu";
            btn_TraDau.Click += ChonMon_Click;
            // 
            // btn_TraMangCau
            // 
            btn_TraMangCau.Location = new Point(624, 180);
            btn_TraMangCau.Name = "btn_TraMangCau";
            btn_TraMangCau.Size = new Size(155, 36);
            btn_TraMangCau.TabIndex = 7;
            btn_TraMangCau.Text = "Trà mãng cầu";
            btn_TraMangCau.Click += ChonMon_Click;
            // 
            // btn_MatchaLatte
            // 
            btn_MatchaLatte.Location = new Point(461, 180);
            btn_MatchaLatte.Name = "btn_MatchaLatte";
            btn_MatchaLatte.Size = new Size(157, 32);
            btn_MatchaLatte.TabIndex = 9;
            btn_MatchaLatte.Text = "Matcha Latte";
            btn_MatchaLatte.Click += ChonMon_Click;
            // 
            // btn_MatchaDau
            // 
            btn_MatchaDau.Location = new Point(624, 142);
            btn_MatchaDau.Name = "btn_MatchaDau";
            btn_MatchaDau.Size = new Size(155, 32);
            btn_MatchaDau.TabIndex = 10;
            btn_MatchaDau.Text = "Matcha dâu";
            btn_MatchaDau.Click += ChonMon_Click;
            // 
            // txtb_Menu
            // 
            txtb_Menu.BorderStyle = BorderStyle.FixedSingle;
            txtb_Menu.Font = new Font("Segoe UI", 28.2F, FontStyle.Bold, GraphicsUnit.Point, 0);
            txtb_Menu.Location = new Point(25, 152);
            txtb_Menu.Name = "txtb_Menu";
            txtb_Menu.Size = new Size(402, 70);
            txtb_Menu.TabIndex = 0;
            txtb_Menu.Text = "MENU";
            txtb_Menu.TextAlign = HorizontalAlignment.Center;
            // 
            // vw_Menu
            // 
            AutoScaleDimensions = new SizeF(8F, 20F);
            AutoScaleMode = AutoScaleMode.Font;
            ClientSize = new Size(800, 450);
            Controls.Add(btn_Americano);
            Controls.Add(btn_MatchaDau);
            Controls.Add(btn_TraVai);
            Controls.Add(btn_TraMangCau);
            Controls.Add(btn_MatchaLatte);
            Controls.Add(btn_TraDao);
            Controls.Add(btn_TraDau);
            Controls.Add(btn_TraNho);
            Controls.Add(btn_TraSuaTruyenThong);
            Controls.Add(btn_TraSuaOlong);
            Controls.Add(btn_CaPheSua);
            Controls.Add(btn_CaPheDen);
            Controls.Add(txtb_Menu);
            Name = "vw_Menu";
            Text = "Menu";
            Load += vw_Menu_Load;
            ResumeLayout(false);
            PerformLayout();
        }

        private System.Windows.Forms.TextBox txtb_Menu;
        private System.Windows.Forms.Button btn_CaPheDen;
        private DataGridView dgv_SanPham;
        private Button btn_MatchaDau;
        private Button btn_MatchaLatte;
        private Button btn_TraVai;
        private Button btn_TraMangCau;
        private Button btn_TraDao;
        private Button btn_TraDau;
        private Button btn_TraNho;
        private Button btn_TraSuaTruyenThong;
        private Button btn_TraSuaOlong;
        private Button btn_Americano;
        private Button btn_CaPheSua;
    }
}