using System;
using System.Collections.Generic;
using System.Text;

namespace POS
{
    partial class vw_DangNhap
    {
        private System.ComponentModel.IContainer components = null;

        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        private void InitializeComponent()
        {
            label1 = new Label();
            lbMatKhau = new Label();
            btnEnter = new Button();
            btnCa1 = new RadioButton();
            btnCa2 = new RadioButton();
            txtbPass = new TextBox();
            SuspendLayout();
            // 
            // label1
            // 
            label1.AutoSize = true;
            label1.Font = new Font("Times New Roman", 28.2F, FontStyle.Bold, GraphicsUnit.Point, 0);
            label1.Location = new Point(75, 23);
            label1.Name = "label1";
            label1.Size = new Size(646, 53);
            label1.TabIndex = 0;
            label1.Text = "HỆ THỐNG POS BÁN HÀNG";
            // 
            // lbMatKhau
            // 
            lbMatKhau.AutoSize = true;
            lbMatKhau.Font = new Font("Segoe UI", 24F, FontStyle.Regular, GraphicsUnit.Point, 0);
            lbMatKhau.Location = new Point(86, 152);
            lbMatKhau.Name = "lbMatKhau";
            lbMatKhau.Size = new Size(98, 54);
            lbMatKhau.TabIndex = 2;
            lbMatKhau.Text = "Pass";
            // 
            // btnEnter
            // 
            btnEnter.BackColor = Color.FromArgb(255, 255, 128);
            btnEnter.Location = new Point(473, 276);
            btnEnter.Name = "btnEnter";
            btnEnter.Size = new Size(109, 40);
            btnEnter.TabIndex = 5;
            btnEnter.Text = "Enter";
            btnEnter.UseVisualStyleBackColor = false;
            btnEnter.Click += btnEnter_Click;
            // 
            // btnCa1
            // 
            btnCa1.Appearance = Appearance.Button;
            btnCa1.BackColor = Color.White;
            btnCa1.Font = new Font("Segoe UI", 16.2F, FontStyle.Bold, GraphicsUnit.Point, 0);
            btnCa1.Location = new Point(180, 228);
            btnCa1.Name = "btnCa1";
            btnCa1.Size = new Size(89, 51);
            btnCa1.TabIndex = 6;
            btnCa1.TabStop = true;
            btnCa1.Text = "Ca 1";
            btnCa1.UseVisualStyleBackColor = false;
            btnCa1.CheckedChanged += btnCa1_CheckedChanged;
            btnCa1.Click += btnCa1_Click;
            // 
            // btnCa2
            // 
            btnCa2.Appearance = Appearance.Button;
            btnCa2.BackColor = Color.White;
            btnCa2.Font = new Font("Segoe UI", 16.2F, FontStyle.Bold, GraphicsUnit.Point, 0);
            btnCa2.Location = new Point(291, 228);
            btnCa2.Name = "btnCa2";
            btnCa2.Size = new Size(97, 51);
            btnCa2.TabIndex = 7;
            btnCa2.TabStop = true;
            btnCa2.Text = "Ca 2";
            btnCa2.UseVisualStyleBackColor = false;
            btnCa2.CheckedChanged += btnCa2_CheckedChanged_1;
            btnCa2.Click += btnCa2_Click;
            // 
            // txtbPass
            // 
            txtbPass.Location = new Point(229, 168);
            txtbPass.Name = "txtbPass";
            txtbPass.Size = new Size(174, 27);
            txtbPass.TabIndex = 8;
            txtbPass.Click += txtbPass_TextChanged;
            txtbPass.TextChanged += txtbPass_TextChanged;
            // 
            // vw_DangNhap
            // 
            AutoScaleDimensions = new SizeF(8F, 20F);
            AutoScaleMode = AutoScaleMode.Font;
            ClientSize = new Size(800, 450);
            Controls.Add(txtbPass);
            Controls.Add(btnCa2);
            Controls.Add(btnCa1);
            Controls.Add(btnEnter);
            Controls.Add(lbMatKhau);
            Controls.Add(label1);
            Name = "vw_DangNhap";
            Text = "Vw_DangNhap";
            ResumeLayout(false);
            PerformLayout();
        }

        #endregion

        private Label label1;
        private Label lbMatKhau;
        private Button btnEnter;
        private RadioButton btnCa1;
        private RadioButton btnCa2;
        private TextBox txtbPass;
    }
}