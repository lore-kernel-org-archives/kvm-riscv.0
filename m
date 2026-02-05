Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD6BBECD980
	for <kvm-riscv@archiver.kernel.org>; Thu,  5 Feb 2026 15:58:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u33lbMCxGhci4vzWYi9EhtvCVRrikuS4KlGfdtOxX+E=; b=0NCtD7gvKjPt7t
	GGWkfWS6Z2zeJS7c2MXkXckCXMaLH2C3Ypc4WaeCMuD9QdmwwSlTT7eJHc24MQh0ppn9xx8wS8QUr
	7MWJ9VYi8bMnkOLlyBLG6M1S9zeIjb0+8x0aspq0dxMn+2aoMZYumtDOKUBYh8x4rOPIHmUz7bvuI
	eueZScJOHm43b3HDUW+Z9wpliOs+YEi6FWUeqoRBbY+5dl1ODdYJWr8iVAD8OullrZaN9UtL1Xz9g
	IG/D8DaIkyoKYoUjTWfubeyLfep0RgkOSqlGrFYcsSaSIA8CMa+jzER9Vis+/RxQa1DB+RGWBE/1r
	QE1irgkOFJ/ww7yQ1Maw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vo1kN-0000000ABmk-0sAw;
	Thu, 05 Feb 2026 15:58:23 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vo1kK-0000000ABla-0hKt
	for kvm-riscv@lists.infradead.org;
	Thu, 05 Feb 2026 15:58:21 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 615Bjq604125796
	for <kvm-riscv@lists.infradead.org>; Thu, 5 Feb 2026 15:58:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=reJd7/At3u/sqytH15vAL/oA
	6cLufQfOxqNK9KuV5k4=; b=HSuWCLqgch53TzV1zbT0mlcPKlCQp7Qr4bLHE7+Y
	cNWEZhnnKeTTIXTtOG0K1tnYZB5zwCPZJdFy3wxXmTNOIqBapUAI+E1kSNggsZ+S
	M+qgKYok/LypjwqRxRmeb7a4JlLbO6X+LVc0ZWi8ZSKqzFa4GbD4ldowA4QnKEwM
	5R2Im+xhHxd2nBx2ti+HNGv7gBq3G0AAL7SnqCkirBRopRZL2MQOrsp/NTI73sfc
	L0Cgus6rjordj1lLzWhVBoiL7nLMcmdFxplw+SrMIYSiEp6cEny74WFuGYhaP9jB
	Wz7EIEBLiG6A/J8hBEyBBesMvViHFFXW+ljtr9i9sQkNRw==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c4tm8rs8k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <kvm-riscv@lists.infradead.org>; Thu, 05 Feb 2026 15:58:19 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-2b724ff60e6so982055eec.0
        for <kvm-riscv@lists.infradead.org>; Thu, 05 Feb 2026 07:58:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770307099; x=1770911899; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=reJd7/At3u/sqytH15vAL/oA6cLufQfOxqNK9KuV5k4=;
        b=gyPtynRvG39rwnT6/NScPElwA43jUru0xkWA2GcweCfc+EIr+F48BQckqD87bMA4PM
         cazQ2nL52HxQ+R7+ThixNfxoOzg4bKc+qgjBA1uhEmLMbAFwETYphkIviB97tEQRQE0D
         TwnmlxPGEnDeLTuA/9WrnW6VR0fd8VlpyF4pLa4saRvQaVSffy79dXWSgZEZlbg/5aGJ
         6E+mDLE0Od+6vqm7PjdGBRL7El6PKgY0EtpZ2vE89rjPqUVnznDDXeykR0RlqTKNt+5C
         UdCu/Qfs+B4DcWkG5Q5Oy3ZLAJpXjxC+40bjlWCXAiUkBpKyd0yTGJsw0fpwLAiScDZK
         dD6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770307099; x=1770911899;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=reJd7/At3u/sqytH15vAL/oA6cLufQfOxqNK9KuV5k4=;
        b=h91hVdpfphMC0jzP6N3pUdsrRJ2tXFa5QQuQLJIUjfCmG7AEbD/urKO2al3xFjrnZK
         tbNBVAYKp/Ewe7K9iav9Ax8sG0Bo5iu1yJuB8q7DSKaCdV9lp0r1hvaRfhJSOmholXC5
         iBfnBTQtROAYanTzJXIIv9yerTYqRngqOGyRCWI6jfETRK/fm2eeTlxqWmyAKzy4DE1r
         LB4vygyvqJoAY2XenE8fFlZ0N91PcroFJHes0g/5ZZ7UuBN8B35bZiCuOeL49zO21KVN
         ErHSFWLv3JACr+ZkemqjlJb0MqBBeARLjVBhTJz57AO75WoDpJB8U47A4DmQgCcODxBS
         iPVA==
