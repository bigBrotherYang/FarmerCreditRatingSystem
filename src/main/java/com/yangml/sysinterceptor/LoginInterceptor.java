package com.yangml.sysinterceptor;

import com.yangml.dao.SysLogMapper;
import com.yangml.pojo.SysLog;
import com.yangml.pojo.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.PrintWriter;

public class LoginInterceptor extends HandlerInterceptorAdapter {
    @Autowired
    private SysLogMapper sysLogMapper;
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        Object userObj=request.getSession().getAttribute("user");
        if(userObj!=null){
            //若用户信息不为空则将session里的用户信息转换成PersonInfos实体类对象
            User user=(User)userObj;
            if(user!=null&&user.getUserId()!=null&&user.getUserId()>0&&user.getAllowLogin()==1){
                //若通过验证则返回true，拦截器返回true，控制层业务执行
                SysLog sysLog = new SysLog();
                sysLog.setOpeerationUser(user.getUserName());
                sysLog.setOpeerationMethod(request.getRequestURI());
                sysLogMapper.insertSelective(sysLog);
                return true;
            }

        }
//        response.sendRedirect("/login.jsp");
//        request.setAttribute("msg","请登入后访问该方法！");
//        request.getRequestDispatcher("/login.jsp").forward(request,response);

        //若不满验证，则直接跳转到登录界面
        PrintWriter out=response.getWriter();
        out.println("msg:请登入后访问该方法！");
//        out.println("<html>");
//        out.println("<script>");
//        out.println("window.open ('" + request.getContextPath()
//                + "/login?msg=请登入后访问该方法！','_self')");
//        out.println("</script>");
//        out.println("<html>");
        return false;
    }
}
