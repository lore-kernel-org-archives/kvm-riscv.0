Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 104B7606A31D
	for <kvm-riscv@archiver.kernel.org>; Fri, 23 Oct 2026 15:31:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=pFipZVTG;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BsRLMs5e;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SMgEeIyV
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:Subject:Cc:
	To:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=3GoCeloJuXmHBPHQlTR38unELUo5SY7R9B6Ky67yy88=; b=pFipZVTG5MutKmZEYqZosq7jOE
	ctJXnbCqBC5QxtpTtYoDQ4eEpeGnfaNdMt98c+BBk0wFLuwftzba1mav+N7Wf50X+qOKKCdm44B/h
	tM7t3Vd5vObwd0shjXJ/wvO1q7SzxABDn2XAX4DGg4vCZd5jOSVqpD7F74FVPm6uLAi8/t2wRZtA4
	X8LhUqAl0EuVOk1R3BizuJw4T8Y/t5qLDGIYH1WiYqeRLbEfLnKSa3w04sua5uriHkBpICtDgn5ZZ
	eNLfsdjqlU2A101O1iFf1E4AN8Fpo2faimbzhGiAHQ3q4g4jmkSVCBTWG5Ekeau2iYM8EHb4aA4bQ
	2wISXg7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKHF6-0000000Gbgn-1KZP;
	Fri, 23 Oct 2026 15:31:40 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKHF2-0000000Gbg1-2jl9
	for kvm-riscv@lists.infradead.org;
	Fri, 23 Oct 2026 15:31:39 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NE6JgE3557712
	for <kvm-riscv@lists.infradead.org>; Fri, 23 Oct 2026 15:31:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZNaGi96jpsEJgcBdqwPHynn/y7akqS1ZiA7apOF+4CQ=; b=BsRLMs5ejriH/lIL
	YB0wgFGzAoAsuPOErC2LXvwXzaNy2zgUGBCqEztreE1rQoR8uG2Vda4z6BphVbJP
	s9A8tMgbYc4ssyexAEE80YfipkYOrkmXHRl+zWq95Z2Uy6tgyMvJkeRt0Mr8IZUC
	uDLfTYwXmqKb5dcStOt3upPfcEoBrdWhhxCBNBCdoVOMLhRX4pA0OvNUBCkTDvTl
	TsN3Aj/0yrdsuLtisWNATXENvMRPVp3T382aezpYGYTX+5oHEl9I+C2zU3tE3KvG
	TY/M5ZGaNcYoRfDSDpEdvBl3PyId13ra4ZXhZNDWurndI0Kvp3kJk9b0izTG1OPW
	FBzUFw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfqmjcbhq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <kvm-riscv@lists.infradead.org>; Fri, 23 Oct 2026 15:31:34 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2e61a48d5b7so13977075ad.1
        for <kvm-riscv@lists.infradead.org>; Fri, 23 Oct 2026 08:31:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792769494; x=1793374294; darn=lists.infradead.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ZNaGi96jpsEJgcBdqwPHynn/y7akqS1ZiA7apOF+4CQ=;
        b=SMgEeIyV/HDAmAuC1VCAssy7lIJqUTbL+p5e8AkNThzrRLCDsNVCbcqsWL7xCzpo+H
         2QgZUVJ7mjex2TDNijYliadu4OegmTC+mcxi55MfKy7OPYIZOOp7cfls1zVj2nZYBbmn
         2SJGsW377qyhDzyX8PYqiSgBiyY8XMFCRiqHtRpgSxicpPo08IRZKkLQV4VxpcQi+yio
         M7jSR4EsCP4jc2qfntzBRtTYuBYXizR0VdQNEV4ZXDQkVsUsGKCgAaEjNieTapTWEarA
         mpf5aYynlrdSpYGyNY6YYG4ko0wNpuOm2cRv376sohGeDxWC+KGoIlbeRvphpfruQWvY
         AYvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792769494; x=1793374294;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZNaGi96jpsEJgcBdqwPHynn/y7akqS1ZiA7apOF+4CQ=;
        b=kOsBauGBafAUoSNziIw7TX1CxAlxUDt2bHm71IW7jEy0X7jHa6Ab/Od5SGlfw6872o
         CH8qK/07NCAIka85LiT17YAfpLzoRtjUEFcyomOF0m+sxmW7ZfrFU58g6s3xGljYaL6I
         Sc84YfHU8OEKiJCkuy0GQBkYWwumKRV6wtJvyFGZZFyBLiUiHZ+kdQ/H6I6vNrN6l6CE
         i6UAAo1zQD5uQoYO3swVD0C1RQS9VZNsUFm0xDB2rep6Ax4aF929jOc7L3xj6p+lvGYM
         v2mMVElmge9tb2PhnOsaPjL45M/b09skAWQMfLPgLRYS5NlbE4bKZ2M1lXdNmcyaHe8M
         QfKQ==
