package com.nhou.config;

import javax.annotation.PostConstruct;

import javax.servlet.ServletContext;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;

import software.amazon.awssdk.auth.credentials.AwsBasicCredentials;
import software.amazon.awssdk.auth.credentials.AwsCredentials;
import software.amazon.awssdk.auth.credentials.AwsCredentialsProvider;
import software.amazon.awssdk.auth.credentials.StaticCredentialsProvider;
import software.amazon.awssdk.regions.Region;
import software.amazon.awssdk.services.s3.S3Client;



@Configuration
@MapperScan("com.nhou.mapper")
@EnableGlobalMethodSecurity(prePostEnabled = true) // 컨트롤러에서 메소드들에게 @preAuthorize() 사용하기위해 
public class CustomConfig {
	
	// WEB-INF/props/aws.properties 파일 속의  id, key(비번) 매칭하기
	@Value("${aws.accessKeyId}") //import org.springframework.beans.factory.annotation.Value;
	private String accessKeyId;
	
	@Value("${aws.secretAccessKey}") //import org.springframework.beans.factory.annotation.Value;
	private String secretAccessKey;
	
	
	@Value("${aws.s3.file.url.prefix}")
	private String imgUrl;
	
	@Autowired
	private ServletContext servletContext;
	
	@PostConstruct
	public void init() {
		servletContext.setAttribute("imgUrl", imgUrl);
	}
	
	@Bean
	public AwsCredentials awsCredentials() {
		return AwsBasicCredentials.create(accessKeyId, secretAccessKey);
	}
	
	@Bean
	public AwsCredentialsProvider awsCredentialsProvider() {
		return StaticCredentialsProvider.create(  awsCredentials()  );
	}
	
	@Bean
	public S3Client s3Client() {
		//spring 에서 aws s3 객체로 put/ delete 메소드를 사용하기 위해
		return  S3Client.builder()
				.credentialsProvider(  awsCredentialsProvider()  ) //자격증명 메소드	
				.region(Region.AP_NORTHEAST_2).build();		
	}
	
	// 로그인 성공 실패 
	@Bean
	public SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {
		http.csrf().disable(); // CSRF 공격에 대한 방어를 해제(xxx)
		http.authorizeHttpRequests() //URI에 따른 페이지에 대한 권한을 부여하기 위해 시작하는 메소드,antMatchers 기능을 이용하기 위한 메소드
			.antMatchers("/css/**", "/js/**", "/images/**") //특정 URL 접근 시 인가가 필요한 URI를 설정
			.permitAll();//특정 URI을 제외한 나머지 URI은 전부 인가
		http.formLogin() //아이디와 비밀번호를 입력해서 들어오는 로그인 형태를 지원
			.loginPage("/member/login").defaultSuccessUrl("/member/join", true);// 로그인 성공하면  메인으로. 
		http.logout().logoutUrl("/member/logout").logoutSuccessUrl("/main/list");
		http.rememberMe(); // 브라우저를 닫아도 쿠키를 저장 시킴 
		
		return http.build();
	}
	
	@Bean
	public PasswordEncoder passwordEncoder() {
		//security 암호화된 패스워드를 비교
		return new BCryptPasswordEncoder();
	}
	
}

