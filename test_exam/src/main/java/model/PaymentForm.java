package model;

public class PaymentForm {
    private int idPay;
    private String name;

    public PaymentForm() {
    }

    public PaymentForm(int idPay, String name) {
        this.idPay = idPay;
        this.name = name;
    }

    public int getIdPay() {
        return idPay;
    }

    public void setIdPay(int idPay) {
        this.idPay = idPay;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