X-Forwarded-Encrypted: i=1; AKwUvBz4x8DQT2e0zI4IbNIQ2QbLkyqiT0YbCNGJUTntqdeeXNhpfmVUCtRc3iXT5YTPFXvp4PmS/lFEnkE=@lists.infradead.org
X-Gm-Message-State: AFq9FYIZeTCit0jkyb/BPjJwDK5IQk5elHqNYZu0/9BPcXYPc5gEIIJU
	5+yf0UtIcIT/ZxNh+4/eoEkW6Ms+vKgR0bIYnGWyG7McoY78wdXg/PgDgd4gHuyD+Z3sYCggfJ7
	/IGETpClXLUc7LMrBdqxpBJgCBRaOT2rBm28e8Z/3QxSnioHKp+7x2P62tJF96rAkfAZx
X-Gm-Gg: AYBFou13b28dQ0QTcgBMeO5I0WnSXW6oOanV7Iy+jBc+Gc/YmVyuYAR+MItQeyRock1
	gFusXWmzhN2veCn3AKE1GenXIBySl2WH7Ok9Bie3PfEgmByBUyDcsMVQVPr/c2McR2KfQi3dr8d
	hOHIMJuevF/jedHGELuMH7R7fgVlShoQjS1oaWs4SSlKMjd5xWf8Ypu9jYDjCg83jctLhFbS4gC
	6syIOa7D/I13JUNcYjGPRA8LZI0fMGY67r5d+rmaUkC0NnehSsrINMY56FYUpBuD5rpkBGq0/FN
	71L5eEFr2ITLwx/QGhWAHglJkau6ItyPWqaI21Hc01dd0Uenq1wnHpmzBJbGXMOYYY16kH26+on
	PsgkWO31z8Z4x0gCrvYfECxf3zDckVfdM
X-Received: by 2002:a17:902:e848:b0:2e9:743a:7a9d with SMTP id d9443c01a7336-2ea7c28b349mr20823015ad.13.1792769493487;
        Fri, 23 Oct 2026 08:31:33 -0700 (PDT)
X-Received: by 2002:a17:902:e848:b0:2e9:743a:7a9d with SMTP id d9443c01a7336-2ea7c28b349mr20822755ad.13.1792769492870;
        Fri, 23 Oct 2026 08:31:32 -0700 (PDT)
Received: from localhost ([155.117.96.35])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea947ac357sm1667205ad.76.2026.10.23.08.31.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Oct 2026 08:31:32 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
Date: Fri, 23 Oct 2026 23:31:26 +0800
Message-Id: <DMCBQSJ0B22A.2TDXAXPJNPZL2@oss.qualcomm.com>
To: "slack up" <yxcnew@outlook.com>, "Anup Patel" <anup@brainfault.org>,
        "Atish Patra" <atish.patra@linux.dev>,
        "Paul Walmsley" <pjw@kernel.org>,
        "Palmer Dabbelt" <palmer@dabbelt.com>,
        "Albert Ou" <aou@eecs.berkeley.edu>, "Alexandre Ghiti" <alex@ghiti.fr>,
        "Andy Chiu" <tchiu@tenstorrent.com>,
        "Yong-Xuan Wang" <yongxuan.wang@sifive.com>
Cc: <kvm@vger.kernel.org>, <kvm-riscv@lists.infradead.org>,
        <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <stable@vger.kernel.org>,
        "linux-riscv"
 <linux-riscv-bounces@lists.infradead.org>
Subject: Re: [PATCH] RISC-V: KVM: Fix builds without CONFIG_RISCV_ISA_V
From: "Ze Huang" <ze.huang@oss.qualcomm.com>
X-Mailer: aerc 0.22.0.r35.g0a434803
References: <OSQPR01MB6326DDE9C2F390EA3F0F444EC2662@OSQPR01MB6326.apcprd01.prod.exchangelabs.com>
In-Reply-To: <OSQPR01MB6326DDE9C2F390EA3F0F444EC2662@OSQPR01MB6326.apcprd01.prod.exchangelabs.com>
X-Proofpoint-GUID: GGHhfbyZzFFFSHiq14AlV93FYFC18iwG
X-Authority-Analysis: v=2.4 cv=cPR1IVeN c=1 sm=1 tr=0 ts=6adb7dd6 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=Ilsi1XWDFcrB9FjxRIUvHg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=UqCG9HQmAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=B-Qh9SJ9cMKcPyFv0BMA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA2MCBTYWx0ZWRfX/cGbuDAAw7+D
 9CCTmJHBlkHGmEIViR6ZswGHM26FoGpfAP5MZMdEBKZIAxzjC1bp4jwUO0lSLL0BN5XCWIqZGdJ
 yzGWoZb/0l1BlssZBIoie+RSg/6GvMo=