X-Forwarded-Encrypted: i=1; AJvYcCWErFL6/3W2sNtfJ4J6PI2NXvpDOAPw0p8rFvXiMNu79Cmk7wVa/7ZzfcSUOa1GqlyTS6F5JPmZakQ=@lists.infradead.org
X-Gm-Message-State: AOJu0YyFnz7p6EQ0veKKNKKuqZ7sCBEyZWDR4mYuuERFkqCWUd/yc1Ps
	QlhQN/13SA4pjXIJSARa9u31favEatygWfkIUMTO0o3DH017ITCuouODJmpatRzdf0254dCj06t
	MadK2O1LooZBYUds8PutXtfqdqzx83ptzncXJGk1JT+l6RipoGMPFkcPeMA0uaGJYGXuf
X-Gm-Gg: AZuq6aKPeTBHAkZA1oyEzfABGPyy1A0v8nEi4uxcrFkHzm+GMVqPiV2k4cNsjGSgtvQ
	iK8abMUYU0gX245M9xI4pVuTREthruLaBsSmEcqrHN8XhdIW3QvIxncOF3dNrsdyuYsHJAnaB4v
	0HkRR2a4NQriI24uXDaBfg2VP1KHljIMYUI0DhfhgIpRWMPiW7dtjGKLbd/+q0HkSIAiDA3kDxl
	V53YINBfI3wPHRlkp0We8Rq05LDi2z6kXHkdtKM++NiiZd5kc54oMHkEuaSfjgU2JkszKdMT46W
	dLaUQFwCVBBx/51JBOeJQM24AvUGRiKfNwavB5WgG11uTvJW/zsyUhXvePskOYtBw9gkUF2XpgP
	GjNQeyLrJhOG9bfo2fYA=
X-Received: by 2002:a05:7300:cd8d:b0:2b6:fa0c:6c44 with SMTP id 5a478bee46e88-2b83291cd6dmr2805968eec.12.1770307098411;
        Thu, 05 Feb 2026 07:58:18 -0800 (PST)
X-Received: by 2002:a05:7300:cd8d:b0:2b6:fa0c:6c44 with SMTP id 5a478bee46e88-2b83291cd6dmr2805941eec.12.1770307097841;
        Thu, 05 Feb 2026 07:58:17 -0800 (PST)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b832fe59fasm3427697eec.34.2026.02.05.07.58.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Feb 2026 07:58:17 -0800 (PST)
Date: Thu, 5 Feb 2026 09:58:15 -0600
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: Jiakai Xu <xujiakai2025@iscas.ac.cn>
Cc: linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
        kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
        linux-kselftest@vger.kernel.org, Anup Patel <anup@brainfault.org>,
        Atish Patra <atish.patra@linux.dev>, Paul Walmsley <pjw@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
        Alexandre Ghiti <alex@ghiti.fr>,
        Andrew Jones <ajones@ventanamicro.com>,
        Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>,
        Jiakai Xu <jiakaiPeanut@gmail.com>
Subject: Re: [PATCH v6 2/2] RISC-V: KVM: selftests: Add RISC-V SBI STA shmem
 alignment tests
Message-ID: <gcspbbvqkr7y53c4ytkqqycygkcqkiakle4aelq2z7nsnlyegl@addv4v655cbg>
References: <20260205010502.2554381-1-xujiakai2025@iscas.ac.cn>
 <20260205010502.2554381-3-xujiakai2025@iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260205010502.2554381-3-xujiakai2025@iscas.ac.cn>
