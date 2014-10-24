package cn.v5cn.basicframework.util;

import com.google.common.collect.Lists;
import org.apache.commons.io.FilenameUtils;
import org.apache.commons.lang3.StringUtils;

import java.io.File;
import java.io.Serializable;
import java.util.Date;
import java.util.List;

/**
 * Created by ZYW on 2014/7/18.
 */
public class SystemUtils {

    public static final String AVATAR_PATH = "/WEB-INF/upload/avatar";

    public static final List<String> IMG_EXT_NAMES = Lists.newArrayList(".png",".jpg",".gif");

    public static String getFileNameExt(String fileName){
        if(fileName == null || StringUtils.isEmpty(fileName)){
            throw new RuntimeException("参数fileName不能为空值！");
        }
        return "."+FilenameUtils.getExtension(fileName);
    }

    public static String timeFileName(String fileName){
        String fileExt = getFileNameExt(fileName);
        return new Date().getTime()+fileExt;
    }
    /**
     * 判断目录是否存在，如果不存在就创建
     * */
    public static boolean isNotExistCreate(String filePath){
        File f = new File(filePath);
        if(!f.exists()){
            return f.mkdirs();
        }
        return true;
    }

    /**
     * 分页字符串拼接
     * */
    public static <T extends Serializable> String pagination(Pagination<T> page,String href){
        StringBuilder htmlSb = new StringBuilder("<ul class='pagination pagination-sm no-margin pull-right'  style=\"margin-top: 10px;\">");
        if(page.getPageNum() == 1){
            htmlSb.append("<li class='disabled'><a>&laquo;</a></li>");
        }else{
            htmlSb.append("<li><a href='").append(href+"/1").append("'>&laquo;</a></li>");
        }
        int currPage = page.getPageNum();
        int page_start = currPage - 3 > 0 ? currPage-3 : 1;
        int page_end = page_start + 4 >= page.getPageCount() ? page.getPageCount() : page_start + 4;
        if(page_start > 1){
            htmlSb.append("<li><a>...</a></li>");
        }
        for(int i = page_start; i <= page_end; i++){
            int pageIndex = i;
            if(i == currPage){
                htmlSb.append("<li class='disabled'><a>").append(i).append("</a></li>");
            }else{
                htmlSb.append("<li><a href='").append(href+"/"+pageIndex).append("'>").append(i).append("</a></li>");
            }
        }
        if(page_end < page.getPageCount()){
            htmlSb.append("<li><a>...</a></li>");
        }
        if(currPage == page.getPageCount()) {
            htmlSb.append("<li class='disabled'><a>&raquo;</a></li>");
        }else{
            htmlSb.append("<li><a href='").append(href+"/"+(page.getPageCount())).append("'>&raquo;</a></li>");
        }
        htmlSb.append("</ul>");
        return htmlSb.toString();
    }
 }
