import java.io.StringReader;

public class Test {
    public static void main(String[] args) throws Exception {
        m3();
    }

    public static void m1() {
        JsonTest.main(new String[] {"src/test/resources/jsoninput.txt"});
    }

    public static void m3() throws Exception {
        StringReader sr = new StringReader("name hzz\nage 123");
        JsonTest jt = new JsonTest(sr);
        jt.analysis();
        System.out.println(jt.getInfo());
    }
}
