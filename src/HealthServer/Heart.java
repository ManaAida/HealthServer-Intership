package HealthServer;

import javax.xml.crypto.Data;
import java.util.Date;

public class Heart {
    public Heart() {}
    int heartrate;
    Date datetime;

    public Date getDatetime() {
        return datetime;
    }

    public void setDatetime(Date datetime) {
        this.datetime = datetime;
    }

    String username;


    public int getHeartrate() {
        return heartrate;
    }

    public String getUsername() {
        return username;
    }


    public void setHeartrate(int heartrate) {
        this.heartrate = heartrate;
    }

    public void setUsername(String username) {
        this.username = username;
    }
}
