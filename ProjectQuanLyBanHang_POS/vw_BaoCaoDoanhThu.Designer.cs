namespace ProjectQuanLyBanHang
{
    partial class vw_BaoCaoDoanhThu
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
            this.panel1 = new System.Windows.Forms.Panel();
            this.btnXem = new System.Windows.Forms.Button();
            this.lbCa = new System.Windows.Forms.Label();
            this.cboChonCa = new System.Windows.Forms.ComboBox();
            this.radNgay = new System.Windows.Forms.RadioButton();
            this.radGio = new System.Windows.Forms.RadioButton();
            this.radCa = new System.Windows.Forms.RadioButton();
            this.dtpNgay = new System.Windows.Forms.DateTimePicker();
            this.panel2 = new System.Windows.Forms.Panel();
            this.dgvBaoCao = new System.Windows.Forms.DataGridView();
            this.panel3 = new System.Windows.Forms.Panel();
            this.lblTongCong = new System.Windows.Forms.Label();
            this.label1 = new System.Windows.Forms.Label();
            this.panel1.SuspendLayout();
            this.panel2.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dgvBaoCao)).BeginInit();
            this.panel3.SuspendLayout();
            this.SuspendLayout();
            // 
            // panel1
            // 
            this.panel1.Controls.Add(this.btnXem);
            this.panel1.Controls.Add(this.lbCa);
            this.panel1.Controls.Add(this.cboChonCa);
            this.panel1.Controls.Add(this.radNgay);
            this.panel1.Controls.Add(this.radGio);
            this.panel1.Controls.Add(this.radCa);
            this.panel1.Controls.Add(this.dtpNgay);
            this.panel1.Location = new System.Drawing.Point(0, 3);
            this.panel1.Name = "panel1";
            this.panel1.Size = new System.Drawing.Size(950, 51);
            this.panel1.TabIndex = 1;
            // 
            // btnXem
            // 
            this.btnXem.Font = new System.Drawing.Font("Arial Black", 13.8F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnXem.Location = new System.Drawing.Point(746, 5);
            this.btnXem.Name = "btnXem";
            this.btnXem.Size = new System.Drawing.Size(200, 40);
            this.btnXem.TabIndex = 6;
            this.btnXem.Text = "Xem Báo Cáo";
            this.btnXem.UseVisualStyleBackColor = true;
            this.btnXem.Click += new System.EventHandler(this.btnXemBaoCao_Click);
            // 
            // lbCa
            // 
            this.lbCa.AutoSize = true;
            this.lbCa.Font = new System.Drawing.Font("Arial Narrow", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lbCa.Location = new System.Drawing.Point(571, 18);
            this.lbCa.Name = "lbCa";
            this.lbCa.Size = new System.Drawing.Size(31, 24);
            this.lbCa.TabIndex = 5;
            this.lbCa.Text = "Ca";
            // 
            // cboChonCa
            // 
            this.cboChonCa.FormattingEnabled = true;
            this.cboChonCa.Location = new System.Drawing.Point(608, 18);
            this.cboChonCa.Name = "cboChonCa";
            this.cboChonCa.Size = new System.Drawing.Size(121, 24);
            this.cboChonCa.TabIndex = 4;
            // 
            // radNgay
            // 
            this.radNgay.AutoSize = true;
            this.radNgay.Font = new System.Drawing.Font("Arial Narrow", 10.2F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.radNgay.Location = new System.Drawing.Point(476, 18);
            this.radNgay.Name = "radNgay";
            this.radNgay.Size = new System.Drawing.Size(66, 26);
            this.radNgay.TabIndex = 3;
            this.radNgay.TabStop = true;
            this.radNgay.Text = "Ngày";
            this.radNgay.UseVisualStyleBackColor = true;
            this.radNgay.CheckedChanged += new System.EventHandler(this.rbCa_CheckedChanged);
            // 
            // radGio
            // 
            this.radGio.AutoSize = true;
            this.radGio.Font = new System.Drawing.Font("Arial Narrow", 10.2F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.radGio.Location = new System.Drawing.Point(390, 18);
            this.radGio.Name = "radGio";
            this.radGio.Size = new System.Drawing.Size(56, 26);
            this.radGio.TabIndex = 2;
            this.radGio.TabStop = true;
            this.radGio.Text = "Giờ";
            this.radGio.UseVisualStyleBackColor = true;
            this.radGio.CheckedChanged += new System.EventHandler(this.rbCa_CheckedChanged);
            // 
            // radCa
            // 
            this.radCa.AutoSize = true;
            this.radCa.Font = new System.Drawing.Font("Arial Narrow", 10.2F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.radCa.Location = new System.Drawing.Point(312, 18);
            this.radCa.Name = "radCa";
            this.radCa.Size = new System.Drawing.Size(49, 26);
            this.radCa.TabIndex = 1;
            this.radCa.TabStop = true;
            this.radCa.Text = "Ca";
            this.radCa.UseVisualStyleBackColor = true;
            // 
            // dtpNgay
            // 
            this.dtpNgay.Font = new System.Drawing.Font("Arial Narrow", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.dtpNgay.Location = new System.Drawing.Point(5, 14);
            this.dtpNgay.Name = "dtpNgay";
            this.dtpNgay.Size = new System.Drawing.Size(280, 30);
            this.dtpNgay.TabIndex = 0;
            // 
            // panel2
            // 
            this.panel2.Controls.Add(this.dgvBaoCao);
            this.panel2.Location = new System.Drawing.Point(0, 54);
            this.panel2.Name = "panel2";
            this.panel2.Size = new System.Drawing.Size(950, 463);
            this.panel2.Anchor = System.Windows.Forms.AnchorStyles.Top
                               | System.Windows.Forms.AnchorStyles.Bottom
                               | System.Windows.Forms.AnchorStyles.Left
                               | System.Windows.Forms.AnchorStyles.Right;
            this.panel2.TabIndex = 2;
            // 
            // dgvBaoCao
            // 
            this.dgvBaoCao.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgvBaoCao.Name = "dgvBaoCao";
            this.dgvBaoCao.RowHeadersWidth = 51;
            this.dgvBaoCao.RowTemplate.Height = 24;
            this.dgvBaoCao.Dock = System.Windows.Forms.DockStyle.Fill;
            this.dgvBaoCao.TabIndex = 4;
            // 
            // panel3
            // 
            this.panel3.Controls.Add(this.label1);
            this.panel3.Controls.Add(this.lblTongCong);
            this.panel3.Location = new System.Drawing.Point(3, 513);
            this.panel3.Name = "panel3";
            this.panel3.Size = new System.Drawing.Size(944, 59);
            this.panel3.TabIndex = 3;
            // 
            // lblTongCong
            // 
            this.lblTongCong.AutoSize = true;
            this.lblTongCong.Font = new System.Drawing.Font("Segoe UI", 16.2F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblTongCong.Location = new System.Drawing.Point(177, 11);
            this.lblTongCong.Name = "lblTongCong";
            this.lblTongCong.Size = new System.Drawing.Size(0, 38);
            this.lblTongCong.TabIndex = 0;
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("Segoe UI", 16.2F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label1.Location = new System.Drawing.Point(3, 11);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(168, 38);
            this.label1.TabIndex = 1;
            this.label1.Text = "Tổng Cộng:";
            // 
            // vw_BaoCaoDoanhThu
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(950, 571);
            this.Controls.Add(this.panel3);
            this.Controls.Add(this.panel2);
            this.Controls.Add(this.panel1);
            this.Name = "vw_BaoCaoDoanhThu";
            this.Text = "vw_BaoCaoDoanhThu";
            this.Load += new System.EventHandler(this.vw_BaoCaoDoanhThu_Load);
            this.panel1.ResumeLayout(false);
            this.panel1.PerformLayout();
            this.panel2.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.dgvBaoCao)).EndInit();
            this.panel3.ResumeLayout(false);
            this.panel3.PerformLayout();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.Panel panel1;
        private System.Windows.Forms.Button btnXem;
        private System.Windows.Forms.Label lbCa;
        private System.Windows.Forms.ComboBox cboChonCa;
        private System.Windows.Forms.RadioButton radNgay;
        private System.Windows.Forms.RadioButton radGio;
        private System.Windows.Forms.RadioButton radCa;
        private System.Windows.Forms.DateTimePicker dtpNgay;
        private System.Windows.Forms.Panel panel2;
        private System.Windows.Forms.DataGridView dgvBaoCao;
        private System.Windows.Forms.Panel panel3;
        private System.Windows.Forms.Label lblTongCong;
        private System.Windows.Forms.Label label1;
    }
}