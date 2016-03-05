package com.shopping.reports;

import com.shopping.util.DB;
import org.jfree.chart.ChartFactory;
import org.jfree.chart.ChartUtilities;
import org.jfree.chart.JFreeChart;
import org.jfree.chart.plot.PlotOrientation;
import org.jfree.data.category.DefaultCategoryDataset;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * Created by tage on 3/5/16.
 */
@WebServlet(name = "ShowProductSalesServlet", urlPatterns = "/ShowProductSalesServlet")
public class ShowProductSalesServlet extends HttpServlet {

    private DefaultCategoryDataset getDataSet() {
        DefaultCategoryDataset dataset = new DefaultCategoryDataset();

        Connection connection = null;
        ResultSet rs = null;

        try {
            connection = DB.getConn();
            String sql = "select name , sum(pcount) from product p join salesitem si on (p.id=si.productid) group by p.id";
            System.out.println(sql);
            rs = DB.executeQuery(connection, sql);
            while (rs.next()) {
                dataset.addValue(rs.getInt(2), rs.getString(1), "");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }


        return dataset;
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        JFreeChart barChat = ChartFactory.createBarChart3D(
                "Product Sale Statics",
                "product",
                "sale",
                getDataSet(),
                PlotOrientation.VERTICAL,
                true, true, false
        );
        ChartUtilities.saveChartAsJPEG(new File("/home/tage/IdeaProjects/Shopping/web/admin/images/reports/salesshow.jpg"), barChat, 640, 480);
        this.getServletContext().getRequestDispatcher("/admin/showproductsaleschart.jsp").forward(request, response);
    }
}
