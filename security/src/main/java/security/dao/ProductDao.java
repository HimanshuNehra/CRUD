package security.dao;


import javax.transaction.Transactional;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Component;

import security.model.Admin;
import security.model.Product;
import security.model.User;


@Component
public class ProductDao {
	
	
	@Autowired
	private HibernateTemplate hibernateTemplate;
	
	//save
	@Transactional
	public void  createProduct(Product product) {
		
		
	this.hibernateTemplate.saveOrUpdate(product);		
	}
	
	public java.util.List<Product> getProducts(){
		java.util.List<Product> product=this.hibernateTemplate.loadAll(Product.class);
		return product;
		
	}
	
	
	
	
	
	//get password
	public java.util.List<User> getUsers() {
		java.util.List<User> product = this.hibernateTemplate.loadAll(User.class);
		return product;
	}
	
	//save userdetails
	@Transactional
	public void saveUser(User p) {
		this.hibernateTemplate.save(p);
	}
	
	@Transactional
    public User saveUserchange(User user) {
		return this.hibernateTemplate.merge(user);
	}
	
	
	//get single Userdetails
	public User getUser(int id)
	{
		return this.hibernateTemplate.get(User.class,id);
	}
	
	
	//get single product
	public Product getProduct(int pid) {
		return this.hibernateTemplate.get(Product.class, pid);
		
	}
	//delete the single product
    @Transactional
    public void deleteProductByIdDao(int pid) {
        Product product = hibernateTemplate.load(Product.class, pid);
       
            this.hibernateTemplate.delete(product);
        }
        
    
    

	//get single admindetails
    public java.util.List<Admin> getAdmin() {
		java.util.List<Admin> product = this.hibernateTemplate.loadAll(Admin.class);
		return product;
	}
    
	@Transactional
	public void saveadmin(Admin p) {
		this.hibernateTemplate.save(p);
	}

    }

        
