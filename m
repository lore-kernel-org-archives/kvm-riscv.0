Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08EC8FD9E0A
	for <kvm-riscv@archiver.kernel.org>; Thu, 26 Feb 2026 19:57:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EsxeUUth+Zkiedg3e/cNnnljPWEJRzl+hI0VzvUF1R8=; b=TZQzGhB5MOtp4P
	m4tEMFUWrHN3ozTOu0xRgfbAs8/jd/xRV24e4mEFwS3b06dVH+Ml/KF19dVuN7nHmIvX0EAJt+Ke3
	R5+yZ5tMwJhajb0Ro7geRKZn1FnypcB5AR8XiomtKl1poFk1BPUXYp8+BtP0vE7NMA6oeryMWeeLP
	Eky/tcmC4XF5/GTWRwYY0s6/cvKJDfnlVR0mKw/Q5Xdu6bod+IwOfStcfsgp96NMkaFV747OAee6x
	scCgWB8UP1Tig6oxhLES6hmwMOIA+qFAkE2UJ1gBfyW7RWxEGj8Lbt31TBANP+WZQpHshcoLacJGS
	v9KQWZc1seY22TjBuDNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvhTv-000000077Dv-3Cqq;
	Thu, 26 Feb 2026 19:57:07 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvhTs-000000077D7-3tSW
	for kvm-riscv@lists.infradead.org;
	Thu, 26 Feb 2026 19:57:05 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61QHF8r02610306
	for <kvm-riscv@lists.infradead.org>; Thu, 26 Feb 2026 19:57:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=e9T0r9qPbJXEHEbE1DDUwuy1
	sFl7CYMlXpPV3+ZDZi4=; b=T1D30GlWpBTy7Fw5YVU5jHPnPcoQFM1DW5bOlomS
	G7W2fA8KNbLusn4Qm442rSpHBAYDx9aibSMdsziJ2WvVDYfAFzBPzTUsWmVe6V9l
	GJIQMqvHKa3Jo052jZirdYeWDM1RqDSMEvejXg3D8uvyMSePW51AYIKrShf+bLqB
	J+Wah9TMbrRt/JKsxaHj/K2mseAquS6wmKUlP57UUI2QH1ctwHvaR4tQoU6TLcYE
	qvoVVQz5nFb28OId1e2Rd9LLXVZk1kTBuG5aClPpZFNRPg6XTy7sarFi9ObtfdLd
	PodhJWY20rkoq+08ayYZUN70ITDaGQjGrcD/9R5C9Rk4rQ==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cjt7y8sak-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <kvm-riscv@lists.infradead.org>; Thu, 26 Feb 2026 19:57:03 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-1273665df8fso2063009c88.1
        for <kvm-riscv@lists.infradead.org>; Thu, 26 Feb 2026 11:57:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772135823; x=1772740623; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=e9T0r9qPbJXEHEbE1DDUwuy1sFl7CYMlXpPV3+ZDZi4=;
        b=GyA3viNWJPuA1kMcQiiCMwifsWwTTFPczwnrwSPqp7LlFuhTAMOuQtAwLEV6dOhgaG
         7zoypybf+8PVgl7nKOIpkn7SccRVr9Boc0+32CbICjHW7/gdanMEcgb0kYEgQbVNcT55
         pHWCNl6kai+1JZtbyyh4YYc/K/8faA+ohwc/7yoEs0vKNaXMASI2MSOkQzzVhVLbDnCH
         vRJi4uFwxDzMT0wKjEIvOiC6QDguS/BvZyF/1TYNZRwOg+72IFTVR8hOu1iKHGdc4yZk
         JNxbn1Y/zK0d0b7zWJnapjrw7k/cQhAZWguYqjl6Uag7vXkc05RkVCMAIxaf2j8cASKS
         tvlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772135823; x=1772740623;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e9T0r9qPbJXEHEbE1DDUwuy1sFl7CYMlXpPV3+ZDZi4=;
        b=iT41prwplR9i8AMIhGFtr6YHG3jVpiWtOvN8mSV8udtLlzc3KMsHHgubOpjt3ddrWh
         IYJ8R3cppTMns4J96X2lHfc4oceUky2I/+nsYlbH0J+Ofh9DGpia+hjSnxhsHErNz0pv
         lBdqHUjWdn4JS2+aZn7Avm+VR0Tz65RcpC9+X4aAjWqBoof/Ms9+HDSJntwc2UW+uEW1
         fMWjng4KvMmzcrBIkp0jArpe8cgg3UWlUHkLLk+QJM7fQYLQURHjCoW1ZWPEaPwAnqwU
         4gFNXqfBht9ALNLNaJ+jpUsdhP7qrCIsK139xYzyIc+c+mBn118UBfTs6YlDIgVX2Qbf
         lllw==