X-Authority-Analysis: v=2.4 cv=Vd76/Vp9 c=1 sm=1 tr=0 ts=6984be1b cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=cvcws7F5//HeuvjG1O1erQ==:17
 a=kj9zAlcOel0A:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=pGLkceISAAAA:8 a=reGFDpqf7T0RaJXXVMIA:9
 a=CjuIK1q_8ugA:10 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA1MDEyMCBTYWx0ZWRfXw95gczLCr+vx
 FLLndVNh2fsYF/OiJsVl7QO2TFrn3nfOSnjK0FfeCScHZyuJrSQ6/hkKeKfbPIyglPVv3jI2eQR
 DiS/3YJtaVIDJPNhns3P2TDSXLPc4JEMwfbTAk66rB7I8T/Y/KbFcz+f8mQD966c9RICi1RcdEV
 b0w+Y+05eamkFxc2u8VATtWaB3qXQ5tDcyAIrgznSJa6tHgnA1cI4jnugLudD82QFlJJwNxbfUo
 eJE1S0Ytam/0/vuaDA4F+JaMdCrhDzscS9ah8LVS+7ksfHbRRuv8j7uuryamsnvPQBusrNu4KIa
 W0VrEpBQ1zD/Bqdl93/6hL2Qi/ujEVQrpulwkam26+nap0dHHhjHGzAXkDEWEgIsWjgylAA+O1m
 pVgG7EoyAQ6RhV5q7cO2aNgNkMuh6y8RHp67x5XqL1DVtNK1wTF132DGbfuv8tbD5QPc4bkHfaZ
 ZbgHBW2dvWbs9v8RcnA==
X-Proofpoint-ORIG-GUID: DiyFEz3LY9dW7ohlO7E3R9MidVZBbW77
X-Proofpoint-GUID: DiyFEz3LY9dW7ohlO7E3R9MidVZBbW77
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-05_03,2026-02-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 bulkscore=0 phishscore=0 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602050120
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260205_075820_604157_356F29C2 
X-CRM114-Status: GOOD (  30.09  )
X-BeenThere: kvm-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <kvm-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/kvm-riscv>,
 <mailto:kvm-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/kvm-riscv/>
List-Post: <mailto:kvm-riscv@lists.infradead.org>
List-Help: <mailto:kvm-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/kvm-riscv>,
 <mailto:kvm-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
Errors-To: kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Feb 05, 2026 at 01:05:02AM +0000, Jiakai Xu wrote:
> Add RISC-V KVM selftests to verify the SBI Steal-Time Accounting (STA)
> shared memory alignment requirements.
> 
> The SBI specification requires the STA shared memory GPA to be 64-byte
> aligned, or set to all-ones to explicitly disable steal-time accounting.
> This test verifies that KVM enforces the expected behavior when
> configuring the SBI STA shared memory via KVM_SET_ONE_REG.
> 
> Specifically, the test checks that:
> - misaligned GPAs are rejected with -EINVAL
> - 64-byte aligned GPAs are accepted
> - INVALID_GPA correctly disables steal-time accounting
> 
> Signed-off-by: Jiakai Xu <xujiakai2025@iscas.ac.cn>
> Signed-off-by: Jiakai Xu <jiakaiPeanut@gmail.com>
> ---
>  .../selftests/kvm/include/riscv/processor.h   |  4 +++
>  tools/testing/selftests/kvm/steal_time.c      | 33 +++++++++++++++++++
>  2 files changed, 37 insertions(+)
> 
> diff --git a/tools/testing/selftests/kvm/include/riscv/processor.h b/tools/testing/selftests/kvm/include/riscv/processor.h
> index e58282488beb3..c3551d129d2f6 100644
> --- a/tools/testing/selftests/kvm/include/riscv/processor.h
> +++ b/tools/testing/selftests/kvm/include/riscv/processor.h
> @@ -62,6 +62,10 @@ static inline uint64_t __kvm_reg_id(uint64_t type, uint64_t subtype,
>  						     KVM_REG_RISCV_SBI_SINGLE,		\
>  						     idx, KVM_REG_SIZE_ULONG)
>  
> +#define RISCV_SBI_STA_REG(idx)	__kvm_reg_id(KVM_REG_RISCV_SBI_STATE,	\
> +						     KVM_REG_RISCV_SBI_STA,			\
> +						     idx, KVM_REG_SIZE_ULONG)

