package HealthServer;

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.List;

@WebServlet("/HeartBest")
public class ServletHeart extends HttpServlet {
    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        /*获取数据(设置域对象内容)*/
        //创建template对象
        String user = "test01";
        JdbcTemplate template = new JdbcTemplate(Druid.ds);
        String sql = "SELECT * FROM (SELECT * FROM Heart where username=? ORDER BY datetime DESC LIMIT 24) AS subquery ORDER BY datetime ASC;";
        List<Heart> rate = template.query(sql, new BeanPropertyRowMapper<Heart>(Heart.class), user);

        sql = "SELECT * FROM Heart WHERE DATE(datetime) = (SELECT DATE(datetime) - INTERVAL 1 DAY FROM Heart WHERE username= ? ORDER BY datetime DESC LIMIT 1) AND username= ? ;";
        List<Heart> two = template.query(sql, new BeanPropertyRowMapper<Heart>(Heart.class), user,user);

        sql="SELECT * FROM Heart WHERE DATE(datetime) = (SELECT DATE(datetime) - INTERVAL 2 DAY FROM Heart WHERE username=? ORDER BY datetime DESC LIMIT 1) AND username=?;";
        List<Heart> three = template.query(sql, new BeanPropertyRowMapper<Heart>(Heart.class), user,user);
        if (three.size()==0){
            Heart temp = new Heart();
            temp.setHeartrate(0);
            for(int index = 0;index<24;index++){
                three.add(temp);
            }
        }
        sql="SELECT * FROM Heart WHERE DATE(datetime) = (SELECT DATE(datetime) - INTERVAL 3 DAY FROM Heart ORDER BY datetime DESC LIMIT 1)AND username =? ORDER BY datetime ASC;";
        List<Heart> four = template.query(sql, new BeanPropertyRowMapper<Heart>(Heart.class), user);
        if(four.size()==0){
            Heart temp= new Heart();
            temp.setHeartrate(0);
            for (int i=0;i<24;i++){
                four.add(temp);
            }
        }
        sql="SELECT * FROM Heart WHERE DATE(datetime) = (SELECT DATE(datetime) - INTERVAL 4 DAY FROM Heart ORDER BY datetime DESC LIMIT 1)AND username =? ORDER BY datetime ASC;";
        List<Heart> five = template.query(sql, new BeanPropertyRowMapper<Heart>(Heart.class), user);
        if(five.size()==0){
            Heart temp= new Heart();
            temp.setHeartrate(0);
            for (int i=0;i<24;i++){
                five.add(temp);
            }
        }
        sql="SELECT * FROM Heart WHERE DATE(datetime) = (SELECT DATE(datetime) - INTERVAL 5 DAY FROM Heart ORDER BY datetime DESC LIMIT 1)AND username =? ORDER BY datetime ASC;";
        List<Heart> six = template.query(sql, new BeanPropertyRowMapper<Heart>(Heart.class), user);
        if(six.size()==0){
            Heart temp= new Heart();
            temp.setHeartrate(0);
            for (int i=0;i<24;i++){
                six.add(temp);
            }
        }
        sql="SELECT * FROM Heart WHERE DATE(datetime) = (SELECT DATE(datetime) - INTERVAL 6 DAY FROM Heart ORDER BY datetime DESC LIMIT 1)AND username =? ORDER BY datetime ASC;";
        List<Heart> seven = template.query(sql, new BeanPropertyRowMapper<Heart>(Heart.class), user);
        if(seven.size()==0){
            Heart temp= new Heart();
            temp.setHeartrate(0);
            for (int i=0;i<24;i++){
                seven.add(temp);
            }
        }
        /*发送数据*/
        request.setAttribute("heartweek", rate);
        request.setAttribute("heartday2", two);
        request.setAttribute("heartday3", three);
        request.setAttribute("heartday4",four);
        request.setAttribute("heartday5",five);
        request.setAttribute("heartday6",six);
        request.setAttribute("heartday7",seven);

        /*转发到jsp*/
        request.getRequestDispatcher("heartBeat.jsp").forward(request, response);
    }
}