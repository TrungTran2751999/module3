import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/NewWord")
public class NewWordServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String newWord = request.getParameter("newWord");
        String vni = request.getParameter("Vni");
        StorageTranslate.addDictionary(vni, newWord);
        System.out.println(StorageTranslate.getDictionary().get(vni));
    }
}
