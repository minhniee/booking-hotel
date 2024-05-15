package Context;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBcontext {

    public static Connection getConnection() {
        Connection c = null;

        try {//a
            String url = "jdbc:sqlserver://localhost:1433;databaseName=PRJ301_PE_SP_2022_B1";
            String username = "sa";
            String password = "123";
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            // Tạo kết nối
            c = DriverManager.getConnection(url, username, password);

        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        return c;
    }
    public static void main(String[] args) {
        System.out.println(getConnection());
    }
}
