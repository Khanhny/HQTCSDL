namespace ProjectQuanLyBanHang
{
    partial class vw_ThanhCong
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(vw_ThanhCong));
            this.lblThanhCong = new System.Windows.Forms.Label();
            this.lblChiTiet = new System.Windows.Forms.Label();
            this.btnDong = new System.Windows.Forms.Button();
            this.pictureBox1 = new System.Windows.Forms.PictureBox();
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox1)).BeginInit();
            this.SuspendLayout();
            // 
            // lblThanhCong
            // 
            this.lblThanhCong.AutoSize = true;
            this.lblThanhCong.Font = new System.Drawing.Font("Segoe UI", 18F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblThanhCong.ForeColor = System.Drawing.Color.LimeGreen;
            this.lblThanhCong.Location = new System.Drawing.Point(34, 249);
            this.lblThanhCong.Name = "lblThanhCong";
            this.lblThanhCong.Size = new System.Drawing.Size(369, 41);
            this.lblThanhCong.TabIndex = 1;
            this.lblThanhCong.Text = "Thanh Toán Thành Công!";
            this.lblThanhCong.Click += new System.EventHandler(this.lblThanhCong_Click);
            // 
            // lblChiTiet
            // 
            this.lblChiTiet.AutoSize = true;
            this.lblChiTiet.Font = new System.Drawing.Font("Segoe UI", 13.8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblChiTiet.ForeColor = System.Drawing.Color.LimeGreen;
            this.lblChiTiet.Location = new System.Drawing.Point(110, 290);
            this.lblChiTiet.Name = "lblChiTiet";
            this.lblChiTiet.Size = new System.Drawing.Size(76, 31);
            this.lblChiTiet.TabIndex = 2;
            this.lblChiTiet.Text = "label1";
            // 
            // btnDong
            // 
            this.btnDong.Font = new System.Drawing.Font("Segoe UI", 19.8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnDong.Location = new System.Drawing.Point(41, 362);
            this.btnDong.Name = "btnDong";
            this.btnDong.Size = new System.Drawing.Size(322, 55);
            this.btnDong.TabIndex = 3;
            this.btnDong.Text = "Đóng";
            this.btnDong.UseVisualStyleBackColor = true;
            this.btnDong.Click += new System.EventHandler(this.btnDong_Click);
            // 
            // pictureBox1
            // 
            this.pictureBox1.Image = ((System.Drawing.Image)(resources.GetObject("pictureBox1.Image")));
            this.pictureBox1.Location = new System.Drawing.Point(64, 12);
            this.pictureBox1.Name = "pictureBox1";
            this.pictureBox1.Size = new System.Drawing.Size(272, 234);
            this.pictureBox1.TabIndex = 0;
            this.pictureBox1.TabStop = false;
            this.pictureBox1.Click += new System.EventHandler(this.pictureBox1_Click);
            // 
            // vw_ThanhCong
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(429, 442);
            this.Controls.Add(this.btnDong);
            this.Controls.Add(this.lblChiTiet);
            this.Controls.Add(this.lblThanhCong);
            this.Controls.Add(this.pictureBox1);
            this.Name = "vw_ThanhCong";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "vw_ThanhCong";
            this.Load += new System.EventHandler(this.vw_ThanhCong_Load);
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox1)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion
        private System.Windows.Forms.Label lblThanhCong;
        private System.Windows.Forms.Label lblChiTiet;
        private System.Windows.Forms.Button btnDong;
        private System.Windows.Forms.PictureBox pictureBox1;
    }
}