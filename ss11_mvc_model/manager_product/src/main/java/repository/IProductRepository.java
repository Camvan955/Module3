package repository;

import model.Product;

import java.util.List;

public interface IProductRepository {
    List<Product> findAll();

    void add(Product product);

    void edit(int id, Product product);

    void remove(int id);

    Product searchProduct(String name);

    Product findById(int id);
}
