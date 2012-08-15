package me.donnior.showcase.controller;

import java.util.ArrayList;
import java.util.List;

import me.donnior.showcase.entity.User;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import me.donnior.rtl.paginate.PaginateSupportArray;

@Controller
public class UsersController{
	
	private static int DEFAUTL_PAGE_SIZE = 10;

	@RequestMapping(value="/users")
    public ModelAndView index(@RequestParam(value="page",required=false, defaultValue="1") int page){
	   ModelAndView mav = new ModelAndView("user/index");
	   List<User> users = new ArrayList<User>();
	   for(int i=0; i<DEFAUTL_PAGE_SIZE; i++){
		   int id = page*DEFAUTL_PAGE_SIZE +i;
		   users.add(new User(id, "use login"+id, "user"+id+"@example.com"));
	   }
	   PaginateSupportArray<User> result = new PaginateSupportArray<User>(users, page, DEFAUTL_PAGE_SIZE, 9500);
	   mav.addObject("users", result);
	   return mav;
    }
	
	
	@RequestMapping(value="/user/{id}")
    public ModelAndView show(@PathVariable int id){
	   ModelAndView mav = new ModelAndView("user/show");
	   User user = new User(id, "use login"+id, "user"+id+"@example.com");
	   mav.addObject("user", user);
	   return mav;
    }
	
}
