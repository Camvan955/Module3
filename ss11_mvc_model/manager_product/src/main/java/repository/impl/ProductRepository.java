package repository.impl;

import model.Product;
import repository.IProductRepository;

import java.util.ArrayList;
import java.util.List;

public class ProductRepository implements IProductRepository {
    private static List<Product> productList = new ArrayList<>();

    static {
        productList.add(new Product(1, "Ip XS Max", "USA", 10000000));
        productList.add(new Product(2, "Ip 11 Pro Max", "Japan", 12000000));
        productList.add(new Product(3, "Ip 14 Pro Max", "Korea", 34500000));
    }

    @Override
    public List<Product> findAll() {
        return productList;
    }

    @Override
    public void add(Product product) {
        productList.add(product);
    }

    @Override
    public Product searchProduct(String name) {
        Product product = null;
        for (int i = 0; i < productList.size(); i++) {
            if (name == productList.get(i).getName()) {
                product = productList.get(i);
                break;
            }
        }
        return product;
    }

    @Override
    public Product findById(int id) {
        Product product = null;
        for (int i = 0; i < productList.size(); i++) {
            if (id == productList.get(i).getId()) {
                product = productList.get(i);
            }
        }
        return product;
    }

    @Override
    public void edit(int id, Product product) {
        for (int i = 0; i < productList.size(); i++) {
            if(id == productList.get(i).getId()){
                product=productList.set(i, product);
            }
        }
    }

    @Override
    public void remove(int id) {
        for (int i = 0; i < productList.size(); i++) {
            if (id == productList.get(i).getId()) {
                productList.remove(i);
            }
        }
    }
}
