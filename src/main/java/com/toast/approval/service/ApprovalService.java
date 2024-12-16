package com.toast.approval.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.toast.approval.dao.ApprovalDAO;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class ApprovalService {
	Logger logger = LoggerFactory.getLogger(getClass());
	
	private final ApprovalDAO approvalDAO;

	public ApprovalService(ApprovalDAO approvalDAO) {
		this.approvalDAO = approvalDAO;
	}

	public List<Map<String,Object>> form_list() {
		return approvalDAO.form_list();
	}

	public Map<String, Object> form(String subject) {

		return approvalDAO.form(subject);
	}
}