X-Proofpoint-ORIG-GUID: GGHhfbyZzFFFSHiq14AlV93FYFC18iwG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA2MCBTYWx0ZWRfX9Kfih0hw0q1b
 AnQ9E6uX6BC7QxAstVGGCC9uSR+Kk9vPhQ1K4oR+rXGpR5uyyexhZ/eOPy2o5j+ZKRXfuDXaKYi
 wrLj7VXrC+v3xt7OaEIUjadjjfflBOci61iF28cjB08N3K3OUO+4uWWbTXph5RImTwBfqVjL9HE
 2PKfSchEivTmeMhzovvif+FilL8971TOBeHazoa0+Mf1i8hmSWitNNRzMduVnBoFwgctt9dM3YH
 s9dZViEMGTDUXtnyhw80r3e9KrfzyN4WOWP2WPNZlwvWLmlBJpUt4x5d0tvLOD3uvlAoo8cmD4s
 +vjCc5KeU2kF6lQDzZD+vWDYicYMzT6iqwKhDaLIJYPOHVryk4POiJU3N8gBK3UBx/LyIEOsXn7
 4Tsn7VT4wyKHb4SP66hlIjiLDH1Q6Dmyy4TamtSwhYtnX5pcJYtxUM1/56WxZlLVgpRDVviQYj0
 l7l0mm4dExIZizfUw8w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 suspectscore=0
 impostorscore=0 priorityscore=1501 malwarescore=0 clxscore=1011 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230060
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261023_083136_843619_36EFCED1 
X-CRM114-Status: GOOD (  21.24  )
X-Spam-Score: -2.8 (--)
X-BeenThere: kvm-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <kvm-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/kvm-riscv/>
List-Post: <mailto:kvm-riscv@lists.infradead.org>
List-Help: <mailto:kvm-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/kvm-riscv>,
 <mailto:kvm-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu Oct 22, 2026 at 1:31 AM CST, slack up wrote:
> From: Xiaochun Yu <yxcnew@outlook.com>
>
> Commit b5060a4aa33d ("RISC-V: KVM: fix vcpu vector context
> handling for kernel-mode vector") made the KVM vCPU load and put paths
> call get_cpu_vector_context() and put_cpu_vector_context()
> unconditionally.  It also added an unconditional call to
> __kvm_riscv_vector_restore() on the guest entry path.
>
> The no-op definitions of the first two helpers live in <asm/vector.h>,
> but <asm/kvm_vcpu_vector.h> includes that header only when
> CONFIG_RISCV_ISA_V is enabled.  The KVM header also does not provide a
> no-op __kvm_riscv_vector_restore() in its disabled branch.  As a result,
> a KVM build without CONFIG_RISCV_ISA_V fails with missing helper
> declarations.
>
> Include <asm/vector.h> unconditionally to reuse its existing no-op
> helpers, and provide the missing KVM restore stub when Vector support is
> disabled.  This does not change the Vector-enabled path.
>
> Fixes: b5060a4aa33d ("RISC-V: KVM: fix vcpu vector context handling for kernel-mode vector")
> Cc: stable@vger.kernel.org
> Signed-off-by: Xiaochun Yu <yxcnew@outlook.com>
> ---
> This single patch fixes a build regression when KVM is enabled without the
> RISC-V Vector extension.
>
> Tested on base a804c5742bff (Torvalds master):
>
> - CONFIG_RISCV_ISA_V=n, CONFIG_KVM=m: full Image modules build passed.
> - CONFIG_RISCV_ISA_V=y, CONFIG_KVM=m: vcpu.o and vcpu_vector.o rebuilt.

Tested-by: Ze Huang <ze.huang@oss.qualcomm.com>

Tested on commit a804c5742bff with gcc 16.2.1 and clang 23.1.3:

CONFIG_RISCV_ISA_V=n, CONFIG_KVM=m: full Image + modules build passes
(before the patch: 3 implicit-declaration errors with gcc, 5 with clang)

> ---
>  arch/riscv/include/asm/kvm_vcpu_vector.h | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/arch/riscv/include/asm/kvm_vcpu_vector.h b/arch/riscv/include/asm/kvm_vcpu_vector.h
> index 6371d5ea5392..ebc619ed67dd 100644
> --- a/arch/riscv/include/asm/kvm_vcpu_vector.h
> +++ b/arch/riscv/include/asm/kvm_vcpu_vector.h
> @@ -11,9 +11,9 @@
>  #define __KVM_VCPU_RISCV_VECTOR_H
>  
>  #include <linux/types.h>
> +#include <asm/vector.h>
>  
>  #ifdef CONFIG_RISCV_ISA_V
> -#include <asm/vector.h>
>  #include <asm/kvm_host.h>
>  
>  static __always_inline void __kvm_riscv_vector_save(struct kvm_cpu_context *context)
> @@ -55,6 +55,10 @@ static inline void kvm_riscv_v_exit(void)
>  
>  struct kvm_cpu_context;
>  
> +static inline void __kvm_riscv_vector_restore(struct kvm_cpu_context *context)
> +{
> +}
> +
>  static inline void kvm_riscv_vcpu_vector_reset(struct kvm_vcpu *vcpu)
>  {
>  }
>
> ---
> base-commit: a804c5742bff224d4cb4d25dd383554d598be32b
> change-id: 20261021-ospp-c1-b4-submit-e22dc09faf5a
>
> Best regards,



-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
