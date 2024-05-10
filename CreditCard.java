package model;

import java.sql.Date;

/**
 *
 * @author ACER
 */
public class CreditCard {

    private int CreditCardId;
    private int CreditCardNo;
    private String creditCardType;
    private String CardHolderName;
    private int CreditCardCvv;
    private String ExpDate;

    public CreditCard() {
    }

    public CreditCard(int CreditCardNo, String creditCardType, String CardHolderName, int CreditCardCvv, String ExpDate) {
        this.CreditCardNo = CreditCardNo;
        this.creditCardType = creditCardType;
        this.CardHolderName = CardHolderName;
        this.CreditCardCvv = CreditCardCvv;
        this.ExpDate = ExpDate;
    }

    public CreditCard(int CreditCardId, int CreditCardNo, String creditCardType, String CardHolderName, int CreditCardCvv, String ExpDate) {
        this.CreditCardId = CreditCardId;
        this.CreditCardNo = CreditCardNo;
        this.creditCardType = creditCardType;
        this.CardHolderName = CardHolderName;
        this.CreditCardCvv = CreditCardCvv;
        this.ExpDate = ExpDate;
    }

    

    

    public int getCreditCardId() {
        return CreditCardId;
    }

    public void setCreditCardId(int CreditCardId) {
        this.CreditCardId = CreditCardId;
    }

    public int getCreditCardNo() {
        return CreditCardNo;
    }

    public void setCreditCardNo(int CreditCardNo) {
        this.CreditCardNo = CreditCardNo;
    }
    
    public String getCreditCardType() {
        return creditCardType;
    }

    public void setCreditCardType(String creditCardType) {
        this.creditCardType = creditCardType;
    }
    
    public String getCardHolderName() {
        return CardHolderName;
    }

    public void setCardHolderName(String CardHolderName) {
        this.CardHolderName = CardHolderName;
    }

    public int getCreditCardCvv() {
        return CreditCardCvv;
    }

    public void setCreditCardCvv(int CreditCardCvv) {
        this.CreditCardCvv = CreditCardCvv;
    }

    public String getExpDate() {
        return ExpDate;
    }

    public void setExpDate(String ExpDate) {
        this.ExpDate = ExpDate;
    }
    
}
