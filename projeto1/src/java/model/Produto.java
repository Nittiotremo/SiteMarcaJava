package model;

public class Produto{
    private int codigoproduto;
    private String nomeproduto;
    private Marca marca;

    public Produto() {
    }

    public Produto(int codigoproduto, String nomeproduto, Marca marca) {
        this.codigoproduto = codigoproduto;
        this.nomeproduto = nomeproduto;
        this.marca = marca;
    }

    public int getCodigoproduto() {
        return codigoproduto;
    }

    public void setCodigoproduto(int codigoproduto) {
        this.codigoproduto = codigoproduto;
    }

    public String getNomeproduto() {
        return nomeproduto;
    }

    public void setNomeproduto(String nomeproduto) {
        this.nomeproduto = nomeproduto;
    }

    public Marca getMarca() {
        return marca;
    }

    public void setMarca(Marca marca) {
        this.marca = marca;
    }

   
}

