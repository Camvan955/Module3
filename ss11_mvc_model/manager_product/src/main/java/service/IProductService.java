package service;

import model.Product;

import java.util.List;

public interface IProductService {
    List<Product> findAll();

    void add(Product product);

    Product findById(int id);

    Product searchProduct(String name);

    void edit(int id, Product product);

    void remove(int id);

}
