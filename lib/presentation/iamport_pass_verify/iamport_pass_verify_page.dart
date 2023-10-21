import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iamport_flutter/Iamport_certification.dart';
import 'package:iamport_flutter/model/certification_data.dart';

import 'iamport_pass_verify_controller.dart';

class IamportPassVerifyPage extends GetView<IamportPassVerifyController> {
  const IamportPassVerifyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return IamportCertification(
      appBar: AppBar(
        title:  Text('아임포트 본인인증'),
      ),
      /* 웹뷰 로딩 컴포넌트 */
      initialChild: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/iamport-logo.png'),
              Container(
                padding: EdgeInsets.fromLTRB(0.0, 30.0, 0.0, 0.0),
                child: Text('잠시만 기다려주세요...', style: TextStyle(fontSize: 20.0)),
              ),
            ],
          ),
        ),
      ),
      /* [필수입력] 가맹점 식별코드 */
      userCode: 'imp37516850',
      /* [필수입력] 본인인증 데이터 */
      data: CertificationData(
        merchantUid: 'mid_${DateTime.now().millisecondsSinceEpoch}', // 주문번호
        company: '아임포트', // 회사명 또는 URL
        carrier: 'SKT', // 통신사
        name: '홍길동', // 이름
        phone: '01012341234', // 전화번호
        mRedirectUrl: 'http://google.com'
      ),
      /* [필수입력] 콜백 함수 */
      callback: controller.onCertificationComplete,
    );
  }
}
