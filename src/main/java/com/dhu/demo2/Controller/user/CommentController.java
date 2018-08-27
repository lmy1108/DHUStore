package com.dhu.demo2.Controller.user;

import com.dhu.demo2.dao.CommentMapper;
import com.dhu.demo2.pojo.Comment;
import com.dhu.demo2.pojo.Msg;
import com.dhu.demo2.pojo.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Date;
@Controller
public class CommentController {
    @Autowired
    private CommentMapper commentMapper;

    @RequestMapping("/addComment")
    @ResponseBody
    public Msg comment(Comment comment, HttpServletRequest request){
        System.out.println("in comment");
        HttpSession session=request.getSession();
        User user=(User) session.getAttribute("user");
        if (user == null) {
            return Msg.fail("评论失败");
        }
        comment.setUserid(user.getUserid());
        Date date=new Date();
        comment.setCommenttime(date);
        commentMapper.insertSelective(comment);
        return Msg.success("评论成功");
    }
}
