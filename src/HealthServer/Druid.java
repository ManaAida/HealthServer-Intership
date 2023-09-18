package HealthServer;
import com.alibaba.druid.pool.DruidDataSource;

import javax.servlet.annotation.WebServlet;
import javax.sql.DataSource;
import javax.servlet.http.HttpServlet;
import java.sql.Connection;
//@WebServlet(loadOnStartup = 0)
public class Druid extends HttpServlet {
    public static DataSource ds=null;
    @Override
    public void init(){
        try{
            //创建DruidDataSource对象
            DruidDataSource dataSource = new DruidDataSource();
            //设置属性
            dataSource.setDriverClassName("com.mysql.jdbc.Driver");
            dataSource.setUrl("jdbc:mysql://100.86.130.58:3306/healthdatabase");
            dataSource.setUsername("root");
            dataSource.setPassword("123456");
            dataSource.setInitialSize(5);
            dataSource.setMaxActive(10);
            dataSource.setMaxWait(3000);
            //获取连接池对象
            ds = dataSource;
            //获取连接
            Connection conn = ds.getConnection();
            System.out.println(conn.toString());
        }
        catch (Exception e){
            System.out.println(e.toString());
        }
    }
}
