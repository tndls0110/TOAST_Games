package com.toast.approval.service;

import com.toast.approval.dto.ApprovalDTO;
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

	public void save_initial_doc(int formIdx, String formContent, String loginId) {

	}

	public int doc_write(int formIdx, String formContent, String loginId) {
		int doc_idx = 0;
		//방금 저장한 idx 가져오기
		//BoardDTO에 값 저장하기
		ApprovalDTO app_dto = new ApprovalDTO();



		approvalDAO.doc_write(formIdx,formContent,loginId);
		return doc_idx;
	}
}
