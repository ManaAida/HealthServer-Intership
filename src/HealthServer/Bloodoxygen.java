package HealthServer;

import java.util.Date;

public class Bloodoxygen {
    public Bloodoxygen(){}
    String username;

    public Date getDatetime() {
        return datetime;
    }

    public void setDatetime(Date datetime) {
        this.datetime = datetime;
    }

    Date datetime;
    int bloodoxygen;

    public void setUsername(String username) {
        this.username = username;
    }


    public String getUsername() {
        return username;
    }


    public int getBloodoxygen() {
        return bloodoxygen;
    }

    public void setBloodoxygen(int bloodoxygen) {
        this.bloodoxygen = bloodoxygen;
    }
}
