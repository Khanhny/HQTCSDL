namespace ProjectQuanLyBanHang
{
    partial class vw_ChonSize
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
            this.lblTenMon = new System.Windows.Forms.Label();
            this.lblSubTitle = new System.Windows.Forms.Label();
            this.btnS = new System.Windows.Forms.Button();
            this.btnCancel = new System.Windows.Forms.Button();
            this.btnThem = new System.Windows.Forms.Button();
            this.btnM = new System.Windows.Forms.Button();
            this.btnL = new System.Windows.Forms.Button();
            this.txbNote = new System.Windows.Forms.TextBox();
            this.nudTangGiam = new System.Windows.Forms.NumericUpDown();
            this.lbSoLuong = new System.Windows.Forms.Label();
            this.lbGhiChu = new System.Windows.Forms.Label();
            ((System.ComponentModel.ISupportInitialize)(this.nudTangGiam)).BeginInit();
            this.SuspendLayout();
            // 
            // lblTenMon
            // 
            this.lblTenMon.AutoSize = true;
            this.lblTenMon.Font = new System.Drawing.Font("Arial", 13.8F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblTenMon.Location = new System.Drawing.Point(12, 9);
            this.lblTenMon.Name = "lblTenMon";
            this.lblTenMon.Size = new System.Drawing.Size(79, 27);
            this.lblTenMon.TabIndex = 0;
            this.lblTenMon.Text = "label1";
            this.lblTenMon.Click += new System.EventHandler(this.lblTenMon_Click);
            // 
            // lblSubTitle
            // 
            this.lblSubTitle.AutoSize = true;
            this.lblSubTitle.Location = new System.Drawing.Point(12, 46);
            this.lblSubTitle.Name = "lblSubTitle";
            this.lblSubTitle.Size = new System.Drawing.Size(128, 16);
            this.lblSubTitle.TabIndex = 1;
            this.lblSubTitle.Text = "Chọn size và ghi chú";
            // 
            // btnS
            // 
            this.btnS.FlatStyle = System.Windows.Forms.FlatStyle.System;
            this.btnS.Font = new System.Drawing.Font("Arial Black", 18F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnS.Location = new System.Drawing.Point(46, 91);
            this.btnS.Name = "btnS";
            this.btnS.Size = new System.Drawing.Size(126, 96);
            this.btnS.TabIndex = 2;
            this.btnS.Text = "size S";
            this.btnS.UseVisualStyleBackColor = true;
            this.btnS.Click += new System.EventHandler(this.btnS_Click);
            // 
            // btnCancel
            // 
            this.btnCancel.Font = new System.Drawing.Font("Arial", 16.2F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnCancel.Location = new System.Drawing.Point(59, 359);
            this.btnCancel.Name = "btnCancel";
            this.btnCancel.Size = new System.Drawing.Size(113, 46);
            this.btnCancel.TabIndex = 5;
            this.btnCancel.Text = "Hủy";
            this.btnCancel.UseVisualStyleBackColor = true;
            this.btnCancel.Click += new System.EventHandler(this.btnCancel_Click);
            // 
            // btnThem
            // 
            this.btnThem.Font = new System.Drawing.Font("Arial", 13.8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnThem.Location = new System.Drawing.Point(282, 361);
            this.btnThem.Name = "btnThem";
            this.btnThem.Size = new System.Drawing.Size(238, 46);
            this.btnThem.TabIndex = 6;
            this.btnThem.Text = "Thêm Vào Giỏ Hàng";
            this.btnThem.UseVisualStyleBackColor = true;
            this.btnThem.Click += new System.EventHandler(this.btnThem_Click);
            // 
            // btnM
            // 
            this.btnM.FlatStyle = System.Windows.Forms.FlatStyle.System;
            this.btnM.Font = new System.Drawing.Font("Arial Black", 18F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnM.Location = new System.Drawing.Point(222, 91);
            this.btnM.Name = "btnM";
            this.btnM.Size = new System.Drawing.Size(126, 96);
            this.btnM.TabIndex = 7;
            this.btnM.Text = "size M";
            this.btnM.UseVisualStyleBackColor = true;
            this.btnM.Click += new System.EventHandler(this.btnM_Click);
            // 
            // btnL
            // 
            this.btnL.FlatStyle = System.Windows.Forms.FlatStyle.System;
            this.btnL.Font = new System.Drawing.Font("Arial Black", 18F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnL.Location = new System.Drawing.Point(394, 91);
            this.btnL.Name = "btnL";
            this.btnL.Size = new System.Drawing.Size(126, 89);
            this.btnL.TabIndex = 8;
            this.btnL.Text = "size L";
            this.btnL.UseVisualStyleBackColor = true;
            this.btnL.Click += new System.EventHandler(this.btnL_Click);
            // 
            // txbNote
            // 
            this.txbNote.Font = new System.Drawing.Font("Arial", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txbNote.Location = new System.Drawing.Point(159, 267);
            this.txbNote.Multiline = true;
            this.txbNote.Name = "txbNote";
            this.txbNote.Size = new System.Drawing.Size(370, 37);
            this.txbNote.TabIndex = 9;
            // 
            // nudTangGiam
            // 
            this.nudTangGiam.Location = new System.Drawing.Point(159, 222);
            this.nudTangGiam.Minimum = new decimal(new int[] {
            1,
            0,
            0,
            0});
            this.nudTangGiam.Name = "nudTangGiam";
            this.nudTangGiam.Size = new System.Drawing.Size(120, 22);
            this.nudTangGiam.TabIndex = 10;
            this.nudTangGiam.Value = new decimal(new int[] {
            1,
            0,
            0,
            0});
            // 
            // lbSoLuong
            // 
            this.lbSoLuong.AutoSize = true;
            this.lbSoLuong.Font = new System.Drawing.Font("Segoe UI Semibold", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lbSoLuong.Location = new System.Drawing.Point(54, 216);
            this.lbSoLuong.Name = "lbSoLuong";
            this.lbSoLuong.Size = new System.Drawing.Size(99, 28);
            this.lbSoLuong.TabIndex = 11;
            this.lbSoLuong.Text = "Số lượng:";
            // 
            // lbGhiChu
            // 
            this.lbGhiChu.AutoSize = true;
            this.lbGhiChu.Font = new System.Drawing.Font("Segoe UI Semibold", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lbGhiChu.Location = new System.Drawing.Point(54, 276);
            this.lbGhiChu.Name = "lbGhiChu";
            this.lbGhiChu.Size = new System.Drawing.Size(90, 28);
            this.lbGhiChu.TabIndex = 12;
            this.lbGhiChu.Text = "Ghi Chú:";
            // 
            // vw_ChonSize
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(547, 445);
            this.Controls.Add(this.lbGhiChu);
            this.Controls.Add(this.lbSoLuong);
            this.Controls.Add(this.nudTangGiam);
            this.Controls.Add(this.txbNote);
            this.Controls.Add(this.btnL);
            this.Controls.Add(this.btnM);
            this.Controls.Add(this.btnThem);
            this.Controls.Add(this.btnCancel);
            this.Controls.Add(this.btnS);
            this.Controls.Add(this.lblSubTitle);
            this.Controls.Add(this.lblTenMon);
            this.Name = "vw_ChonSize";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "vw_ChonSize";
            this.Load += new System.EventHandler(this.vw_ChonSize_Load);
            ((System.ComponentModel.ISupportInitialize)(this.nudTangGiam)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label lblTenMon;
        private System.Windows.Forms.Label lblSubTitle;
        private System.Windows.Forms.Button btnS;
        private System.Windows.Forms.Button btnCancel;
        private System.Windows.Forms.Button btnThem;
        private System.Windows.Forms.Button btnM;
        private System.Windows.Forms.Button btnL;
        private System.Windows.Forms.TextBox txbNote;
        private System.Windows.Forms.NumericUpDown nudTangGiam;
        private System.Windows.Forms.Label lbSoLuong;
        private System.Windows.Forms.Label lbGhiChu;
    }
}