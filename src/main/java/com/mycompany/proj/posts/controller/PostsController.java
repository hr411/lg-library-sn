package com.mycompany.proj.posts.controller;

import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.mycompany.proj.posts.model.PostsVO;
import com.mycompany.proj.posts.service.PostsService;

@Controller
public class PostsController {
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Resource(name="PostsService")
	private PostsService postsService;
	
	@RequestMapping(value = "/posts", method = RequestMethod.GET)
	public String posts(PostsVO postsVO,  Model model) {
		try {
			List<PostsVO> resultpostsVO = postsService.selectPostsList(postsVO);
			model.addAttribute("resultpostsVO", resultpostsVO);
						
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "posts/posts";
	}
}

