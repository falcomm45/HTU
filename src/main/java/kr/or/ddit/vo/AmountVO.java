package kr.or.ddit.vo;

import lombok.Data;

@Data
public class AmountVO {
 
    private Integer total, tax_free, vat, point, discount;
}
