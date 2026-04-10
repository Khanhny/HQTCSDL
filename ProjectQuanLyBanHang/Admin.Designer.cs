namespace ProjectQuanLyBanHang
{
    partial class Admin
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
            this.TcTable = new System.Windows.Forms.TabPage();
            this.TcCategory = new System.Windows.Forms.TabPage();
            this.panel6 = new System.Windows.Forms.Panel();
            this.panel4 = new System.Windows.Forms.Panel();
            this.panel5 = new System.Windows.Forms.Panel();
            this.panel3 = new System.Windows.Forms.Panel();
            this.tcBill = new System.Windows.Forms.TabPage();
            this.panel2 = new System.Windows.Forms.Panel();
            this.btnViewBill = new System.Windows.Forms.Button();
            this.dtptoDate = new System.Windows.Forms.DateTimePicker();
            this.dtpfromDate = new System.Windows.Forms.DateTimePicker();
            this.panel1 = new System.Windows.Forms.Panel();
            this.dtgvBill = new System.Windows.Forms.DataGridView();
            this.tcAdmin = new System.Windows.Forms.TabControl();
            this.btnAdd = new System.Windows.Forms.Button();
            this.btnDelete = new System.Windows.Forms.Button();
            this.btnEdit = new System.Windows.Forms.Button();
            this.btnShow = new System.Windows.Forms.Button();
            this.dataGridView1 = new System.Windows.Forms.DataGridView();
            this.panel7 = new System.Windows.Forms.Panel();
            this.lbID = new System.Windows.Forms.Label();
            this.panel8 = new System.Windows.Forms.Panel();
            this.lbName = new System.Windows.Forms.Label();
            this.txbID = new System.Windows.Forms.TextBox();
            this.txbName = new System.Windows.Forms.TextBox();
            this.TcCategory.SuspendLayout();
            this.panel6.SuspendLayout();
            this.panel5.SuspendLayout();
            this.panel3.SuspendLayout();
            this.tcBill.SuspendLayout();
            this.panel2.SuspendLayout();
            this.panel1.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dtgvBill)).BeginInit();
            this.tcAdmin.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView1)).BeginInit();
            this.panel7.SuspendLayout();
            this.panel8.SuspendLayout();
            this.SuspendLayout();
            // 
            // TcTable
            // 
            this.TcTable.Location = new System.Drawing.Point(4, 25);
            this.TcTable.Name = "TcTable";
            this.TcTable.Padding = new System.Windows.Forms.Padding(3);
            this.TcTable.Size = new System.Drawing.Size(832, 517);
            this.TcTable.TabIndex = 3;
            this.TcTable.Text = "Bàn ăn";
            this.TcTable.UseVisualStyleBackColor = true;
            // 
            // TcCategory
            // 
            this.TcCategory.Controls.Add(this.panel6);
            this.TcCategory.Controls.Add(this.panel4);
            this.TcCategory.Controls.Add(this.panel5);
            this.TcCategory.Controls.Add(this.panel3);
            this.TcCategory.Location = new System.Drawing.Point(4, 25);
            this.TcCategory.Name = "TcCategory";
            this.TcCategory.Padding = new System.Windows.Forms.Padding(3);
            this.TcCategory.Size = new System.Drawing.Size(832, 517);
            this.TcCategory.TabIndex = 2;
            this.TcCategory.Text = "Danh mục";
            this.TcCategory.UseVisualStyleBackColor = true;
            this.TcCategory.Click += new System.EventHandler(this.TcCategory_Click);
            // 
            // panel6
            // 
            this.panel6.Controls.Add(this.panel8);
            this.panel6.Controls.Add(this.panel7);
            this.panel6.Location = new System.Drawing.Point(452, 80);
            this.panel6.Name = "panel6";
            this.panel6.Size = new System.Drawing.Size(380, 431);
            this.panel6.TabIndex = 2;
            // 
            // panel4
            // 
            this.panel4.Location = new System.Drawing.Point(452, 6);
            this.panel4.Name = "panel4";
            this.panel4.Size = new System.Drawing.Size(374, 68);
            this.panel4.TabIndex = 1;
            // 
            // panel5
            // 
            this.panel5.Controls.Add(this.btnShow);
            this.panel5.Controls.Add(this.btnEdit);
            this.panel5.Controls.Add(this.btnDelete);
            this.panel5.Controls.Add(this.btnAdd);
            this.panel5.Location = new System.Drawing.Point(6, 6);
            this.panel5.Name = "panel5";
            this.panel5.Size = new System.Drawing.Size(440, 65);
            this.panel5.TabIndex = 1;
            // 
            // panel3
            // 
            this.panel3.Controls.Add(this.dataGridView1);
            this.panel3.Location = new System.Drawing.Point(6, 77);
            this.panel3.Name = "panel3";
            this.panel3.Size = new System.Drawing.Size(440, 434);
            this.panel3.TabIndex = 0;
            // 
            // tcBill
            // 
            this.tcBill.Controls.Add(this.panel2);
            this.tcBill.Controls.Add(this.panel1);
            this.tcBill.Location = new System.Drawing.Point(4, 25);
            this.tcBill.Name = "tcBill";
            this.tcBill.Padding = new System.Windows.Forms.Padding(3);
            this.tcBill.Size = new System.Drawing.Size(832, 517);
            this.tcBill.TabIndex = 0;
            this.tcBill.Text = "Doanh Thu";
            this.tcBill.UseVisualStyleBackColor = true;
            // 
            // panel2
            // 
            this.panel2.Controls.Add(this.btnViewBill);
            this.panel2.Controls.Add(this.dtptoDate);
            this.panel2.Controls.Add(this.dtpfromDate);
            this.panel2.Location = new System.Drawing.Point(6, 6);
            this.panel2.Name = "panel2";
            this.panel2.Size = new System.Drawing.Size(743, 30);
            this.panel2.TabIndex = 1;
            // 
            // btnViewBill
            // 
            this.btnViewBill.Location = new System.Drawing.Point(318, 4);
            this.btnViewBill.Name = "btnViewBill";
            this.btnViewBill.Size = new System.Drawing.Size(89, 23);
            this.btnViewBill.TabIndex = 2;
            this.btnViewBill.Text = "Thống kê";
            this.btnViewBill.UseVisualStyleBackColor = true;
            // 
            // dtptoDate
            // 
            this.dtptoDate.Location = new System.Drawing.Point(484, 3);
            this.dtptoDate.Name = "dtptoDate";
            this.dtptoDate.Size = new System.Drawing.Size(256, 22);
            this.dtptoDate.TabIndex = 1;
            // 
            // dtpfromDate
            // 
            this.dtpfromDate.Location = new System.Drawing.Point(3, 3);
            this.dtpfromDate.Name = "dtpfromDate";
            this.dtpfromDate.Size = new System.Drawing.Size(256, 22);
            this.dtpfromDate.TabIndex = 0;
            // 
            // panel1
            // 
            this.panel1.Controls.Add(this.dtgvBill);
            this.panel1.Location = new System.Drawing.Point(6, 37);
            this.panel1.Name = "panel1";
            this.panel1.Size = new System.Drawing.Size(743, 383);
            this.panel1.TabIndex = 0;
            // 
            // dtgvBill
            // 
            this.dtgvBill.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dtgvBill.Location = new System.Drawing.Point(3, 5);
            this.dtgvBill.Name = "dtgvBill";
            this.dtgvBill.RowHeadersWidth = 51;
            this.dtgvBill.RowTemplate.Height = 24;
            this.dtgvBill.Size = new System.Drawing.Size(737, 375);
            this.dtgvBill.TabIndex = 0;
            // 
            // tcAdmin
            // 
            this.tcAdmin.Controls.Add(this.tcBill);
            this.tcAdmin.Controls.Add(this.TcCategory);
            this.tcAdmin.Controls.Add(this.TcTable);
            this.tcAdmin.Location = new System.Drawing.Point(14, 12);
            this.tcAdmin.Name = "tcAdmin";
            this.tcAdmin.SelectedIndex = 0;
            this.tcAdmin.Size = new System.Drawing.Size(840, 546);
            this.tcAdmin.TabIndex = 0;
            // 
            // btnAdd
            // 
            this.btnAdd.Location = new System.Drawing.Point(3, 3);
            this.btnAdd.Name = "btnAdd";
            this.btnAdd.Size = new System.Drawing.Size(91, 59);
            this.btnAdd.TabIndex = 0;
            this.btnAdd.Text = "Thêm";
            this.btnAdd.UseVisualStyleBackColor = true;
            // 
            // btnDelete
            // 
            this.btnDelete.Location = new System.Drawing.Point(113, 3);
            this.btnDelete.Name = "btnDelete";
            this.btnDelete.Size = new System.Drawing.Size(91, 59);
            this.btnDelete.TabIndex = 1;
            this.btnDelete.Text = "Xóa";
            this.btnDelete.UseVisualStyleBackColor = true;
            // 
            // btnEdit
            // 
            this.btnEdit.Location = new System.Drawing.Point(223, 3);
            this.btnEdit.Name = "btnEdit";
            this.btnEdit.Size = new System.Drawing.Size(91, 59);
            this.btnEdit.TabIndex = 2;
            this.btnEdit.Text = "Sửa";
            this.btnEdit.UseVisualStyleBackColor = true;
            // 
            // btnShow
            // 
            this.btnShow.Location = new System.Drawing.Point(330, 3);
            this.btnShow.Name = "btnShow";
            this.btnShow.Size = new System.Drawing.Size(91, 59);
            this.btnShow.TabIndex = 3;
            this.btnShow.Text = "Xem";
            this.btnShow.UseVisualStyleBackColor = true;
            this.btnShow.Click += new System.EventHandler(this.button4_Click);
            // 
            // dataGridView1
            // 
            this.dataGridView1.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dataGridView1.Location = new System.Drawing.Point(3, 3);
            this.dataGridView1.Name = "dataGridView1";
            this.dataGridView1.RowHeadersWidth = 51;
            this.dataGridView1.RowTemplate.Height = 24;
            this.dataGridView1.Size = new System.Drawing.Size(434, 428);
            this.dataGridView1.TabIndex = 0;
            // 
            // panel7
            // 
            this.panel7.Controls.Add(this.txbID);
            this.panel7.Controls.Add(this.lbID);
            this.panel7.Location = new System.Drawing.Point(4, 3);
            this.panel7.Name = "panel7";
            this.panel7.Size = new System.Drawing.Size(373, 50);
            this.panel7.TabIndex = 0;
            // 
            // lbID
            // 
            this.lbID.AutoSize = true;
            this.lbID.Location = new System.Drawing.Point(21, 15);
            this.lbID.Name = "lbID";
            this.lbID.Size = new System.Drawing.Size(26, 16);
            this.lbID.TabIndex = 0;
            this.lbID.Text = "ID: ";
            // 
            // panel8
            // 
            this.panel8.Controls.Add(this.txbName);
            this.panel8.Controls.Add(this.lbName);
            this.panel8.Location = new System.Drawing.Point(7, 59);
            this.panel8.Name = "panel8";
            this.panel8.Size = new System.Drawing.Size(373, 50);
            this.panel8.TabIndex = 1;
            // 
            // lbName
            // 
            this.lbName.AutoSize = true;
            this.lbName.Location = new System.Drawing.Point(21, 15);
            this.lbName.Name = "lbName";
            this.lbName.Size = new System.Drawing.Size(97, 16);
            this.lbName.TabIndex = 0;
            this.lbName.Text = "Tên Danh Mục:";
            // 
            // txbID
            // 
            this.txbID.Location = new System.Drawing.Point(169, 12);
            this.txbID.Name = "txbID";
            this.txbID.Size = new System.Drawing.Size(150, 22);
            this.txbID.TabIndex = 1;
            // 
            // txbName
            // 
            this.txbName.Location = new System.Drawing.Point(166, 9);
            this.txbName.Name = "txbName";
            this.txbName.Size = new System.Drawing.Size(150, 22);
            this.txbName.TabIndex = 2;
            // 
            // Admin
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(866, 570);
            this.Controls.Add(this.tcAdmin);
            this.Name = "Admin";
            this.Text = "Admin";
            this.TcCategory.ResumeLayout(false);
            this.panel6.ResumeLayout(false);
            this.panel5.ResumeLayout(false);
            this.panel3.ResumeLayout(false);
            this.tcBill.ResumeLayout(false);
            this.panel2.ResumeLayout(false);
            this.panel1.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.dtgvBill)).EndInit();
            this.tcAdmin.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView1)).EndInit();
            this.panel7.ResumeLayout(false);
            this.panel7.PerformLayout();
            this.panel8.ResumeLayout(false);
            this.panel8.PerformLayout();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.TabPage TcTable;
        private System.Windows.Forms.TabPage TcCategory;
        private System.Windows.Forms.TabPage tcBill;
        private System.Windows.Forms.Panel panel2;
        private System.Windows.Forms.Button btnViewBill;
        private System.Windows.Forms.DateTimePicker dtptoDate;
        private System.Windows.Forms.DateTimePicker dtpfromDate;
        private System.Windows.Forms.Panel panel1;
        private System.Windows.Forms.DataGridView dtgvBill;
        private System.Windows.Forms.TabControl tcAdmin;
        private System.Windows.Forms.Panel panel3;
        private System.Windows.Forms.Panel panel5;
        private System.Windows.Forms.Panel panel4;
        private System.Windows.Forms.Panel panel6;
        private System.Windows.Forms.Button btnAdd;
        private System.Windows.Forms.Button btnShow;
        private System.Windows.Forms.Button btnEdit;
        private System.Windows.Forms.Button btnDelete;
        private System.Windows.Forms.Panel panel8;
        private System.Windows.Forms.Label lbName;
        private System.Windows.Forms.Panel panel7;
        private System.Windows.Forms.Label lbID;
        private System.Windows.Forms.DataGridView dataGridView1;
        private System.Windows.Forms.TextBox txbName;
        private System.Windows.Forms.TextBox txbID;
    }
}