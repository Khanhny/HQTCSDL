namespace POS
{
    partial class vw_ChiTietDonHang
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
            dgv_ChiTietDonHang = new DataGridView();
            colTenMon = new DataGridViewTextBoxColumn();
            colSize = new DataGridViewTextBoxColumn();
            colSL = new DataGridViewTextBoxColumn();
            colGia = new DataGridViewTextBoxColumn();
            colThanhTien = new DataGridViewTextBoxColumn();
            ((System.ComponentModel.ISupportInitialize)dgv_ChiTietDonHang).BeginInit();
            SuspendLayout();
            // 
            // dgv_ChiTietDonHang
            // 
            dgv_ChiTietDonHang.ColumnHeadersHeightSizeMode = DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            dgv_ChiTietDonHang.Columns.AddRange(new DataGridViewColumn[] { colTenMon, colSize, colSL, colGia, colThanhTien });
            dgv_ChiTietDonHang.Location = new Point(72, 75);
            dgv_ChiTietDonHang.Name = "dgv_ChiTietDonHang";
            dgv_ChiTietDonHang.RowHeadersWidth = 51;
            dgv_ChiTietDonHang.Size = new Size(675, 188);
            dgv_ChiTietDonHang.TabIndex = 0;
            // 
            // colTenMon
            // 
            colTenMon.HeaderText = "Tên Món";
            colTenMon.MinimumWidth = 6;
            colTenMon.Name = "colTenMon";
            colTenMon.Width = 125;
            // 
            // colSize
            // 
            colSize.HeaderText = "Size";
            colSize.MinimumWidth = 6;
            colSize.Name = "colSize";
            colSize.Width = 125;
            // 
            // colSL
            // 
            colSL.HeaderText = "Số lượng ";
            colSL.MinimumWidth = 6;
            colSL.Name = "colSL";
            colSL.Width = 125;
            // 
            // colGia
            // 
            colGia.HeaderText = "Đơn giá";
            colGia.MinimumWidth = 6;
            colGia.Name = "colGia";
            colGia.Width = 125;
            // 
            // colThanhTien
            // 
            colThanhTien.HeaderText = "Thành tiền";
            colThanhTien.MinimumWidth = 6;
            colThanhTien.Name = "colThanhTien";
            colThanhTien.Width = 125;
            // 
            // vw_ChiTietDonHang
            // 
            AutoScaleDimensions = new SizeF(8F, 20F);
            AutoScaleMode = AutoScaleMode.Font;
            ClientSize = new Size(800, 450);
            Controls.Add(dgv_ChiTietDonHang);
            Name = "vw_ChiTietDonHang";
            Text = "vw_ChiTietDonHang";
            ((System.ComponentModel.ISupportInitialize)dgv_ChiTietDonHang).EndInit();
            ResumeLayout(false);
        }

        #endregion

        private DataGridView dgv_ChiTietDonHang;
        private DataGridViewTextBoxColumn colTenMon;
        private DataGridViewTextBoxColumn colSize;
        private DataGridViewTextBoxColumn colSL;
        private DataGridViewTextBoxColumn colGia;
        private DataGridViewTextBoxColumn colThanhTien;
    }
}