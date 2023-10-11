package dev.james.bypassverifycode.common;

import lombok.Data;

@Data
public class Result {
    private int code;
    private String message;

    private Result(int code, String message) {
        this.code = code;
        this.message = message;
    }

    public static Result success(){
        return new Result(200, "登陆成功");
    }

    public static Result failed(String message){
        return new Result(400, message);
    }
}
