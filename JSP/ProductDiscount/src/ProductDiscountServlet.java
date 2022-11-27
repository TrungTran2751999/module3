import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/display-discount")
public class ProductDiscountServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String description = request.getParameter("desription");
        PrintWriter writer = response.getWriter();
        double listPrice = 0;
        double discountPercent = 0;
        writer.println("<html>");
        try {
            listPrice = Double.parseDouble(request.getParameter("listPrice"));
            discountPercent= Double.parseDouble(request.getParameter("discountPercent"));
        }catch (Exception e){
            writer.println("<h2>"+"Error"+"</h2>");
            return;
        }
        System.out.println(listPrice);
        System.out.println(discountPercent);
        if(!description.equals("") && listPrice != 0 && discountPercent !=0){
            System.out.println("bbbbbbbbbbb");
            writer.println("<h2>"+"Product Description: "+description+"</h2>");
            writer.println("<h2>"+"List Price: "+listPrice+"</h2>");
            writer.println("<h2>"+"Discount Percent: "+discountPercent+"</h2>");
            writer.println("<h2>"+"Discount Amount: "+listPrice*discountPercent*0.01+"</h2>");
            writer.println("<h2>"+"Discount Price: "+(listPrice-listPrice*discountPercent*0.01)+"</h2>");
        }else{
            System.out.println("rrrrrrrrrrrr");
            writer.println("<h2>"+"Data input is wrong"+"</h2>");
        }
        writer.println("</html>");

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
