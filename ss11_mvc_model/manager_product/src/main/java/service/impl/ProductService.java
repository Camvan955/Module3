package service.impl;

import model.Product;
import repository.IProductRepository;
import repository.impl.ProductRepository;
import service.IProductService;

import java.util.List;

public class ProductService implements IProductService {

    private IProductRepository productRepository = new ProductRepository();

    @Override
    public List<Product> findAll() {
        return productRepository.findAll();
    }

    @Override
    public void add(Product product) {
        productRepository.add(product);
    }

    @Override
    public Product findById(int id) {
        return productRepository.findById(id);
    }

    @Override
    public Product searchProduct(String name) {
        return productRepository.searchProduct(name);
    }

//    @Override
//    public Product search(String name) {
//        return productRepository.search(name);
//    }

    @Override
    public void edit(int id, Product product) {
    }

    @Override
    public void remove(int id) {
        productRepository.remove(id);
    }

}
