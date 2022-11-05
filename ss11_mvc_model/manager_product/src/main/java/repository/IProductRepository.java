package repository;

import model.Product;

import java.util.List;

public interface IProductRepository {
    List<Product> findAll();

    void add(Product product);

    void edit(int id, Product product);

    public void remove(int id);

    Product search(String name);

    Product findById(int id);
}
