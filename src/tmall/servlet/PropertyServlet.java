package tmall.servlet;

import tmall.bean.Category;
import tmall.bean.Product;
import tmall.bean.Property;
import tmall.util.Page;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * Created by shaoqi on 18/4/11.
 */
public class PropertyServlet extends BaseBackServlet{


    public  String add(HttpServletRequest request, HttpServletResponse response, Page page){

        String name = request.getParameter("name");
        String cid = request.getParameter("cid");
        Property p = new Property();
        p.setName(name);
        p.setCategory(categoryDAO.get(Integer.parseInt(cid)));
        propertyDAO.add(p);

        return "@admin_property_list?cid="+cid;
    }
    public  String delete(HttpServletRequest request, HttpServletResponse response, Page page){
        return null;
    }
    public  String edit(HttpServletRequest request, HttpServletResponse response, Page page) {
        int cid = Integer.parseInt(request.getParameter("cid"));
        Category c = categoryDAO.get(cid);
        request.setAttribute("cname",c.getName());
        Property p = propertyDAO.get(Integer.parseInt(request.getParameter("id")));
        request.setAttribute("c",p);
        return "admin/editProperty.jsp";
    }
    public  String update(HttpServletRequest request, HttpServletResponse response, Page page) {
        return null;
    }


    public String list(HttpServletRequest request, HttpServletResponse response, Page page) {

        int cid = Integer.parseInt(request.getParameter("cid"));

        List<Property> cs = propertyDAO.list( cid,page.getStart(),page.getCount());
        Category ca = categoryDAO.get(cid);
        int total = propertyDAO.getTotal(cid);
        page.setTotal(total);
        request.setAttribute("ca",ca);
        request.setAttribute("thecs", cs);
        request.setAttribute("page", page);

        return "admin/listProperty.jsp";
    }

}
