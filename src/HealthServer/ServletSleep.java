package HealthServer;

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
@WebServlet("/sleepAnalysis")
public class ServletSleep extends HttpServlet {
    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        /*获取数据(设置域对象内容)*/
        String user = "test01";
        //创建template对象
        JdbcTemplate template = new JdbcTemplate(Druid.ds);
        String sql = "SELECT * FROM sleep where username= ? and date >=(SELECT MAX(date) FROM sleep) - INTERVAL 6 DAY;";
        List<Sleep> list = template.query(sql,new BeanPropertyRowMapper<Sleep>(Sleep.class),user);
        /*发送数据*/
        request.setAttribute("sleepweek",list);
        /*转发到jsp*/
        request.getRequestDispatcher("sleepAnalysis.jsp").forward(request, response);
    }
}
