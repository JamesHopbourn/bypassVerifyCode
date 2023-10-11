package dev.james.bypassverifycode.web;

import cn.hutool.captcha.CaptchaUtil;
import cn.hutool.captcha.LineCaptcha;
import dev.james.bypassverifycode.common.Result;
import dev.james.bypassverifycode.entity.UserDetail;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Objects;

@Slf4j
@RestController
public class LoginController {
    @GetMapping
    public ModelAndView loginPage() {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("login.html");
        return modelAndView;
    }

    @GetMapping("getVerifyCode")
    public void getVerifyCode(HttpSession session, HttpServletResponse response) throws IOException {
        // 生成图片
        LineCaptcha lineCaptcha = CaptchaUtil.createLineCaptcha(200, 100, 4, 200);
        // 将验证码放在 session 的 code 属性里
        session.setAttribute("code", lineCaptcha.getCode());
        // 给前端返回验证码图片
        lineCaptcha.write(response.getOutputStream());
    }

    @PostMapping("login")
    public Result verify(HttpSession session, @RequestBody UserDetail userDetail) {
        String code = (String) session.getAttribute("code");
        boolean equals = Objects.equals(code, userDetail.getVerifyCode());
        log.info("code = {}", code);
        log.info("userDetail.getVerifyCode() = {}", userDetail.getVerifyCode());
        if (!equals) {
            return Result.failed("验证码错误");
        } else if (userDetail.getUsername().equals("admin") &&
                   userDetail.getPassword().equals("admin")) {
            return Result.success();
        } else {
            return Result.failed("用户名或者密码错误");
        }
    }

}