X-Forwarded-Encrypted: i=1; AJvYcCVkTzS/ZnNfmJyS6b1HTOvrOtEF1tL2oAdqARJTMj7BHzYGK1luyMTYDIylxVw0JzTcRb9tMe5vpHc=@lists.infradead.org
X-Gm-Message-State: AOJu0Yxr7GwfH4s6if6r4ap97oaMVR7NbmmgQAFnamdo9KhwuSo18EtW
	KUh4qZpZel5HGMg9vDRpbvXMhkAIWZv0OBFZI8z+MyUiruhy2B+PGS5/HLL8kLdOzDVeuRh2+LB
	NwTQVxklxrlfOtkzwBc0CW1p7QaAZ1tRfUqTxAzOx494Y9SkY8cl+6l3dBQO2MzLM9SPN
X-Gm-Gg: ATEYQzyerWAm1yGBrlZDFYV55fh+cwa0e2lwJBqnxyfiue/6UX5PBGJMRUtQu3ImhFO
	M3zIvYIbphKlJrCgV6uBmCgKY4m3XtY2YmYg7uuZR1xAPV64Ftqfys+hL3+rsvEvtSThlEusPli
	vCk+dV+nYRbYEVcEhrsdA4cpiLU7o+CBgQq7eSNw+i9YoTPuUmiYyOnvsDenBXGOZ3m6jqTXBBw
	sr2FP2lIOA67cdH2rv/Yygef+n/6xN7shIeGzIwJBvrJ6cxumAvwDVR7WC+qKDOTnXcRyD+avI/
	ekvHHaS4X6IdasXWtbO33h6VV31Zni+yaOkBbnk3vrSG3erclllT6xgVzyGiQFv5AoQmsIZxvyt
	djva2lUn/6MO3ZwLa5KC31aKa2EVkRnE=
X-Received: by 2002:a05:7022:512:b0:119:e55a:9c03 with SMTP id a92af1059eb24-1278fc3bf63mr58113c88.31.1772135823063;
        Thu, 26 Feb 2026 11:57:03 -0800 (PST)
X-Received: by 2002:a05:7022:512:b0:119:e55a:9c03 with SMTP id a92af1059eb24-1278fc3bf63mr58096c88.31.1772135822464;
        Thu, 26 Feb 2026 11:57:02 -0800 (PST)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2bdd1e04361sm2885359eec.14.2026.02.26.11.57.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 11:57:01 -0800 (PST)
Date: Thu, 26 Feb 2026 13:57:00 -0600
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: Jiakai Xu <xujiakai2025@iscas.ac.cn>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
        kvm-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org,
        kvm@vger.kernel.org, Alexandre Ghiti <alex@ghiti.fr>,
        Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>,
        Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Andrew Jones <ajones@ventanamicro.com>,
        Anup Patel <anup@brainfault.org>, Atish Patra <atish.patra@linux.dev>,
        Albert Ou <aou@eecs.berkeley.edu>, Jiakai Xu <jiakaiPeanut@gmail.com>
Subject: Re: [PATCH v8 3/3] RISC-V: KVM: selftests: Add RISC-V SBI STA shmem
 alignment tests
Message-ID: <ywgpwvhzvtkmhw26exwwam5hfo5euhiewbrzyzh2uzkls2rkbe@g7p5kxnhtgso>
References: <20260226083234.634716-1-xujiakai2025@iscas.ac.cn>
 <20260226083234.634716-4-xujiakai2025@iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260226083234.634716-4-xujiakai2025@iscas.ac.cn>
X-Proofpoint-ORIG-GUID: MrVNESu2f_COmkA3batS1FTXGldVz_20
X-Authority-Analysis: v=2.4 cv=N7Mk1m9B c=1 sm=1 tr=0 ts=69a0a58f cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=cvcws7F5//HeuvjG1O1erQ==:17
 a=kj9zAlcOel0A:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=pGLkceISAAAA:8 a=xMjqbsr0sL_NellN6QoA:9 a=CjuIK1q_8ugA:10
 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-GUID: MrVNESu2f_COmkA3batS1FTXGldVz_20
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI2MDE4MiBTYWx0ZWRfXxcYLzWDudo2g
 idvyM7AkN4un/FhSunYp62G1ZkOhDuMMp1zEo2NO6WQPOAjWcxBC7zU6ahE4gkvgbHSHNzE8Llr
 zLgmpwutitvA0mz5sWyIBLwMBtzLjkmnpxBHZ8jlk4qnWC2Jl+Bq38+SiXQ74k9GJVJmJVcrCY0
 bu7JtX8ftDq+G3cg9u0A0h+8/TVRf5qzBVchqDm2CflmpxZVRWTNbhLTgZ/sAA9i7vaSn4WiblV
 a3uT3UipGAdj5aVtyiJiikfDVOi81iLUbRcRnVeVVociTKygxtDMIPj9/9n/xBobug/lWKbO7rd
 P0xUi9Nx08mjp5X5pYyDtU3sLNB29yl1ksZDp2LN4ul0BCd3n1hBFp1FMBE/KXji4Y87mhDK5fN
 AidYlkOx2J5yBemnuF88sGRESc2uwzi3Fn6VB1h9SpEMj9KelA51i5EgbMZfLOcTXJ36Ec9+3P5
 5mWT83GCeZUgT3t6Z5w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-26_02,2026-02-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 clxscore=1015 suspectscore=0 spamscore=0
 adultscore=0 bulkscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602260182
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_115704_993358_DFC619D6 
X-CRM114-Status: GOOD (  26.19  )
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

