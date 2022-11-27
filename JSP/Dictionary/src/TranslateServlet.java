import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;

@WebServlet("/translate")
public class TranslateServlet extends HttpServlet {
    StorageTranslate storageTranslate = new StorageTranslate();
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String translate = request.getParameter("Vni");
        HashMap<String, String> dictionary = StorageTranslate.getDictionary();
        PrintWriter writer = response.getWriter();

        String translated = dictionary.get(translate);
        if(translated != null){
            writer.println("<html>");
            writer.println("<h1>"+translate+" co nghia la "+translated+"</h1>");
            writer.println("</html>");
        }else{
            response.sendRedirect("NewWord.jsp");
        }

    }

}
