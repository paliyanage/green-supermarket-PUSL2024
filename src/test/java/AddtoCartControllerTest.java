import com.ecom.controller.AddtoCartController;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.junit.Test;

import java.io.IOException;

import static org.mockito.Mockito.*;

public class AddtoCartControllerTest {
    @Test
    public void testService() throws ServletException, IOException {
        // Create mock objects
        HttpServletRequest request = mock(HttpServletRequest.class);
        HttpServletResponse response = mock(HttpServletResponse.class);
        RequestDispatcher dispatcher = mock(RequestDispatcher.class);

        // Define the behavior of the mock objects
        when(request.getAttribute("qti")).thenReturn("testQTI");
        when(request.getAttribute("product")).thenReturn("testProduct");
        when(request.getRequestDispatcher("cart.jsp")).thenReturn(dispatcher);

        // Create the servlet
        AddtoCartController servlet = new AddtoCartController();

        // Call the service method
        servlet.service(request, response);

        // Verify the interactions
        verify(request).getAttribute("qti");
        verify(request).getAttribute("product");
        verify(request).getRequestDispatcher("cart.jsp");
        verify(dispatcher).forward(request, response);



    }

}
