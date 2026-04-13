using System.Data;
using Microsoft.Data.SqlClient; // Thay vì System.Data.SqlClientusing System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace ProjectQuanLyBanHang
{
    public partial class AccountProfile : Form
    {
        string connectionString = @"Data Source=(localdb)\MSSQLLocalDB; Initial Catalog=QuanLyBanHang; Integrated Security=True; Connect Timeout=30; Encrypt=False; TrustServer Certificate=False;";
        public AccountProfile()
        {
            InitializeComponent();
        }

        private void panel3_Paint(object sender, PaintEventArgs e)
        {
            this.Close();

        }
    }
}
