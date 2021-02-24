package com.mycompany.proj.posts.dao;

import java.util.List;

import com.mycompany.proj.posts.model.PostsVO;

public interface PostsDao {
	public List<PostsVO> selectPostsList(PostsVO postsVO) throws Exception;
	
}
