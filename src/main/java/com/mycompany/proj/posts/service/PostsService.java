package com.mycompany.proj.posts.service;

import java.util.List;

import com.mycompany.proj.posts.model.PostsVO;

public interface PostsService {
	public List<PostsVO> selectPostsList(PostsVO postsVO) throws Exception;

}
