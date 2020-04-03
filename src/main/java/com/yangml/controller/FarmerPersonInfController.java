package com.yangml.controller;

import com.yangml.dao.FarmerPublicInfMapper;
import com.yangml.pojo.*;
import com.yangml.service.AssessorService;
import com.yangml.service.FarmerprivInfService;
import com.yangml.utils.JsonResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.util.Date;

@Controller
@RequestMapping("self")
public class FarmerPersonInfController {
    @Autowired
    private FarmerprivInfService infService;

    @Autowired
    private AssessorService assessorService;

    @RequestMapping("/saveFarmerPerson")
    @ResponseBody
    public JsonResult saveFarmerPerson(HttpServletRequest request, FarmerprivInf farmerprivInf) {
        User user = (User) request.getSession().getAttribute("user");
        farmerprivInf.setUserId(user.getUserId());
        JsonResult jsonResult = infService.saveFarmerivInf(farmerprivInf);
        return jsonResult;
    }

    @RequestMapping("/fandFarmerPerson")
    @ResponseBody
    public JsonResult fandFarmerPerson(HttpServletRequest request) {
        User user = (User) request.getSession().getAttribute("user");
        JsonResult jsonResult = infService.findFarmerinInfByUserId(user.getUserId());
        return jsonResult;
    }

    @RequestMapping("/fandBasicpictPerson")
    @ResponseBody
    public JsonResult fandBasicpictPerson(HttpServletRequest request) {
        User user = (User) request.getSession().getAttribute("user");
        JsonResult jsonResult = infService.findBasicPictureByUserId(user.getUserId());
        return jsonResult;
    }


    @RequestMapping("/uploadPhotoLoan")
    @ResponseBody
    public JsonResult uploadPhotoLoan(MultipartFile photo, HttpServletRequest request) {
        JsonResult jsonResult =new JsonResult();
        User user = (User) request.getSession().getAttribute("user");
        if (photo == null) {
            jsonResult.setMsg("请选择要上传的文件");
            return jsonResult;
        }
        if (photo.getSize() > 1024 * 1024 * 10) {
            jsonResult.setMsg( "文件大小不能超过10M！");
            return jsonResult;
        }
        //获取文件后缀
        String suffix = photo.getOriginalFilename().substring(photo.getOriginalFilename().lastIndexOf(".") + 1, photo.getOriginalFilename().length());
        if (!"jpg,jpeg,gif,png".toUpperCase().contains(suffix.toUpperCase())) {
            jsonResult.setMsg( "请选择jpg,jpeg,gif,png格式的图片！");
            return jsonResult;
        }
        //获取项目根目录加上图片目录 webapp/static/imgages/upload/
        String savePath = System.getProperty("catalina.home") + "/webapps/file/";
        File savePathFile = new File(savePath);
        if (!savePathFile.exists()) {
            savePathFile.mkdir();
        }
        String filename = new Date().getTime() + "." + suffix;
        try {
            //将文件保存指定目录
            photo.transferTo(new File(savePath + filename));
        } catch (Exception e) {
            jsonResult.setMsg(  "保存文件异常！");
            e.printStackTrace();
            return jsonResult;
        }
        jsonResult.setMsg("OK");
        String url = "http://localhost:8080/file/"+filename;
        FarmerBasicPicture picture = new FarmerBasicPicture();
        picture.setFbpLoanUrl(url);
        picture.setUserId(user.getUserId());
        infService.uploadPicture(picture);
        //  如果项目上线要获取 域名地址
        jsonResult.setUrl(url);
        return jsonResult;
    }


    @RequestMapping("/uploadPhotoProduction")
    @ResponseBody
    public JsonResult uploadPhotoProduction(MultipartFile photo, HttpServletRequest request) {
        JsonResult jsonResult =new JsonResult();
        User user = (User) request.getSession().getAttribute("user");
        if (photo == null) {
            jsonResult.setMsg("请选择要上传的文件");
            return jsonResult;
        }
        if (photo.getSize() > 1024 * 1024 * 10) {
            jsonResult.setMsg( "文件大小不能超过10M！");
            return jsonResult;
        }
        //获取文件后缀
        String suffix = photo.getOriginalFilename().substring(photo.getOriginalFilename().lastIndexOf(".") + 1, photo.getOriginalFilename().length());
        if (!"jpg,jpeg,gif,png".toUpperCase().contains(suffix.toUpperCase())) {
            jsonResult.setMsg( "请选择jpg,jpeg,gif,png格式的图片！");
            return jsonResult;
        }
        //获取项目根目录加上图片目录 webapp/static/imgages/upload/
        String savePath = System.getProperty("catalina.home") + "/webapps/file/";
        File savePathFile = new File(savePath);
        if (!savePathFile.exists()) {
            savePathFile.mkdir();
        }
        String filename = new Date().getTime() + "." + suffix;
        try {
            //将文件保存指定目录
            photo.transferTo(new File(savePath + filename));
        } catch (Exception e) {
            jsonResult.setMsg(  "保存文件异常！");
            e.printStackTrace();
            return jsonResult;
        }
        jsonResult.setMsg("OK");
        String url = "http://localhost:8080/file/"+filename;
        FarmerBasicPicture picture = new FarmerBasicPicture();
        picture.setFbpProductionUrl(url);
        picture.setUserId(user.getUserId());
        infService.uploadPicture(picture);
        //  如果项目上线要获取 域名地址
        jsonResult.setUrl(url);
        return jsonResult;
    }

    @RequestMapping("/findAllFarmerInf")
    @ResponseBody
    public JsonResult findAllFarmerInf(int pageNumber, int pageSize){
        JsonResult jsonResult = infService.findAllFarmerInf(pageNumber,pageSize);
        return jsonResult;
    }

    @RequestMapping("/fandUnExamineFarmerPerson")
    @ResponseBody
    public JsonResult fandUnExamineFarmerPerson(int userId) {
        JsonResult jsonResult = infService.findFarmerinInfByUserId(userId);
        return jsonResult;
    }

    @RequestMapping("/fandUnExamineBasicpictPerson")
    @ResponseBody
    public JsonResult fandUnExamineBasicpictPerson(int userId) {
        JsonResult jsonResult = infService.findBasicPictureByUserId(userId);
        return jsonResult;
    }

    @RequestMapping("/updateExamine")
    @ResponseBody
    public JsonResult updateExamine(HttpServletRequest request, FarmerprivInf farmerprivInf) {
        User user = (User) request.getSession().getAttribute("user");
        AssessorInf assessor = assessorService.findAssessorByUserId(user.getUserId());
        farmerprivInf.setExamineOperator(assessor.getAssName());
        JsonResult jsonResult = infService.updateExamine(farmerprivInf);
        return jsonResult;
    }


}
