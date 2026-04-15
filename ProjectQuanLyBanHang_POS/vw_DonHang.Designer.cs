namespace ProjectQuanLyBanHang
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
            this.lblDanhSachDon = new System.Windows.Forms.Label();
            this.lblChiTietDon = new System.Windows.Forms.Label();
            this.dgvChiTiet = new System.Windows.Forms.DataGridView();
            this.lblTonggCong = new System.Windows.Forms.Label();
            this.btnInLai = new System.Windows.Forms.Button();
            this.dgvDanhSachDon = new System.Windows.Forms.DataGridView();
            ((System.ComponentModel.ISupportInitialize)(this.dgvChiTiet)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.dgvDanhSachDon)).BeginInit();
            this.SuspendLayout();
            // 
            // lblDanhSachDon
            // 
            this.lblDanhSachDon.AutoSize = true;
            this.lblDanhSachDon.FlatStyle = System.Windows.Forms.FlatStyle.System;
            this.lblDanhSachDon.Font = new System.Drawing.Font("Segoe UI Semibold", 16.2F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblDanhSachDon.Location = new System.Drawing.Point(3, 9);
            this.lblDanhSachDon.Name = "lblDanhSachDon";
            this.lblDanhSachDon.Size = new System.Drawing.Size(289, 38);
            this.lblDanhSachDon.TabIndex = 0;
            this.lblDanhSachDon.Text = "Danh Sách Đơn Hàng";
            // 
            // lblChiTietDon
            // 
            this.lblChiTietDon.AutoSize = true;
            this.lblChiTietDon.FlatStyle = System.Windows.Forms.FlatStyle.System;
            this.lblChiTietDon.Font = new System.Drawing.Font("Segoe UI Semibold", 16.2F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblChiTietDon.Location = new System.Drawing.Point(355, 9);
            this.lblChiTietDon.Name = "lblChiTietDon";
            this.lblChiTietDon.Size = new System.Drawing.Size(250, 38);
            this.lblChiTietDon.TabIndex = 1;
            this.lblChiTietDon.Text = "Chi Tiết Đơn Hàng";
            // 
            // dgvChiTiet
            // 
            this.dgvChiTiet.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgvChiTiet.Location = new System.Drawing.Point(355, 50);
            this.dgvChiTiet.Name = "dgvChiTiet";
            this.dgvChiTiet.RowHeadersWidth = 51;
            this.dgvChiTiet.RowTemplate.Height = 24;
            this.dgvChiTiet.Size = new System.Drawing.Size(544, 380);
            this.dgvChiTiet.TabIndex = 3;
            // 
            // lblTonggCong
            // 
            this.lblTonggCong.AutoSize = true;
            this.lblTonggCong.Font = new System.Drawing.Font("Segoe UI Semibold", 16.2F, ((System.Drawing.FontStyle)((System.Drawing.FontStyle.Bold | System.Drawing.FontStyle.Italic))), System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblTonggCong.Location = new System.Drawing.Point(355, 448);
            this.lblTonggCong.Name = "lblTonggCong";
            this.lblTonggCong.Size = new System.Drawing.Size(162, 38);
            this.lblTonggCong.TabIndex = 4;
            this.lblTonggCong.Text = "Tổng Cộng:";
            // 
            // btnInLai
            // 
            this.btnInLai.FlatStyle = System.Windows.Forms.FlatStyle.System;
            this.btnInLai.Font = new System.Drawing.Font("Segoe UI Semibold", 13.8F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnInLai.Location = new System.Drawing.Point(712, 448);
            this.btnInLai.Name = "btnInLai";
            this.btnInLai.Size = new System.Drawing.Size(178, 38);
            this.btnInLai.TabIndex = 5;
            this.btnInLai.Text = "In Lại Hóa Đơn";
            this.btnInLai.UseVisualStyleBackColor = true;
            // 
            // dgvDanhSachDon
            // 
            this.dgvDanhSachDon.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgvDanhSachDon.Location = new System.Drawing.Point(0, 50);
            this.dgvDanhSachDon.Name = "dgvDanhSachDon";
            this.dgvDanhSachDon.RowHeadersWidth = 51;
            this.dgvDanhSachDon.RowTemplate.Height = 24;
            this.dgvDanhSachDon.Size = new System.Drawing.Size(349, 436);
            this.dgvDanhSachDon.TabIndex = 6;
            // 
            // vw_DonHang
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(902, 492);
            this.Controls.Add(this.dgvDanhSachDon);
            this.Controls.Add(this.btnInLai);
            this.Controls.Add(this.lblTonggCong);
            this.Controls.Add(this.dgvChiTiet);
            this.Controls.Add(this.lblChiTietDon);
            this.Controls.Add(this.lblDanhSachDon);
            this.Name = "vw_DonHang";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterParent;
            this.Text = "vw_DonHang";
            this.Load += new System.EventHandler(this.vw_DonHang_Load);
            ((System.ComponentModel.ISupportInitialize)(this.dgvChiTiet)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.dgvDanhSachDon)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label lblDanhSachDon;
        private System.Windows.Forms.Label lblChiTietDon;
        private System.Windows.Forms.DataGridView dgvChiTiet;
        private System.Windows.Forms.Label lblTonggCong;
        private System.Windows.Forms.Button btnInLai;
        private System.Windows.Forms.DataGridView dgvDanhSachDon;
    }
}