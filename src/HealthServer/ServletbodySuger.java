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
@WebServlet("/bodySuger")
public class ServletbodySuger extends HttpServlet {
    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        /*获取数据(设置域对象内容)*/
        String user = "test01";
        //创建template对象
        JdbcTemplate template = new JdbcTemplate(Druid.ds);
        String sql = "SELECT * FROM (SELECT * FROM bloodsugar where username=? ORDER BY datetime DESC LIMIT 24) AS subquery ORDER BY datetime ASC;";
        List<BodySuger> list = template.query(sql,new BeanPropertyRowMapper<BodySuger>(BodySuger.class),user);

        sql = "SELECT * FROM bloodsugar WHERE DATE(datetime) = (SELECT DATE(datetime) - INTERVAL 1 DAY FROM bloodsugar WHERE username= ? ORDER BY datetime DESC LIMIT 1) AND username= ? ;";
        List<BodySuger> two = template.query(sql, new BeanPropertyRowMapper<BodySuger>(BodySuger.class), user,user);
        if (two.size()==0){
            BodySuger temp = new BodySuger();
            temp.setBloodsugar(0);
            for(int index = 0;index<24;index++){
                two.add(temp);
            }
        }
        sql="SELECT * FROM bloodsugar WHERE DATE(datetime) = (SELECT DATE(datetime) - INTERVAL 2 DAY FROM bloodsugar WHERE username=? ORDER BY datetime DESC LIMIT 1) AND username=?;";
        List<BodySuger> three = template.query(sql, new BeanPropertyRowMapper<BodySuger>(BodySuger.class), user,user);
        if (three.size()==0){
            BodySuger temp = new BodySuger();
            temp.setBloodsugar(0);
            for(int index = 0;index<24;index++){
                three.add(temp);
            }
        }
        sql="SELECT * FROM bloodsugar WHERE DATE(datetime) = (SELECT DATE(datetime) - INTERVAL 3 DAY FROM bloodsugar ORDER BY datetime DESC LIMIT 1)AND username =? ORDER BY datetime ASC;";
        List<BodySuger> four = template.query(sql, new BeanPropertyRowMapper<BodySuger>(BodySuger.class), user);
        if(four.size()==0){
            BodySuger temp= new BodySuger();
            temp.setBloodsugar(0);
            for (int i=0;i<24;i++){
                four.add(temp);
            }
        }
        sql="SELECT * FROM bloodsugar WHERE DATE(datetime) = (SELECT DATE(datetime) - INTERVAL 4 DAY FROM bloodsugar ORDER BY datetime DESC LIMIT 1)AND username =? ORDER BY datetime ASC;";
        List<BodySuger> five = template.query(sql, new BeanPropertyRowMapper<BodySuger>(BodySuger.class), user);
        if(five.size()==0){
            BodySuger temp= new BodySuger();
            temp.setBloodsugar(0);
            for (int i=0;i<24;i++){
                five.add(temp);
            }
        }
        sql="SELECT * FROM bloodsugar WHERE DATE(datetime) = (SELECT DATE(datetime) - INTERVAL 5 DAY FROM bloodsugar ORDER BY datetime DESC LIMIT 1)AND username =? ORDER BY datetime ASC;";
        List<BodySuger> six = template.query(sql, new BeanPropertyRowMapper<BodySuger>(BodySuger.class), user);
        if(six.size()==0){
            BodySuger temp= new BodySuger();
            temp.setBloodsugar(0);
            for (int i=0;i<24;i++){
                six.add(temp);
            }
        }
        sql="SELECT * FROM bloodsugar WHERE DATE(datetime) = (SELECT DATE(datetime) - INTERVAL 6 DAY FROM bloodsugar ORDER BY datetime DESC LIMIT 1)AND username =? ORDER BY datetime ASC;";
        List<BodySuger> seven = template.query(sql, new BeanPropertyRowMapper<BodySuger>(BodySuger.class), user);
        if(seven.size()==0){
            BodySuger temp= new BodySuger();
            temp.setBloodsugar(0);
            for (int i=0;i<24;i++){
                seven.add(temp);
            }
        }
        /*发送数据*/
        request.setAttribute("bodysuger",list);
        request.setAttribute("day2", two);
        request.setAttribute("day3", three);
        request.setAttribute("day4",four);
        request.setAttribute("day5",five);
        request.setAttribute("day6",six);
        request.setAttribute("day7",seven);
        /*转发到jsp*/
        request.getRequestDispatcher("bodySuger.jsp").forward(request,response);
    }
}
