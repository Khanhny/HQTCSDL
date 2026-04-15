namespace ProjectQuanLyBanHang
{
    partial class vw_ThanhToan
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
            this.lblThanhToanDon = new System.Windows.Forms.Label();
            this.lblTongCongg = new System.Windows.Forms.Label();
            this.btnTienMat = new System.Windows.Forms.Button();
            this.btnNganHang = new System.Windows.Forms.Button();
            this.btnHuy = new System.Windows.Forms.Button();
            this.btnXacNhan = new System.Windows.Forms.Button();
            this.SuspendLayout();
            // 
            // lblThanhToanDon
            // 
            this.lblThanhToanDon.AutoSize = true;
            this.lblThanhToanDon.Font = new System.Drawing.Font("Segoe UI", 19.8F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblThanhToanDon.Location = new System.Drawing.Point(12, 20);
            this.lblThanhToanDon.Name = "lblThanhToanDon";
            this.lblThanhToanDon.Size = new System.Drawing.Size(200, 45);
            this.lblThanhToanDon.TabIndex = 0;
            this.lblThanhToanDon.Text = "Thanh Toán";
            this.lblThanhToanDon.TextAlign = System.Drawing.ContentAlignment.MiddleCenter;
            // 
            // lblTongCongg
            // 
            this.lblTongCongg.AutoSize = true;
            this.lblTongCongg.Font = new System.Drawing.Font("Segoe UI", 16.2F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblTongCongg.Location = new System.Drawing.Point(12, 75);
            this.lblTongCongg.Name = "lblTongCongg";
            this.lblTongCongg.Size = new System.Drawing.Size(156, 38);
            this.lblTongCongg.TabIndex = 1;
            this.lblTongCongg.Text = "Tổng Tiền:";
            this.lblTongCongg.TextAlign = System.Drawing.ContentAlignment.MiddleCenter;
            // 
            // btnTienMat
            // 
            this.btnTienMat.FlatStyle = System.Windows.Forms.FlatStyle.System;
            this.btnTienMat.Font = new System.Drawing.Font("Segoe UI Semibold", 18F, ((System.Drawing.FontStyle)((System.Drawing.FontStyle.Bold | System.Drawing.FontStyle.Italic))), System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnTienMat.Location = new System.Drawing.Point(85, 171);
            this.btnTienMat.Name = "btnTienMat";
            this.btnTienMat.Size = new System.Drawing.Size(148, 71);
            this.btnTienMat.TabIndex = 2;
            this.btnTienMat.Text = "Tiền Mặt";
            this.btnTienMat.UseVisualStyleBackColor = true;
            this.btnTienMat.Click += new System.EventHandler(this.btnTienMat_Click);
            // 
            // btnNganHang
            // 
            this.btnNganHang.FlatStyle = System.Windows.Forms.FlatStyle.System;
            this.btnNganHang.Font = new System.Drawing.Font("Segoe UI Semibold", 18F, ((System.Drawing.FontStyle)((System.Drawing.FontStyle.Bold | System.Drawing.FontStyle.Italic))), System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnNganHang.Location = new System.Drawing.Point(323, 171);
            this.btnNganHang.Name = "btnNganHang";
            this.btnNganHang.Size = new System.Drawing.Size(165, 71);
            this.btnNganHang.TabIndex = 3;
            this.btnNganHang.Text = "Ngân Hàng";
            this.btnNganHang.UseVisualStyleBackColor = true;
            this.btnNganHang.Click += new System.EventHandler(this.btnNganHang_Click);
            // 
            // btnHuy
            // 
            this.btnHuy.FlatStyle = System.Windows.Forms.FlatStyle.System;
            this.btnHuy.Font = new System.Drawing.Font("Segoe UI Semibold", 18F, ((System.Drawing.FontStyle)((System.Drawing.FontStyle.Bold | System.Drawing.FontStyle.Italic))), System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnHuy.Location = new System.Drawing.Point(56, 330);
            this.btnHuy.Name = "btnHuy";
            this.btnHuy.Size = new System.Drawing.Size(142, 53);
            this.btnHuy.TabIndex = 4;
            this.btnHuy.Text = "Hủy";
            this.btnHuy.UseVisualStyleBackColor = true;
            // 
            // btnXacNhan
            // 
            this.btnXacNhan.FlatStyle = System.Windows.Forms.FlatStyle.System;
            this.btnXacNhan.Font = new System.Drawing.Font("Segoe UI Semibold", 18F, ((System.Drawing.FontStyle)((System.Drawing.FontStyle.Bold | System.Drawing.FontStyle.Italic))), System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnXacNhan.Location = new System.Drawing.Point(266, 330);
            this.btnXacNhan.Name = "btnXacNhan";
            this.btnXacNhan.Size = new System.Drawing.Size(339, 53);
            this.btnXacNhan.TabIndex = 5;
            this.btnXacNhan.Text = "Xác Nhận Thanh Toán";
            this.btnXacNhan.UseVisualStyleBackColor = true;
            this.btnXacNhan.Click += new System.EventHandler(this.btnXacNhan_Click);
            // 
            // vw_ThanhToan
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(617, 450);
            this.Controls.Add(this.btnXacNhan);
            this.Controls.Add(this.btnHuy);
            this.Controls.Add(this.btnNganHang);
            this.Controls.Add(this.btnTienMat);
            this.Controls.Add(this.lblTongCongg);
            this.Controls.Add(this.lblThanhToanDon);
            this.Name = "vw_ThanhToan";
            this.Text = "vw_ThanhToan";
            this.Load += new System.EventHandler(this.vw_ThanhToan_Load);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label lblThanhToanDon;
        private System.Windows.Forms.Label lblTongCongg;
        private System.Windows.Forms.Button btnTienMat;
        private System.Windows.Forms.Button btnNganHang;
        private System.Windows.Forms.Button btnHuy;
        private System.Windows.Forms.Button btnXacNhan;
    }
}