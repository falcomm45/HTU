package kr.or.ddit.util;

import javax.annotation.PostConstruct;

import org.springframework.stereotype.Component;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import net.nurigo.sdk.NurigoApp;
import net.nurigo.sdk.message.model.Message;
import net.nurigo.sdk.message.request.SingleMessageSendingRequest;
import net.nurigo.sdk.message.response.SingleMessageSentResponse;
import net.nurigo.sdk.message.service.DefaultMessageService;

@Component
@RequiredArgsConstructor
@Slf4j
public class SmsUtil {
	
	private final String apiKey;
	private final String apiSecretKey;
	
	private DefaultMessageService defaultMessageService;
	
	@PostConstruct
	private void init() {
		this.defaultMessageService = NurigoApp.INSTANCE.initialize(apiKey, apiSecretKey, "https://api.coolsms.co.kr");
	}
	
	public SingleMessageSentResponse sendOne(String to, String verificationCode) {
		Message message = new Message();
		
		message.setFrom("01043320598");
		message.setTo(to);
		message.setText("[HTU] 아래 인증번호를 입력해주세요.\n["+verificationCode+"]");
		message.setSubject("비밀번호찾기 인증번호");
		
		log.info("message ==> {}", message);
		
		
		return this.defaultMessageService.sendOne(new SingleMessageSendingRequest(message));
	}
}