We don't need this because...

> +
>  bool __vcpu_has_ext(struct kvm_vcpu *vcpu, uint64_t ext);
>  
>  static inline bool __vcpu_has_isa_ext(struct kvm_vcpu *vcpu, uint64_t isa_ext)
> diff --git a/tools/testing/selftests/kvm/steal_time.c b/tools/testing/selftests/kvm/steal_time.c
> index 8edc1fca345ba..30b98d1b601c3 100644
> --- a/tools/testing/selftests/kvm/steal_time.c
> +++ b/tools/testing/selftests/kvm/steal_time.c
> @@ -209,6 +209,7 @@ static void steal_time_dump(struct kvm_vm *vm, uint32_t vcpu_idx)
>  
>  /* SBI STA shmem must have 64-byte alignment */
>  #define STEAL_TIME_SIZE		((sizeof(struct sta_struct) + 63) & ~63)
> +#define INVALID_GPA (~(u64)0)
>  
>  static vm_paddr_t st_gpa[NR_VCPUS];
>  
> @@ -301,6 +302,34 @@ static void steal_time_dump(struct kvm_vm *vm, uint32_t vcpu_idx)
>  	pr_info("\n");
>  }
>  
> +static void test_riscv_sta_shmem_alignment(struct kvm_vcpu *vcpu)
> +{
> +	struct kvm_one_reg reg;
> +	uint64_t shmem;
> +	int ret;
> +
> +	reg.id = RISCV_SBI_STA_REG(0);

...here we should use KVM_REG_RISCV_SBI_STA_REG(shmem_lo)

> +	reg.addr = (uint64_t)&shmem;
> +
> +	/* Case 1: misaligned GPA */
> +	shmem = ST_GPA_BASE + 1;
> +	ret = __vcpu_ioctl(vcpu, KVM_SET_ONE_REG, &reg);
> +	TEST_ASSERT(ret == -1 && errno == EINVAL,
> +		    "misaligned STA shmem should return -EINVAL");

remove the word 'should'

"misaligned STA shmem returns -EINVAL"

> +
> +	/* Case 2: 64-byte aligned GPA */
> +	shmem = ST_GPA_BASE;
> +	ret = __vcpu_ioctl(vcpu, KVM_SET_ONE_REG, &reg);
> +	TEST_ASSERT(ret == 0,
> +		    "aligned STA shmem should succeed");

same comment about 'should'

> +
> +	/* Case 3: INVALID_GPA disables STA */
> +	shmem = INVALID_GPA;
> +	ret = __vcpu_ioctl(vcpu, KVM_SET_ONE_REG, &reg);
> +	TEST_ASSERT(ret == 0,
> +		    "INVALID_GPA should disable STA successfully");

We're not testing that STA was successfully disabled, only that all-ones
input doesn't generate an error. So the message should be along the lines
of "all-ones for STA shmem succeeds"

> +}
> +
>  #endif
>  
>  static void *do_steal_time(void *arg)
> @@ -369,6 +398,10 @@ int main(int ac, char **av)
>  	TEST_REQUIRE(is_steal_time_supported(vcpus[0]));
>  	ksft_set_plan(NR_VCPUS);
>  
> +#ifdef __riscv
> +	test_riscv_sta_shmem_alignment(vcpus[0]);
> +#endif

We like to try to avoid #ifdefs in common functions by providing stubs for
architectures that don't need them [yet]. So we should rename this to
something more generic, like

 check_steal_time_uapi()

and then call it for all architectures. Actually the other architectures
can already make use of it since both x86 and arm64 do uapi tests in
their steal_time_init() functions and that's not really the right
place to do that. I suggest creating another patch that first moves those
tests into new functions (check_steal_time_uapi()) which only needs to
be called once for vcpu[0] outside the vcpu loop, as you do here. In
that patch check_steal_time_uapi() will be a stub for riscv. Then in 
a second patch fill in that stub with the tests above.

Thanks,
drew

> +
>  	/* Run test on each VCPU */
>  	for (i = 0; i < NR_VCPUS; ++i) {
>  		steal_time_init(vcpus[i], i);
> -- 
> 2.34.1
> 

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
