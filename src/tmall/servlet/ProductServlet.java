package tmall.servlet;

import tmall.bean.*;
import tmall.dao.ProductDAO;
import tmall.util.ImageUtil;
import tmall.util.Page;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.*;

/**
 * Created by shaoqi on 18/4/11.
 */
public class ProductServlet extends BaseBackServlet {

    public String add(HttpServletRequest request, HttpServletResponse response, Page page) {
        String name = request.getParameter("name");
        String cid = request.getParameter("cid");
        String subTitle = request.getParameter("subTitle");
        String orignalPrice = request.getParameter("orignalPrice");
        String promotePrice = request.getParameter("promotePrice");
        String stock = request.getParameter("stock");

        Product p = new Product();
        p.setCreateDate(new Date());
        p.setSubTitle(subTitle);
        p.setOrignalPrice(Float.parseFloat(orignalPrice));
        p.setPromotePrice(Float.parseFloat(promotePrice));
        p.setStock(Integer.parseInt(stock));

        request.setAttribute("ca", categoryDAO.get(Integer.parseInt(cid)));
        p.setName(name);
        p.setCategory(categoryDAO.get(Integer.parseInt(cid)));
        productDAO.add(p);

        return "@admin_product_list?cid=" + cid;
    }

    public String delete(HttpServletRequest request, HttpServletResponse response, Page page) {
        int id = Integer.parseInt(request.getParameter("id"));
        int cid = productDAO.get(id).getCategory().getId();
        productDAO.delete(id);
        return "@admin_product_list?cid=" + cid;
    }

    public String edit(HttpServletRequest request, HttpServletResponse response, Page page) {
        int cid = Integer.parseInt(request.getParameter("cid"));
        Category c = categoryDAO.get(cid);
        request.setAttribute("cname", c.getName());
        Product p = productDAO.get(Integer.parseInt(request.getParameter("id")));
        request.setAttribute("c", p);
        return "admin/editProduct.jsp";
    }

    public String update(HttpServletRequest request, HttpServletResponse response, Page page) {
        int id = Integer.parseInt(request.getParameter("id"));
        int cid = Integer.parseInt(request.getParameter("cid"));
        String name = request.getParameter("name");
        Product p = new Product();
        p.setId(id);
        p.setCategory(categoryDAO.get(cid));
        p.setName(name);
        productDAO.update(p);

        return "@admin_product_list?cid=" + cid;
    }


    public String list(HttpServletRequest request, HttpServletResponse response, Page page) {
        int cid = Integer.parseInt(request.getParameter("cid"));
        List<Product> cs = productDAO.list(cid, page.getStart(), page.getCount());
        Category c = categoryDAO.get(cid);
        int total = productDAO.getTotal(cid);
        page.setTotal(total);
        request.setAttribute("ca", c);
        request.setAttribute("thecs", cs);
        request.setAttribute("page", page);

        return "admin/listProduct.jsp";
    }


    public String picadd(HttpServletRequest request, HttpServletResponse response, Page page) {
        List<ProductImage> singlepis = new ArrayList<>();
// 处理参数,包括一般参数和文件上传
        Map<String, String> params = new HashMap<>();
        InputStream is = super.parseUpload(request, params);
        Product p = productDAO.get(Integer.parseInt(params.get("pid")));
        p.setProductSingleImages(singlepis);


        ProductImage pi = new ProductImage();
        pi.setType(params.get("type")); // 单个图片
        pi.setProduct(p);
        productImageDAO.add(pi);

        File imageFolder = new File(request.getSession().getServletContext().getRealPath("img/product"));
        File file = new File(imageFolder, pi.getId() + ".jpg");
        file.getParentFile().mkdir();

        try {
            if (null != is && 0 != is.available()) {
                try (FileOutputStream fos = new FileOutputStream(file)) {
                    byte b[] = new byte[1024 * 1024];
                    int length = 0;
                    while (-1 != (length = is.read(b))) {
                        fos.write(b, 0, length);
                    }
                    fos.flush();
                    //通过如下代码，把文件保存为jpg格式
                    BufferedImage img = ImageUtil.change2jpg(file);
                    ImageIO.write(img, "jpg", file);
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        return "@admin_product_pic?id=" + p.getId();
    }


    public String pic(HttpServletRequest request, HttpServletResponse response, Page page) {
        int pid = Integer.parseInt(request.getParameter("id"));
        Product p = productDAO.get(pid);

        List<ProductImage> thesc1 = productImageDAO.list(p, "single");
        List<ProductImage> thesc2 = productImageDAO.list(p, "detail");

        request.setAttribute("thecs1", thesc1);
        request.setAttribute("thecs2", thesc2);
        request.setAttribute("p", p);


        return "admin/pic.jsp";
    }

    public String set(HttpServletRequest request, HttpServletResponse response, Page page) {

        int pid = Integer.parseInt(request.getParameter("id"));

        Product p = productDAO.get(pid);
        request.setAttribute("p", p);

        List<Property> pts= propertyDAO.list(p.getCategory().getId());
        propertyValueDAO.init(p);

        List<PropertyValue> pvs = propertyValueDAO.list(p.getId());

        request.setAttribute("pvs", pvs);


        return "admin/set.jsp";
    }

    public String delpic(HttpServletRequest request, HttpServletResponse response, Page page) {

        int imageid = Integer.parseInt(request.getParameter("id"));
        int pid = productImageDAO.get(imageid).getProduct().getId();
        productImageDAO.delete(imageid);
        return "@admin_product_pic?id=" + pid;

    }
    public String updateP(HttpServletRequest request, HttpServletResponse response, Page page) {



        return "";
    }
}