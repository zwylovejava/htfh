package com.boot.controller;

import java.io.IOException;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hssf.util.HSSFColor;
import org.apache.poi.xssf.usermodel.XSSFCellStyle;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.boot.pojo.Product;
import com.boot.service.ProductService;
@Controller
public class ExcelController {
	@Autowired
	private ProductService productService;
	@RequestMapping("/back/reprotRecord")  
    public String reprotRecord(HttpServletResponse response) throws IOException {  
        // 文件名称  
        String fileName = URLEncoder.encode("商品列表.xls", "utf-8");  
        // 通过response设置Content-Type、Content-Disposition  
        response.setContentType("application/vnd.ms-excel");  
        response.setHeader("Content-Disposition",  
                "attachment;filename*=utf-8'zh_cn'" + fileName);
        OutputStream outputStream = null;  
        HSSFWorkbook workBook = null; 
        try {  
            // 获取输出流  
            outputStream = response.getOutputStream();  
            // 生成workBook  
            workBook = createWorkbook();  
            workBook.write(outputStream);  
        } catch (IOException e) {  
            e.printStackTrace();  
        }finally{  
            //关闭  
            if (outputStream!=null) {  
                outputStream.close();  
            }  
        }  
        return "back/sales_volume";  
    }  
    public HSSFWorkbook createWorkbook() {  
        // 创建表格  
        HSSFWorkbook workBook = new HSSFWorkbook();  
        // 创建工作簿  
        HSSFSheet sheet = workBook.createSheet("商品列表");  
        // 样式  
        HSSFCellStyle style = workBook.createCellStyle();  
        // 创建Font  
        HSSFFont font = workBook.createFont();  
        // 设置字体  
        font.setColor(HSSFColor.VIOLET.index);
		font.setFontHeightInPoints((short) 12);
		font.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);
        style.setFont(font);
        style.setFillForegroundColor(HSSFColor.SKY_BLUE.index);
		style.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);
		style.setBorderBottom(HSSFCellStyle.BORDER_THIN);
		style.setBorderLeft(HSSFCellStyle.BORDER_THIN);
		style.setBorderRight(HSSFCellStyle.BORDER_THIN);
		style.setBorderTop(HSSFCellStyle.BORDER_THIN);
		style.setAlignment(HSSFCellStyle.ALIGN_CENTER);
        short width = 25,height=25*20;
        sheet.setDefaultColumnWidth(width);  
        //style.setAlignment(XSSFCellStyle.ALIGN_RIGHT); // 居中
        style.setFont(font); 
        
        // 生成并设置另一个样式
        HSSFCellStyle style2 = workBook.createCellStyle();
        style2.setFillForegroundColor(HSSFColor.LIGHT_YELLOW.index);
		style2.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);
		style2.setBorderBottom(HSSFCellStyle.BORDER_THIN);
		style2.setBorderLeft(HSSFCellStyle.BORDER_THIN);
		style2.setBorderRight(HSSFCellStyle.BORDER_THIN);
		style2.setBorderTop(HSSFCellStyle.BORDER_THIN);
		style2.setAlignment(HSSFCellStyle.ALIGN_CENTER);
		style2.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);
		// 生成另一个字体
		HSSFFont font2 = workBook.createFont();
		font2.setBoldweight(HSSFFont.BOLDWEIGHT_NORMAL);
		// 把字体应用到当前的样式
		style2.setFont(font2);
  
        // 创建行(表头)  
        HSSFRow row = sheet.createRow(0);  
        //创建列  
        HSSFCell cell_01 = row.createCell(0);  
        cell_01.setCellValue("商品id");  
        cell_01.setCellStyle(style);  
        HSSFCell cell_02 = row.createCell(1);  
        cell_02.setCellValue("销量");  
        cell_02.setCellStyle(style);  
        HSSFCell cell_03 = row.createCell(2);  
        cell_03.setCellValue("商品名称");  
        cell_03.setCellStyle(style);  
        HSSFCell cell_04 = row.createCell(3);  
        cell_04.setCellValue("shop");  
        cell_04.setCellStyle(style);  
        HSSFCell cell_05 = row.createCell(4);  
        cell_05.setCellValue("价格");  
        cell_05.setCellStyle(style);  
        HSSFCell cell_06 = row.createCell(5);  
        cell_06.setCellValue("描述");  
        cell_06.setCellStyle(style);  
  
        // 内容 真实环境查询数据库List，进行for遍历  
        List<Product> listSwipeRecord = productService.findAll();  
        for (int i = 0; i < listSwipeRecord.size(); i++) {  
            HSSFRow row1 = sheet.createRow(i+1);  
            row1.setHeight((short) 300);  
            Product swipeRecord = listSwipeRecord.get(i);  
            HSSFCell c1 = row1.createCell(0);
            c1.setCellValue(swipeRecord.getProductId());
            c1.setCellStyle(style2);
            HSSFCell c2 = row1.createCell(1); 
            c2.setCellValue(swipeRecord.getSaleNum());
            c2.setCellStyle(style2);
            HSSFCell c3 = row1.createCell(2);  
            c3.setCellValue(swipeRecord.getProName()); 
            c3.setCellStyle(style2);
            HSSFCell c4 = row1.createCell(3);  
            c4.setCellValue(swipeRecord.getShop());
            c4.setCellStyle(style2);
            HSSFCell c5 = row1.createCell(4);  
            c5.setCellValue(swipeRecord.getPrice());
            c5.setCellStyle(style2);
            HSSFCell c6 = row1.createCell(5);  
            c6.setCellValue(swipeRecord.getDescription());
            c6.setCellStyle(style2); 
        }  
        return workBook;  
  
    }  
}
