package com.dhu.demo2.Controller.admin;

import com.dhu.demo2.dao.CommentMapper;
import com.dhu.demo2.pojo.Comment;
import com.dhu.demo2.pojo.CommentExample;
import com.dhu.demo2.pojo.User;
import com.dhu.demo2.pojo.UserExample;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class CommentControler {

    @Autowired
    CommentMapper commentMapper;

        @RequestMapping("/commentjson")
        @ResponseBody
        public Map<String,Object> commentjson(String minTime,String maxTime,Integer userId, Integer productId,String content){
            System.out.println("in");
            //时间格式转换String转Date
            SimpleDateFormat sdf =   new SimpleDateFormat( "yyyy-MM-dd HH:mm:ss" );
            Date date1 = null;
            Date date2 = null;
            if(minTime!=null&&maxTime!=null&&!minTime.equals("")&&!maxTime.equals("")) {
                try {
                    date1 = sdf.parse(minTime);
                    date2 = sdf.parse(maxTime);

                } catch (ParseException e) {
                    e.printStackTrace();
                }
            }
            //添加选择约束
            System.out.println(content);
            CommentExample commentExample = new CommentExample();
            CommentExample.Criteria criteria = commentExample.createCriteria();
            if(minTime!=null&&maxTime!=null&&!minTime.equals("")&&!maxTime.equals("")){
                criteria.andCommenttimeBetween(date1,date2);
            }
            if(userId!= null){
                criteria.andUseridEqualTo(userId);
            }
            if(productId!= null){
                criteria.andProductidEqualTo(productId);
            }
            if(content!= null){
                criteria.andContentLike("%" + content + "%");
            }
            List<Comment> commentList = commentMapper.selectByExample(commentExample);
            Map<String,Object> map = new HashMap<>();
            map.put("data",commentList);
            map.put("count",'6');
            map.put("msg","hello");
            map.put("code","0");

            return map;

        }
    @RequestMapping(value = "/deleteComment")
    @ResponseBody
    public String deleteComment(Comment comment){
        commentMapper.deleteByPrimaryKey(comment.getCommentid());
        System.out.println(comment.getUserid());

        return "succeed";
    }
//中间环节
    @RequestMapping("selectComment")
    public String selectProduct(Integer commentid, Model model){
            System.out.println(commentid);
        model.addAttribute("commentid",commentid);
        return "layer/editCommentLayer";
    }


    }

