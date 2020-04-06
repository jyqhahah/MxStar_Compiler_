package utility;

public class errorReminder {
    private int error_cnt;

    public errorReminder(){
        error_cnt = 0;
    }

    public void error(Location loc, String msg){
        error_cnt ++;
        System.out.println("error: " + loc.toString() + " " + msg);
    }

    public void warning(Location loc, String msg){
        System.out.println("warning: " + loc.toString() + " " + msg);
    }


    public int count(){
        return error_cnt;
    }

    public boolean hasError(){
        return error_cnt > 0;
    }
}
