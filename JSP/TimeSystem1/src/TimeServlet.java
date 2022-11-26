import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

@WebServlet("/index")
public class TimeServlet extends HttpServlet {
    @Override
    public void init() throws ServletException {
        System.out.println("gggggggggggggggggggggg");
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter writer = response.getWriter();
        Date date = new Date();
        writer.println("<html>");
        writer.println("<h1>"+date+"<h1>");
        writer.println("</html>");
        System.out.println("bbbbbbbbbbbbbb");
    }
}
