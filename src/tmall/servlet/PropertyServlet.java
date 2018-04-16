package tmall.servlet;

import tmall.bean.Category;
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
        int id = Integer.parseInt(request.getParameter("id"));
        int cid = propertyDAO.get(id).getCategory().getId();
        propertyDAO.delete(id);
        return "@admin_property_list?cid="+cid;
    }
    public  String edit(HttpServletRequest request, HttpServletResponse response, Page page) {
        int id = Integer.parseInt(request.getParameter("id"));
        Category c = propertyDAO.get(id).getCategory();
        request.setAttribute("ca",c);
        Property p = propertyDAO.get(id);
        request.setAttribute("c",p);
        return "admin/editProperty.jsp";
    }
    public  String update(HttpServletRequest request, HttpServletResponse response, Page page) {

        int id = Integer.parseInt(request.getParameter("id"));
        int cid = Integer.parseInt(request.getParameter("cid"));
        String name = request.getParameter("name");
        Property p = new Property();
        p.setId(id);
        p.setCategory(categoryDAO.get(cid));
        p.setName(name);
        propertyDAO.update(p);

        return "@admin_property_list?cid="+cid;
    }


    public String list(HttpServletRequest request, HttpServletResponse response, Page page) {

        int cid = Integer.parseInt(request.getParameter("cid"));
        List<Property> cs = propertyDAO.list( cid,page.getStart(),page.getCount());
        Category ca = categoryDAO.get(cid);
        int total = propertyDAO.getTotal(cid);
        page.setTotal(total);
        page.setParam("&cid="+ca.getId());
        request.setAttribute("ca",ca);
        request.setAttribute("thecs", cs);
        request.setAttribute("page", page);

        return "admin/listProperty.jsp";
    }

}
