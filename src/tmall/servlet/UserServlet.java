package tmall.servlet;

import tmall.bean.User;
import tmall.dao.UserDAO;
import tmall.util.Page;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * Created by shaoqi on 18/4/11.
 */
public class UserServlet extends BaseBackServlet{



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
        List<User> cs = userDAO.list(page.getStart(),page.getCount());
        int total = userDAO.getTotal();
        page.setTotal(total);

        request.setAttribute("thecs", cs);
        request.setAttribute("page", page);

        return "admin/listUser.jsp";
    }


}