On Thu, Feb 26, 2026 at 08:32:34AM +0000, Jiakai Xu wrote:
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
> - all-ones GPA is accepted
> 
> Signed-off-by: Jiakai Xu <xujiakai2025@iscas.ac.cn>
> Signed-off-by: Jiakai Xu <jiakaiPeanut@gmail.com>
> ---
> V7 -> V8: Moved INVALID_GPA definition to kvm_util_types.h.
>           Removed comments in RISC-V check_steal_time_uapi().
>           Corrected reg.id assignment for SBI STA.
> V6 -> V7: Removed RISCV_SBI_STA_REG() macro addition and used existing
>            KVM_REG_RISCV_SBI_STA_REG(shmem_lo) instead.
>           Refined assertion messages per review feedback.
>           Split into two patches per Andrew Jones' suggestion:
>            Refactored UAPI tests from steal_time_init() into dedicated
>             check_steal_time_uapi() function and added empty stub for
>             RISC-V.
>            Filled in RISC-V stub with STA alignment tests. (this patch)
> ---
>  .../selftests/kvm/include/kvm_util_types.h    |  4 +++
>  tools/testing/selftests/kvm/steal_time.c      | 25 +++++++++++++++++++
>  2 files changed, 29 insertions(+)
> 
> diff --git a/tools/testing/selftests/kvm/include/kvm_util_types.h b/tools/testing/selftests/kvm/include/kvm_util_types.h
> index ec787b97cf184..90567f8243fe9 100644
> --- a/tools/testing/selftests/kvm/include/kvm_util_types.h
> +++ b/tools/testing/selftests/kvm/include/kvm_util_types.h
> @@ -17,4 +17,8 @@
>  typedef uint64_t vm_paddr_t; /* Virtual Machine (Guest) physical address */
>  typedef uint64_t vm_vaddr_t; /* Virtual Machine (Guest) virtual address */
>  
> +#if defined(__riscv)

Why this #if ? INVALID_GPA is common to all architectures (see
include/linux/kvm_types.h). That's why I suggested putting it in this
shared header.

> +#define INVALID_GPA (~(uint64_t)0)
> +#endif
> +
>  #endif /* SELFTEST_KVM_UTIL_TYPES_H */
> diff --git a/tools/testing/selftests/kvm/steal_time.c b/tools/testing/selftests/kvm/steal_time.c
> index 6f77df4deaad3..e90aad9561ff7 100644
> --- a/tools/testing/selftests/kvm/steal_time.c
> +++ b/tools/testing/selftests/kvm/steal_time.c
> @@ -324,6 +324,31 @@ static void steal_time_dump(struct kvm_vm *vm, uint32_t vcpu_idx)
>  
>  static void check_steal_time_uapi(struct kvm_vcpu *vcpu)
>  {
> +	struct kvm_one_reg reg;
> +	uint64_t shmem;
> +	int ret;
> +
> +	reg.id = KVM_REG_RISCV |
> +			 KVM_REG_SIZE_ULONG |
> +			 KVM_REG_RISCV_SBI_STATE |
> +			 KVM_REG_RISCV_SBI_STA |
> +			 KVM_REG_RISCV_SBI_STA_REG(shmem_lo);
> +	reg.addr = (uint64_t)&shmem;
> +
> +	shmem = ST_GPA_BASE + 1;
> +	ret = __vcpu_ioctl(vcpu, KVM_SET_ONE_REG, &reg);
> +	TEST_ASSERT(ret == -1 && errno == EINVAL,
> +		    "misaligned STA shmem returns -EINVAL");
> +
> +	shmem = ST_GPA_BASE;
> +	ret = __vcpu_ioctl(vcpu, KVM_SET_ONE_REG, &reg);
> +	TEST_ASSERT(ret == 0,
> +		    "aligned STA shmem succeeds");
> +
> +	shmem = INVALID_GPA;
> +	ret = __vcpu_ioctl(vcpu, KVM_SET_ONE_REG, &reg);
> +	TEST_ASSERT(ret == 0,
> +		    "all-ones for STA shmem succeeds");
>  }
>  
>  #endif
> -- 
> 2.34.1
>

Thanks,
drew

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
