package com.toast.approval.dao;

import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

@Mapper
public interface ApprovalDAO {

    List<Map<String, Object>> form_list();

    Map<String, Object> form(String subject);


}
