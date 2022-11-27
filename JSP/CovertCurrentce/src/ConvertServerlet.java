import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/convert")
public class ConvertServerlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter writer = response.getWriter();
        writer.println("<html>");
        double rate = 0;
        double usd = 0;
        try {
            rate = Double.parseDouble(request.getParameter("rate").trim());
            usd = Double.parseDouble(request.getParameter("USD").trim());
            if(rate !=0 && usd !=0){
                writer.println("<h1>"+usd + "USD= " +usd*rate + "VND"+"</h1>");
            }else{
                writer.println("<h1>Error</h1>");
            }
        }catch (Exception e){
            writer.println("<h1>Error</h1>");
        }
        writer.println("</html>");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
