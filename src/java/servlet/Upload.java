package servlet;

import java.io.File;
import java.io.IOException;
import java.text.DecimalFormat;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.lang.StringUtils;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.FormulaEvaluator;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import Database.DbConnection;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.text.SimpleDateFormat;
import org.apache.poi.ss.usermodel.DataFormatter;
import org.apache.poi.ss.usermodel.DateUtil;

/**
 * Servlet implementation class Upload
 */
@WebServlet("/Upload")
public class Upload extends HttpServlet {

    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public Upload() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
     * response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        response.getWriter().append("Served at: ").append(request.getContextPath());
    }

    private static final int THRESHOLD_SIZE = 1024 * 1024 * 3; // 3MB
    private static final int MAX_FILE_SIZE = 1024 * 1024 * 40; // 40MB
    private static final int MAX_REQUEST_SIZE = 1024 * 1024 * 50; // 50MB

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
     * response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        PrintWriter out = response.getWriter();
        DiskFileItemFactory factory = new DiskFileItemFactory();
        factory.setSizeThreshold(THRESHOLD_SIZE);
        factory.setRepository(new File(System.getProperty("java.io.tmpdir")));

        ServletFileUpload upload = new ServletFileUpload(factory);
        upload.setFileSizeMax(MAX_FILE_SIZE);
        upload.setSizeMax(MAX_REQUEST_SIZE);
        DecimalFormat dec = new DecimalFormat("#0.00");
        int id = 0;
                Connection con = DbConnection.getconnection();
        try {
            //            Delete Starts
         
//            Delete Ends  

            List formItems = upload.parseRequest(request);
            Iterator iter = formItems.iterator();
            while (iter.hasNext()) {
                FileItem item = (FileItem) iter.next();
                if (!item.isFormField()) {
                    String fileName = new File(item.getName()).getName();
                    if (!StringUtils.isEmpty(fileName)) {
                        Workbook workbook = null;
                        try {
                            workbook = new XSSFWorkbook(item.getInputStream());
                            Sheet firstSheet = workbook.getSheetAt(0);
                            Row headerrow = firstSheet.getRow(0);
                            FormulaEvaluator evaluator = workbook.getCreationHelper().createFormulaEvaluator();
                            int firstrow = firstSheet.getFirstRowNum() + 1;
                            int lastrow = firstSheet.getLastRowNum();
                            for (int rowNum = firstrow; rowNum <= lastrow; rowNum++) {
                                Row row = firstSheet.getRow(rowNum);
                                if (row == null) {
                                    continue;
                                }
                                String Rollnumber = "", Tenthpercentage = "", Tenthpassoutyear = "", Interpercentage = "",Interpassoutyear = "",Btechpercentage = "",Backlogs = "";

                                Cell namecell = row.getCell(0);
                                if (namecell.getCellType() == Cell.CELL_TYPE_STRING) {
                                    Rollnumber = namecell.getStringCellValue();
                                } else if (namecell.getCellType() == Cell.CELL_TYPE_NUMERIC) {
                                    Rollnumber = String.valueOf(Double.valueOf(namecell.getNumericCellValue()).intValue());
                                }
                                Cell modelcell = row.getCell(1);
                                if (modelcell.getCellType() == Cell.CELL_TYPE_STRING) {
                                    Tenthpercentage = modelcell.getStringCellValue();
                                } else if (modelcell.getCellType() == Cell.CELL_TYPE_NUMERIC) {
                                    Tenthpercentage = String.valueOf(Double.valueOf(modelcell.getNumericCellValue()).intValue());
                                }
                                Cell mnfcell = row.getCell(2);
                                if (mnfcell.getCellType() == Cell.CELL_TYPE_STRING) {
                                    Tenthpassoutyear = mnfcell.getStringCellValue();
                                } else if (mnfcell.getCellType() == Cell.CELL_TYPE_NUMERIC) {
                                    Tenthpassoutyear = String.valueOf(Double.valueOf(mnfcell.getNumericCellValue()).intValue());
                                }
                                Cell categorycell = row.getCell(3);
                                if (categorycell.getCellType() == Cell.CELL_TYPE_STRING) {
                                    Interpercentage = categorycell.getStringCellValue();
                                } else if (categorycell.getCellType() == Cell.CELL_TYPE_NUMERIC) {
                                    Interpercentage = String.valueOf(Double.valueOf(categorycell.getNumericCellValue()).intValue());
                                }
                                Cell Interpassoutyearcell = row.getCell(4);
                                if (Interpassoutyearcell.getCellType() == Cell.CELL_TYPE_STRING) {
                                    Interpassoutyear = Interpassoutyearcell.getStringCellValue();
                                } else if (modelcell.getCellType() == Cell.CELL_TYPE_NUMERIC) {
                                    Interpassoutyear = String.valueOf(Double.valueOf(Interpassoutyearcell.getNumericCellValue()).intValue());
                                }
                                Cell Btechpercentagecell = row.getCell(5);
                                if (Btechpercentagecell.getCellType() == Cell.CELL_TYPE_STRING) {
                                    Btechpercentage = Btechpercentagecell.getStringCellValue();
                                } else if (Btechpercentagecell.getCellType() == Cell.CELL_TYPE_NUMERIC) {
                                    Btechpercentage = String.valueOf(Double.valueOf(Btechpercentagecell.getNumericCellValue()).intValue());
                                }
                                Cell Backlogscell = row.getCell(6);
                                if (Backlogscell.getCellType() == Cell.CELL_TYPE_STRING) {
                                    Backlogs = Backlogscell.getStringCellValue();
                                } else if (Backlogscell.getCellType() == Cell.CELL_TYPE_NUMERIC) {
                                    Backlogs = String.valueOf(Double.valueOf(Backlogscell.getNumericCellValue()).intValue());
                                }
                               
//fdgdsafhkj
                                try {
                                    PreparedStatement pst = con.prepareStatement("insert into upload values(?,?,?,?,?,?,?)");
                                    pst.setString(1, Rollnumber);
                                    pst.setString(2, Tenthpercentage);
                                    pst.setString(3, Tenthpassoutyear);
                                    pst.setString(4, Interpercentage);
                                    pst.setString(5, Interpassoutyear);
                                    pst.setString(6, Btechpercentage);
                                    pst.setString(7, Backlogs);
                                    
                                    pst.executeUpdate();
                                } catch (Exception e) {
                                    out.println(e);
                                }

                            }

                        } catch (Exception e) {
                            e.printStackTrace();
                        }
                    }
                }
            }
            request.setAttribute("message", "Upload has been done successfully!");
            response.sendRedirect("upload.jsp?m1=success");
        } catch (Exception ex) {
            request.setAttribute("message", "There was an error: " + ex.getMessage());
        }
    }

}
