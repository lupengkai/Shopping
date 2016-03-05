package com.shopping.servlet;

import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.util.Iterator;
import java.util.List;

import org.apache.commons.fileupload.*;
import org.apache.commons.fileupload.disk.DiskFileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.*;

/**
 * Created by tage on 3/4/16.
 */
@WebServlet(name = "FileUpload", urlPatterns = {"/FileUpload"}, loadOnStartup = 1, initParams = {@WebInitParam(name = "uploadpath", value = "/home/tage/IdeaProjects/Shopping/web/admin/images/")})
public class FileUpload extends HttpServlet {

    String uploadPath = "";

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=gbk");
        int id = -1;


        /*ServletContext servletContext = this.getServletConfig().getServletContext();
        File repository = (File) servletContext.getAttribute("javax.servlet.context.tempdir");*/


        boolean isMultipart = ServletFileUpload.isMultipartContent(request);
        DiskFileItemFactory factory = new DiskFileItemFactory();
        File repository = new File("/home/tage/temp");


        factory.setSizeThreshold(2048);

        factory.setRepository(repository);

        ServletFileUpload upload = new ServletFileUpload(factory);

        upload.setSizeMax(1000000000);

        try {
            List<FileItem> items = upload.parseRequest(request);
            String regExp = ".+/(.+)$";
            Iterator<FileItem> iter = items.iterator();
            System.out.println(items.size());
            while (iter.hasNext()) {
                FileItem item = iter.next();
                if (item.isFormField()) {
                    String name = item.getFieldName();
                    if (name.equals("id")) {
                        String value = item.getString();
                        id = Integer.parseInt(value);
                        System.out.println(id);

                    }

                } else {
                    String fieldName = item.getFieldName();
                    String fileName = item.getName();
                    String contentType = item.getContentType();
                    boolean isInMemeory = item.isInMemory();
                    long sizeInBytes = item.getSize();
                    item.write(new File(uploadPath + id + ".jpg"));

                }

            }
        } catch (FileUploadException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        }


    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    public void init(ServletConfig config) throws ServletException {
        uploadPath = config.getInitParameter("uploadpath");
    }
}
