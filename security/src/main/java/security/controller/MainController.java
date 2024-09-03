package security.controller;





import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;



import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.view.RedirectView;



import security.dao.ProductDao;
import security.model.Admin;
import security.model.Product;
import security.model.User;



@Controller
public class MainController {
	
	 
	    
	
	
	@Autowired
	private ProductDao productdao;
	@Autowired
	private Base64Example pass;
	
	
  /*//To show the data to Admin login	
  @RequestMapping("/admindata")
	public String home(Model model)
	{
		java.util.List<Product> allProductDao = productdao.getProducts();
		model.addAttribute("product", allProductDao);
		System.out.println(allProductDao);
		return "index";
	}
	*/
	
	
	
	//To get front page
	@RequestMapping("/")
	public String gg()
	{
		
		return "front";
	}
	
	
	// page to access user
	@RequestMapping("/user")
	public String userlogin(Model model) {
		model.addAttribute("title","user login");
		return "userlogin";
	}
	
	//page to get new users
    @RequestMapping("/createNewUser")
	public String hh(Model m)
	{
    	User user=new User();
    	m.addAttribute("user",user);
		return "login";
    }
	
	
    
	//saving user password details(Check)
	@PostMapping("/Home")
	public String check1( @ModelAttribute("User") User product ,Model m, HttpServletRequest request,HttpSession session,RedirectAttributes redirectAttributes) {
		  
		String g=(product.getEmail()).toLowerCase();
		product.setEmail(g);
		if(product.getAdmin()==0)
		{
			session.setAttribute("msg7","Select the status");
			m.addAttribute("user",product);
			return "login";
		}
		
		java.util.List<User> user = productdao.getUsers();
		java.util.List<Admin> admin = productdao.getAdmin();
		
		for (User item : user) { 
			
		if(item.getEmail().equals(product.getEmail()))	
		{
			session.setAttribute("msg3","Email already exit");
			User user1=new User();
	    	m.addAttribute("user",user1);
			
			return "login";
			
		}	
		}
		for(Admin item:admin) {
			
		if(item.getEmail().equals(product.getEmail()))	
		{
			session.setAttribute("msg4","Email already exit");
			User user2=new User();
	    	m.addAttribute("user",user2);
			return "login";
		
		}
		
		}
		
		 String encode = pass.encode(product.getPassword());
		 product.setPassword(encode);
		
		productdao.saveUser(product);
		
		session.setAttribute("msg", "Password created successfully");
		User user3=new User();
    	m.addAttribute("user",user3);
		return "login";
		
		}
	
	
     // page to get product data
	@RequestMapping("/addProduct")
	public String user()
	{
		return "user_product";	
	}

	//check the user authority
	@RequestMapping("/userlogin")
		public String users(@RequestParam("email") String email,@RequestParam("password") String password,Model m,HttpSession session) 
	     {   
		
		     email=email.toLowerCase();
			java.util.List<User> allProductDao = productdao.getUsers();
			for (User item : allProductDao)
			{
				if(password.equals(pass.decode(item.getPassword()))&& email.equals(item.email) && (item.admin)==1){
			
				java.util.List<Product> allProductDao1 = productdao.getProducts();
				m.addAttribute("product", allProductDao1);
				return "index1";
			}
		}
			session.setAttribute("msg","Login failure:Incorrect password or emailid");
			return "userlogin";
			}
		
		
	
    
	
	//To get the user enter product data(Check)
	
	@RequestMapping("/adduser")
	public String addProduct(Model model) {
		model.addAttribute("title","Add User Product");
		return "add_product_form";	
	}
	
	 //handle To save user enter product data(check)
		@PostMapping("/handle-product2")
		public RedirectView handleProduct2(@ModelAttribute Product product, HttpServletRequest request){
		    System.out.println(product);
			productdao.createProduct(product);
			RedirectView redirectView=new RedirectView();
			redirectView.setUrl(request.getContextPath()+"/addback");
			return redirectView;
		}
		
	
		

	
	//handle  for admin add and update product(Check)
	@PostMapping("/handle-product")
	public RedirectView handleProduct(@ModelAttribute Product product,Model m,HttpServletRequest request){
	    System.out.println(product);
		productdao.createProduct(product);
		
		java.util.List<Product> allProductDao = productdao.getProducts();
		m.addAttribute("product", allProductDao);
		
		RedirectView redirectView=new RedirectView();
		redirectView.setUrl(request.getContextPath()+"/addback");
		return redirectView;
	}
	
	
	
	//delete handler
	@RequestMapping("/delete/{productId}")
	public RedirectView deleteHandler(@PathVariable("productId") int productId,HttpServletRequest request) {
		this.productdao.deleteProductByIdDao(productId);
		RedirectView redirectView=new RedirectView();
		redirectView.setUrl(request.getContextPath()+"/addback");
		return redirectView;
	}
	
	
	//Update handler
	@RequestMapping("/update/{productId}")
	public String updateForm(@PathVariable("productId") int pid, Model model)
	{   
		Product product = this.productdao.getProduct(pid);
		model.addAttribute("product",product);
		return "update_form";
		
	}
	
	
	
  //checking Admin authority and Admin login(check)
	
  	@PostMapping("/admindata")
  	public String admindata(@RequestParam("email") String email,@RequestParam("password") String password,Model m,HttpSession session) {
  		
  		
  		email=email.toLowerCase();
  		java.util.List<Admin> allProductDao = productdao.getAdmin();
  		
  		
  		for (Admin item : allProductDao)
  		{  
  			System.out.println(item);
 		if(password.equals(pass.decode(item.getPassword()))&& email.equals(item.email)) {
  			
  			java.util.List<Product> allProductDao1 = productdao.getProducts();
  			m.addAttribute("product", allProductDao1);
  			return "firstpage";
  		}
  		}
  		session.setAttribute("msg", "Login failure:Incorrect password or emailid");
  		return "front";
  		}
	
	
  	 //To back the add page(check)
  	
    @RequestMapping("/addback")
  	public String addback(Model model)
  	{
  		java.util.List<Product> allProductDao = productdao.getProducts();
  		model.addAttribute("product", allProductDao);
  		System.out.println(allProductDao);
  		return "firstpage";
  	}
  	
    @RequestMapping("/staff")
	public String aa(Model m)
	{
        
    	java.util.List<User> staff = productdao.getUsers();
		m.addAttribute("staff", staff);
    	
    	
    	
		return "staff";
	}
	
    

	//Active handler
	@RequestMapping("/active/{userid}")
	public RedirectView activeHandler(@PathVariable("userid") int id,HttpServletRequest request) {
		
		User userdetails = this.productdao.getUser(id);
		
	       userdetails.setAdmin(1);
	       
	       productdao.saveUserchange(userdetails);
	       
		System.out.println(userdetails.getAdmin());
		RedirectView redirectView=new RedirectView();
		redirectView.setUrl(request.getContextPath()+"/staff");
		return redirectView;
	}
	          

	//Deactive handler
	@RequestMapping("/deactive/{userid}")
	public RedirectView deactiveHandler(@PathVariable("userid") int id,HttpServletRequest request) {
	
		 User userdetails =  this.productdao.getUser(id);
	
	       userdetails.setAdmin(2);
	       
	       productdao.saveUserchange(userdetails);  

	   	System.out.println(userdetails.getAdmin());
		RedirectView redirectView=new RedirectView();
		redirectView.setUrl(request.getContextPath()+"/staff");
		return redirectView;
	}
	
	
	
}
