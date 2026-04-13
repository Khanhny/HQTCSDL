namespace POS
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
            panel1 = new Panel();
            btnXemBaoCao = new Button();
            lblCa = new Label();
            radNgay = new RadioButton();
            radGio = new RadioButton();
            radCa = new RadioButton();
            cboChonCa = new ComboBox();
            dateTimePickerNgay = new DateTimePicker();
            dvgBaoCao = new DataGridView();
            panel2 = new Panel();
            lblTongCong = new Label();
            panel3 = new Panel();
            panel1.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)dvgBaoCao).BeginInit();
            panel2.SuspendLayout();
            panel3.SuspendLayout();
            SuspendLayout();
            // 
            // panel1
            // 
            panel1.Controls.Add(btnXemBaoCao);
            panel1.Controls.Add(lblCa);
            panel1.Controls.Add(radNgay);
            panel1.Controls.Add(radGio);
            panel1.Controls.Add(radCa);
            panel1.Controls.Add(cboChonCa);
            panel1.Controls.Add(dateTimePickerNgay);
            panel1.Location = new Point(2, 3);
            panel1.Name = "panel1";
            panel1.Size = new Size(1031, 63);
            panel1.TabIndex = 0;
            // 
            // btnXemBaoCao
            // 
            btnXemBaoCao.Font = new Font("Segoe UI Semibold", 12F, FontStyle.Bold, GraphicsUnit.Point);
            btnXemBaoCao.Location = new Point(844, 14);
            btnXemBaoCao.Name = "btnXemBaoCao";
            btnXemBaoCao.Size = new Size(161, 41);
            btnXemBaoCao.TabIndex = 6;
            btnXemBaoCao.Text = "Xem Báo Cáo";
            btnXemBaoCao.UseVisualStyleBackColor = true;
            btnXemBaoCao.Click += btnXemBaoCao_Click;
            // 
            // lblCa
            // 
            lblCa.AutoSize = true;
            lblCa.Font = new Font("Segoe UI Semibold", 13.8F, FontStyle.Bold, GraphicsUnit.Point);
            lblCa.Location = new Point(599, 23);
            lblCa.Name = "lblCa";
            lblCa.Size = new Size(46, 31);
            lblCa.TabIndex = 5;
            lblCa.Text = "Ca:";
            // 
            // radNgay
            // 
            radNgay.AutoSize = true;
            radNgay.Font = new Font("Segoe UI Semibold", 12F, FontStyle.Bold, GraphicsUnit.Point);
            radNgay.Location = new Point(480, 22);
            radNgay.Name = "radNgay";
            radNgay.Size = new Size(80, 32);
            radNgay.TabIndex = 4;
            radNgay.TabStop = true;
            radNgay.Text = "Ngày";
            radNgay.UseVisualStyleBackColor = true;
            radNgay.CheckedChanged += radioButton3_CheckedChanged;
            // 
            // radGio
            // 
            radGio.AutoSize = true;
            radGio.Font = new Font("Segoe UI Semibold", 12F, FontStyle.Bold, GraphicsUnit.Point);
            radGio.Location = new Point(389, 22);
            radGio.Name = "radGio";
            radGio.Size = new Size(64, 32);
            radGio.TabIndex = 3;
            radGio.TabStop = true;
            radGio.Text = "Giờ";
            radGio.UseVisualStyleBackColor = true;
            radGio.CheckedChanged += radGio_CheckedChanged;
            // 
            // radCa
            // 
            radCa.AutoSize = true;
            radCa.Font = new Font("Segoe UI Semibold", 12F, FontStyle.Bold, GraphicsUnit.Point);
            radCa.Location = new Point(312, 22);
            radCa.Name = "radCa";
            radCa.Size = new Size(55, 32);
            radCa.TabIndex = 2;
            radCa.TabStop = true;
            radCa.Text = "Ca";
            radCa.UseVisualStyleBackColor = true;
            radCa.CheckedChanged += radCa_CheckedChanged;
            // 
            // cboChonCa
            // 
            cboChonCa.FormattingEnabled = true;
            cboChonCa.Location = new Point(641, 24);
            cboChonCa.Name = "cboChonCa";
            cboChonCa.Size = new Size(151, 28);
            cboChonCa.TabIndex = 1;
            // 
            // dateTimePickerNgay
            // 
            dateTimePickerNgay.Location = new Point(10, 22);
            dateTimePickerNgay.Name = "dateTimePickerNgay";
            dateTimePickerNgay.Size = new Size(262, 27);
            dateTimePickerNgay.TabIndex = 0;
            // 
            // dvgBaoCao
            // 
            dvgBaoCao.ColumnHeadersHeightSizeMode = DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            dvgBaoCao.Location = new Point(3, 3);
            dvgBaoCao.Name = "dvgBaoCao";
            dvgBaoCao.RowHeadersWidth = 51;
            dvgBaoCao.RowTemplate.Height = 29;
            dvgBaoCao.Size = new Size(1031, 465);
            dvgBaoCao.TabIndex = 1;
            dvgBaoCao.CellContentClick += dvgBaoCao_CellContentClick;
            // 
            // panel2
            // 
            panel2.Controls.Add(lblTongCong);
            panel2.Location = new Point(2, 534);
            panel2.Name = "panel2";
            panel2.Size = new Size(1031, 55);
            panel2.TabIndex = 2;
            // 
            // lblTongCong
            // 
            lblTongCong.AutoSize = true;
            lblTongCong.Font = new Font("Segoe UI", 19.8000011F, FontStyle.Bold, GraphicsUnit.Point);
            lblTongCong.Location = new Point(3, 6);
            lblTongCong.Name = "lblTongCong";
            lblTongCong.Size = new Size(205, 46);
            lblTongCong.TabIndex = 0;
            lblTongCong.Text = "Tổng Cộng:";
            // 
            // panel3
            // 
            panel3.Controls.Add(dvgBaoCao);
            panel3.Location = new Point(2, 72);
            panel3.Name = "panel3";
            panel3.Size = new Size(1031, 456);
            panel3.TabIndex = 3;
            // 
            // vw_BaoCaoDoanhThu
            // 
            AutoScaleDimensions = new SizeF(8F, 20F);
            AutoScaleMode = AutoScaleMode.Font;
            ClientSize = new Size(1035, 591);
            Controls.Add(panel3);
            Controls.Add(panel2);
            Controls.Add(panel1);
            Name = "vw_BaoCaoDoanhThu";
            StartPosition = FormStartPosition.CenterScreen;
            Text = "vw_BaoCaoDoanhThu";
            Load += vw_BaoCaoDoanhThu_Load;
            panel1.ResumeLayout(false);
            panel1.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)dvgBaoCao).EndInit();
            panel2.ResumeLayout(false);
            panel2.PerformLayout();
            panel3.ResumeLayout(false);
            ResumeLayout(false);
        }

        #endregion

        private Panel panel1;
        private DataGridView dvgBaoCao;
        private ComboBox cboChonCa;
        private DateTimePicker dateTimePickerNgay;
        private RadioButton radNgay;
        private RadioButton radGio;
        private RadioButton radCa;
        private Button btnXemBaoCao;
        private Label lblCa;
        private Panel panel2;
        private Label lblTongCong;
        private Panel panel3;
    }
}