package dev.james.bypassverifycode.entity;

import lombok.Data;

@Data
public class UserDetail {
    private String username;
    private String password;
    private String verifyCode;
}
