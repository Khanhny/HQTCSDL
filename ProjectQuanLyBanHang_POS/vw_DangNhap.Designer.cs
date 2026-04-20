namespace ProjectQuanLyBanHang
{
    partial class Login
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
            this.buttonThoat = new System.Windows.Forms.Button();
            this.BTNLogin = new System.Windows.Forms.Button();
            this.panel3 = new System.Windows.Forms.Panel();
            this.textPass = new System.Windows.Forms.TextBox();
            this.labelPassword = new System.Windows.Forms.Label();
            this.panel2 = new System.Windows.Forms.Panel();
            this.labeluserName = new System.Windows.Forms.Label();
            this.backgroundWorker1 = new System.ComponentModel.BackgroundWorker();
            this.rbtnShift1 = new System.Windows.Forms.RadioButton();
            this.rbtnShift2 = new System.Windows.Forms.RadioButton();
            this.panel1.SuspendLayout();
            this.panel3.SuspendLayout();
            this.panel2.SuspendLayout();
            this.SuspendLayout();
            // 
            // panel1
            // 
            this.panel1.Controls.Add(this.buttonThoat);
            this.panel1.Controls.Add(this.BTNLogin);
            this.panel1.Controls.Add(this.panel3);
            this.panel1.Controls.Add(this.panel2);
            this.panel1.Location = new System.Drawing.Point(0, 12);
            this.panel1.Name = "panel1";
            this.panel1.Size = new System.Drawing.Size(788, 426);
            this.panel1.TabIndex = 0;
            this.panel1.Paint += new System.Windows.Forms.PaintEventHandler(this.panel1_Paint);
            // 
            // buttonThoat
            // 
            this.buttonThoat.DialogResult = System.Windows.Forms.DialogResult.Cancel;
            this.buttonThoat.Font = new System.Drawing.Font("Arial", 10.2F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.buttonThoat.Location = new System.Drawing.Point(411, 163);
            this.buttonThoat.Name = "buttonThoat";
            this.buttonThoat.Size = new System.Drawing.Size(144, 30);
            this.buttonThoat.TabIndex = 4;
            this.buttonThoat.Text = "Thoát";
            this.buttonThoat.UseVisualStyleBackColor = true;
            this.buttonThoat.Click += new System.EventHandler(this.buttonThoat_Click);
            // 
            // BTNLogin
            // 
            this.BTNLogin.Font = new System.Drawing.Font("Arial", 10.2F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.BTNLogin.Location = new System.Drawing.Point(252, 163);
            this.BTNLogin.Name = "BTNLogin";
            this.BTNLogin.Size = new System.Drawing.Size(144, 30);
            this.BTNLogin.TabIndex = 3;
            this.BTNLogin.Text = "Đăng nhập";
            this.BTNLogin.UseVisualStyleBackColor = true;
            this.BTNLogin.Click += new System.EventHandler(this.button1_Click);
            // 
            // panel3
            // 
            this.panel3.Controls.Add(this.textPass);
            this.panel3.Controls.Add(this.labelPassword);
            this.panel3.Location = new System.Drawing.Point(12, 82);
            this.panel3.Name = "panel3";
            this.panel3.Size = new System.Drawing.Size(557, 61);
            this.panel3.TabIndex = 2;
            // 
            // textPass
            // 
            this.textPass.Location = new System.Drawing.Point(220, 12);
            this.textPass.Name = "textPass";
            this.textPass.Size = new System.Drawing.Size(334, 22);
            this.textPass.TabIndex = 2;
            this.textPass.UseSystemPasswordChar = true;
            // 
            // labelPassword
            // 
            this.labelPassword.AutoSize = true;
            this.labelPassword.Font = new System.Drawing.Font("Arial", 13.8F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.labelPassword.Location = new System.Drawing.Point(59, 12);
            this.labelPassword.Name = "labelPassword";
            this.labelPassword.Size = new System.Drawing.Size(121, 27);
            this.labelPassword.TabIndex = 0;
            this.labelPassword.Text = "Mật khẩu:";
            this.labelPassword.Click += new System.EventHandler(this.label2_Click);
            // 
            // panel2
            // 
            this.panel2.Controls.Add(this.rbtnShift2);
            this.panel2.Controls.Add(this.rbtnShift1);
            this.panel2.Controls.Add(this.labeluserName);
            this.panel2.Location = new System.Drawing.Point(12, 15);
            this.panel2.Name = "panel2";
            this.panel2.Size = new System.Drawing.Size(557, 61);
            this.panel2.TabIndex = 0;
            // 
            // labeluserName
            // 
            this.labeluserName.AutoSize = true;
            this.labeluserName.Font = new System.Drawing.Font("Arial", 13.8F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.labeluserName.Location = new System.Drawing.Point(3, 12);
            this.labeluserName.Name = "labeluserName";
            this.labeluserName.Size = new System.Drawing.Size(139, 27);
            this.labeluserName.TabIndex = 0;
            this.labeluserName.Text = "Ca làm việc";
            this.labeluserName.Click += new System.EventHandler(this.label1_Click);
            // 
            // rbtnShift1
            // 
            this.rbtnShift1.AutoSize = true;
            this.rbtnShift1.Font = new System.Drawing.Font("Arial", 10.2F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.rbtnShift1.Location = new System.Drawing.Point(240, 19);
            this.rbtnShift1.Name = "rbtnShift1";
            this.rbtnShift1.Size = new System.Drawing.Size(65, 23);
            this.rbtnShift1.TabIndex = 1;
            this.rbtnShift1.TabStop = true;
            this.rbtnShift1.Text = "Ca 1";
            this.rbtnShift1.UseVisualStyleBackColor = true;
            this.rbtnShift1.CheckedChanged += new System.EventHandler(this.rbtnShift1_CheckedChanged);
            // 
            // rbtnShift2
            // 
            this.rbtnShift2.AutoSize = true;
            this.rbtnShift2.Font = new System.Drawing.Font("Arial", 10.2F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.rbtnShift2.Location = new System.Drawing.Point(399, 19);
            this.rbtnShift2.Name = "rbtnShift2";
            this.rbtnShift2.Size = new System.Drawing.Size(65, 23);
            this.rbtnShift2.TabIndex = 2;
            this.rbtnShift2.TabStop = true;
            this.rbtnShift2.Text = "Ca 2";
            this.rbtnShift2.UseVisualStyleBackColor = true;
            this.rbtnShift2.CheckedChanged += new System.EventHandler(this.rbtnShift2_CheckedChanged);
            // 
            // Login
            // 
            this.AcceptButton = this.BTNLogin;
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.CancelButton = this.buttonThoat;
            this.ClientSize = new System.Drawing.Size(581, 252);
            this.Controls.Add(this.panel1);
            this.Name = "Login";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Đăng nhập";
            this.FormClosing += new System.Windows.Forms.FormClosingEventHandler(this.Login_FormClosing);
            this.panel1.ResumeLayout(false);
            this.panel3.ResumeLayout(false);
            this.panel3.PerformLayout();
            this.panel2.ResumeLayout(false);
            this.panel2.PerformLayout();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.Panel panel1;
        private System.Windows.Forms.Panel panel2;
        private System.Windows.Forms.Label labeluserName;
        private System.Windows.Forms.Panel panel3;
        private System.Windows.Forms.TextBox textPass;
        private System.Windows.Forms.Label labelPassword;
        private System.Windows.Forms.Button BTNLogin;
        private System.ComponentModel.BackgroundWorker backgroundWorker1;
        private System.Windows.Forms.Button buttonThoat;
        private System.Windows.Forms.RadioButton rbtnShift2;
        private System.Windows.Forms.RadioButton rbtnShift1;
    }
}

