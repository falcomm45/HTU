package kr.or.ddit.vo;

import java.util.Date;

import lombok.Data;

@Data
public class KakaoPayReadVO {
    
    //response
    private String tid, next_redirect_pc_url;
    private Date created_at;
    
}