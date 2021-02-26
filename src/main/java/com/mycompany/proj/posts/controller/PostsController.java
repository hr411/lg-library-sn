package com.mycompany.proj.posts.controller;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mycompany.proj.login.model.LoginVO;
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
	
	@RequestMapping(value = "/posts/{post_no}", method = RequestMethod.GET)
	public String postInfo(@PathVariable("post_no") String post_no, Model model) {
		try {
			PostsVO postsVO = new PostsVO();
			postsVO.setPost_no(post_no);
			PostsVO resultpostVO = postsService.selectPostInfo(postsVO);
			model.addAttribute("resultpostVO", resultpostVO);
						
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "posts/postInfo";
	}
	
	@RequestMapping(value = "/postCreate", method = RequestMethod.GET)
	public String postCreate(PostsVO postsVO,  Model model) {
		return "posts/postCreate";
	}
	
	@RequestMapping(value = "/postCreateProcess", method = RequestMethod.POST)
	public @ResponseBody HashMap<String, Object> postSave(HttpServletRequest req, PostsVO postsVO,  Model model) {
		HashMap<String, Object> map = new HashMap<String,Object>();
		try {
			postsService.createPostInfo(postsVO);
			map.put("success", true);
		} 
		catch (Exception e) {
			e.printStackTrace();
		}
		return map;
	}
	
	@RequestMapping(value = "/postDeleteProcess/{post_no}", method = RequestMethod.DELETE)
	public @ResponseBody HashMap<String, Object> postDelete(@PathVariable("post_no") String post_no, Model model)  {
		logger.info("dlafjdlkfjaldfj" + post_no);
		HashMap<String, Object> map = new HashMap<String,Object>();
		try
		{
			PostsVO postsVO = new PostsVO();
			postsVO.setPost_no(post_no);
			postsService.deletePostInfo(postsVO);
			map.put("success", true);
		} 
		catch (Exception e) {
			e.printStackTrace();
		}
		return map;
	}

}

