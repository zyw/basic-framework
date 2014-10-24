package cn.v5cn.basicframework.action;

import cn.v5cn.basicframework.entity.SystemUser;
import cn.v5cn.basicframework.service.SystemUserService;
import cn.v5cn.basicframework.util.HttpUtils;
import cn.v5cn.basicframework.util.SystemUtils;
import com.google.common.collect.ImmutableMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;

import static cn.v5cn.basicframework.util.MessageSourceHelper.getMessage;

/**
 * Created by ZYW on 2014/10/23.
 */
@Controller
@RequestMapping("/user")
public class UserAction {

    @Autowired
    private SystemUserService systemUserService;

    @RequestMapping(value = "/list",method = RequestMethod.GET)
    public String userList(){
        return "system/user_list";
    }

    @RequestMapping(value = "/edit/{userId}",method = RequestMethod.GET)
    public String userEdit(@PathVariable Long userId,ModelMap modelMap){
        if(userId == null || userId == 0){
            modelMap.addAttribute("user",new SystemUser());
            modelMap.addAttribute("roles",systemUserService.findAllRolesAndIsSelected(null));
        }
        return "system/user_edit";
    }

    @ResponseBody
    @RequestMapping(value = "/edit",method = RequestMethod.POST)
    public ImmutableMap<String,String> userEdit(SystemUser user,Long[] roleIds,MultipartFile file,HttpServletRequest request){
        if(!file.isEmpty()){
            String realPath = HttpUtils.getRealPath(request, SystemUtils.AVATAR_PATH);
            SystemUtils.isNotExistCreate(realPath);
            String fileNameExt = SystemUtils.getFileNameExt(file.getOriginalFilename());

            if(!SystemUtils.IMG_EXT_NAMES.contains(fileNameExt.toLowerCase())){
                return ImmutableMap.of("status","-1","message",getMessage("user.uploadtypenonsupport.message"));
            }
            String timeFileName = SystemUtils.timeFileName(file.getOriginalFilename());
            System.out.println(realPath + "++++" +timeFileName);
            try {
                file.transferTo(new File(realPath+"/"+timeFileName));
                user.setOriginalPic(timeFileName);
            } catch (IOException e) {
                e.printStackTrace();
                return ImmutableMap.of("status","0","message",getMessage("user.uploadfailed.message") + e.getMessage());
            }
        }else{
            if(user.getSex()==1){
                user.setOriginalPic("avatar1.jpg");
            }else {
                user.setOriginalPic("avatar0.jpg");
            }
        }
        System.out.println(roleIds.length + "===================");
        System.out.println(roleIds[0] + "===================");
        System.out.println(user+"+++++++++++++++++++");
        System.out.println(user.getName()+"+++++++++++++++++++");
        return ImmutableMap.of("ddd","ddd");
    }
}
