import java.util.Date;

public class SpotBugsDemo {

    private int number;
    private String name;
    private Date birthday = new Date();

    public SpotBugsDemo(int number, String name) {
        this.number = number;
        this.name = name;
    }

    //Exposing mutable object
    public Date getBirthday() {
        return birthday;
        //return new Date(birthday.getTime());
    }

    public void dodgyCode(Object o){
        /*
        if (!(o instanceOf String)){
            return;
        }
        */

        String text = (String) o;
        //System.out.println(text);
    }

    //Comparing strings with ==
    public boolean isBob() {
        return name == "Bob";
    }

    //Possible NullPointerException
    public int getLength(String text) {
        /*
        if (text == null){
            return -1;
        }
        */

        return text.length();
    }

    //Ignoring the return value of trim()
    public void cleanName() {
        name.trim();
    }

    //Useless self-assignment
    /*
    public void doNothing() {
        number = 0;
    }
    */
    //Calling equals() on a possibly null object
    public boolean isHello(String text) {
        /*
        if (text == null){
            return false;
        }
        */

        return text.equals("Hello");
    }
}