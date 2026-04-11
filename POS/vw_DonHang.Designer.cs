namespace POS
{
    partial class vw_DonHang
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
            panel1 = new Panel();
            lbDanhSachDonHang = new Label();
            panel2 = new Panel();
            lbChiTiet = new Label();
            panel3 = new Panel();
            lbDonHang = new ListBox();
            panel4 = new Panel();
            btnInLaiHD = new Button();
            lbTongCong = new Label();
            panel5 = new Panel();
            dgvChiTiet = new DataGridView();
            panel1.SuspendLayout();
            panel2.SuspendLayout();
            panel3.SuspendLayout();
            panel4.SuspendLayout();
            panel5.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)dgvChiTiet).BeginInit();
            SuspendLayout();
            // 
            // panel1
            // 
            panel1.Controls.Add(lbDanhSachDonHang);
            panel1.Location = new Point(5, 3);
            panel1.Name = "panel1";
            panel1.Size = new Size(371, 43);
            panel1.TabIndex = 2;
            // 
            // lbDanhSachDonHang
            // 
            lbDanhSachDonHang.AutoSize = true;
            lbDanhSachDonHang.Font = new Font("Segoe UI", 13.8F, FontStyle.Bold, GraphicsUnit.Point);
            lbDanhSachDonHang.Location = new Point(3, 7);
            lbDanhSachDonHang.Name = "lbDanhSachDonHang";
            lbDanhSachDonHang.Size = new Size(242, 31);
            lbDanhSachDonHang.TabIndex = 0;
            lbDanhSachDonHang.Text = "Danh Sách Đơn Hàng";
            // 
            // panel2
            // 
            panel2.Controls.Add(lbChiTiet);
            panel2.Location = new Point(382, 3);
            panel2.Name = "panel2";
            panel2.Size = new Size(477, 43);
            panel2.TabIndex = 3;
            // 
            // lbChiTiet
            // 
            lbChiTiet.AutoSize = true;
            lbChiTiet.Font = new Font("Segoe UI", 13.8F, FontStyle.Bold, GraphicsUnit.Point);
            lbChiTiet.Location = new Point(3, 7);
            lbChiTiet.Name = "lbChiTiet";
            lbChiTiet.Size = new Size(211, 31);
            lbChiTiet.TabIndex = 1;
            lbChiTiet.Text = "Chi Tiết Đơn Hàng";
            // 
            // panel3
            // 
            panel3.Controls.Add(lbDonHang);
            panel3.Location = new Point(5, 46);
            panel3.Name = "panel3";
            panel3.Size = new Size(368, 484);
            panel3.TabIndex = 4;
            // 
            // lbDonHang
            // 
            lbDonHang.Dock = DockStyle.Fill;
            lbDonHang.FormattingEnabled = true;
            lbDonHang.ItemHeight = 20;
            lbDonHang.Location = new Point(0, 0);
            lbDonHang.Name = "lbDonHang";
            lbDonHang.Size = new Size(368, 484);
            lbDonHang.TabIndex = 0;
            lbDonHang.SelectedIndexChanged += lbDonHang_SelectedIndexChanged;
            // 
            // panel4
            // 
            panel4.Controls.Add(btnInLaiHD);
            panel4.Controls.Add(lbTongCong);
            panel4.Location = new Point(379, 473);
            panel4.Name = "panel4";
            panel4.Size = new Size(477, 57);
            panel4.TabIndex = 5;
            // 
            // btnInLaiHD
            // 
            btnInLaiHD.Location = new Point(366, 13);
            btnInLaiHD.Name = "btnInLaiHD";
            btnInLaiHD.Size = new Size(77, 29);
            btnInLaiHD.TabIndex = 1;
            btnInLaiHD.Text = "In Lại";
            btnInLaiHD.UseVisualStyleBackColor = true;
            // 
            // lbTongCong
            // 
            lbTongCong.AutoSize = true;
            lbTongCong.Font = new Font("Segoe UI", 12F, FontStyle.Bold, GraphicsUnit.Point);
            lbTongCong.Location = new Point(6, 14);
            lbTongCong.Name = "lbTongCong";
            lbTongCong.Size = new Size(117, 28);
            lbTongCong.TabIndex = 0;
            lbTongCong.Text = "Tổng cộng:";
            // 
            // panel5
            // 
            panel5.Controls.Add(dgvChiTiet);
            panel5.Location = new Point(379, 46);
            panel5.Name = "panel5";
            panel5.Size = new Size(480, 421);
            panel5.TabIndex = 6;
            // 
            // dgvChiTiet
            // 
            dgvChiTiet.ColumnHeadersHeightSizeMode = DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            dgvChiTiet.Location = new Point(0, 0);
            dgvChiTiet.Name = "dgvChiTiet";
            dgvChiTiet.RowHeadersWidth = 51;
            dgvChiTiet.RowTemplate.Height = 29;
            dgvChiTiet.Size = new Size(480, 421);
            dgvChiTiet.TabIndex = 0;
            // 
            // vw_DonHang
            // 
            AutoScaleDimensions = new SizeF(8F, 20F);
            AutoScaleMode = AutoScaleMode.Font;
            ClientSize = new Size(861, 533);
            Controls.Add(panel5);
            Controls.Add(panel4);
            Controls.Add(panel3);
            Controls.Add(panel2);
            Controls.Add(panel1);
            Name = "vw_DonHang";
            Text = "vw_DonHang";
            Load += vw_DonHang_Load;
            panel1.ResumeLayout(false);
            panel1.PerformLayout();
            panel2.ResumeLayout(false);
            panel2.PerformLayout();
            panel3.ResumeLayout(false);
            panel4.ResumeLayout(false);
            panel4.PerformLayout();
            panel5.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)dgvChiTiet).EndInit();
            ResumeLayout(false);
        }

        #endregion
        private Panel panel1;
        private Panel panel2;
        private Label lbDanhSachDonHang;
        private Label lbChiTiet;
        private Panel panel3;
        private ListBox lbDonHang;
        private Panel panel4;
        private Button btnInLaiHD;
        private Label lbTongCong;
        private Panel panel5;
        private DataGridView dgvChiTiet;
    }
}