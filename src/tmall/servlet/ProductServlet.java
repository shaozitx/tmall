package tmall.servlet;

import tmall.bean.Product;
import tmall.bean.User;
import tmall.util.Page;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * Created by shaoqi on 18/4/11.
 */
public class ProductServlet extends BaseBackServlet {

    public  String add(HttpServletRequest request, HttpServletResponse response, Page page){
        return null;
    }
    public  String delete(HttpServletRequest request, HttpServletResponse response, Page page){
        return null;
    }
    public  String edit(HttpServletRequest request, HttpServletResponse response, Page page) {
        return null;
    }
    public  String update(HttpServletRequest request, HttpServletResponse response, Page page) {
        return null;
    }


    public String list(HttpServletRequest request, HttpServletResponse response, Page page) {
        List<Product> cs = productDAO.list(page.getStart(),page.getCount());
        int cid = Integer.parseInt(request.getParameter("cid"));

        int total = productDAO.getTotal(cid);
        page.setTotal(total);

        request.setAttribute("thecs", cs);
        request.setAttribute("page", page);

        return "admin/listProduct.jsp";
    }
}
