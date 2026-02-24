Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BB7CF4BB98
	for <kvm-riscv@archiver.kernel.org>; Tue, 24 Feb 2026 22:36:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LgO7zZ1Nb2NFPDX/lWEWgTjk9YIVbVd1HxzmLSysKZA=; b=xs4WKamh7J6EFB
	tDu+jiliM4kigS6YkCeshVdq1tdue+V7VnVb01c8KS0DigPpxGq4jmmYmzoNMvNUbfjHat3xFsxCx
	lcRO2eL8lj8w/cWKkJyZOneUtzgBMAQzcHs5dnqmdwDgm/CKpCXDfLH1EM+WYktLkAQcRoGVczipe
	ewmAL/1BsNQ9ooHl21KwGp/VVN1Mk5IsjqKCG7Q+qIvNlIGMyRrBqD3K55pKcCKMBo/7FqJo9Ohbk
	1PZq/fV/RIctX3F0vcDUL/oPzuTH9ih9BrnxRvIZCeq4RanlTxr7tP6bO8czia6RYNLjKR3CwZWIX
	o3aW/GhUvc4vbyeHQpyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vv10b-00000002sfc-398Z;
	Tue, 24 Feb 2026 22:36:01 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vv10Z-00000002seS-1tz6
	for kvm-riscv@lists.infradead.org;
	Tue, 24 Feb 2026 22:36:00 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61OFlJVj4044481
	for <kvm-riscv@lists.infradead.org>; Tue, 24 Feb 2026 22:35:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=jl3/kGLy/uiPn4E9pCww6rxR
	H2A13SEeo46Ae3ywkm8=; b=XX7g7Ft0xLvppEfCX8r7ER8OMh4f6cTzRW7dZQh4
	mdVLfHdvzZ4Jm0VmMGs8S9EI/Y4DHbe+bTNRbQ19fQMgyH5CpiCyPjfFuMxuABHD
	Y+2AuJ2RnGRO5Zuj6YZ2kw+kocvRKVcnmxMDub3GHTYW9JIwaknLrLFqaQaq33Px
	8iZomqe07aMpgVANr0o5rXVVmWycHRPgu21YvPrlx9DAxvyaACW1w0rGd/pamkWD
	e3EAoijW0pBfyEBlmqhQjggxFPHqdeLBvsYaFO/ibdLuHgqc30E8qeVAwsFxgb9w
	3GaMKCADAWcLiQ4n6lGVSB2mWQQno3Hftd5NcV706zjxgQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4chexehchx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <kvm-riscv@lists.infradead.org>; Tue, 24 Feb 2026 22:35:58 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2bd2a2028c5so8851394eec.0
        for <kvm-riscv@lists.infradead.org>; Tue, 24 Feb 2026 14:35:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771972557; x=1772577357; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jl3/kGLy/uiPn4E9pCww6rxRH2A13SEeo46Ae3ywkm8=;
        b=cEWA0oNRyC1ibIbX59GYxtZg9QsFo3sMfWFDYcLUSq1DRYjD6jfcfMIw+NVwbcFaC8
         292ZnNYJ3sOJ8djoDAukIpvmT4Z5WcNVaFGbxsngZ6dLVnkd5npAUw6gZI5XUdE0uxqP
         DfFOMNhxj5XpsX9fStFM4/wDVWzn4y0RiY/9w/FkxpBi1YNWTsLwYNhBYKgf3uF4zoGW
         jojh9evY0WCXOggg2xPI1aRbcD2xlAblVzeZeTa97zIhWiKQCQgQ1PB/V64afR7g125o
         l75jyHm3RuO3KsmuuRE5l0NrGf+Ut011jrAxchKjJHMLxUfMddwAr60cGflY0VxsNXjp
         lSXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771972557; x=1772577357;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jl3/kGLy/uiPn4E9pCww6rxRH2A13SEeo46Ae3ywkm8=;
        b=nEGMesyIrq94BhUr/SfRgIR+Uqj1rbgT/8okjMSSH3cul08QhkY/aC5lheODp3nlyS
         826G+ufFXXAls8NTtcJ/TrWROqI8lJon3gIKdO/QcYwmW4Y4cTp2e1CTStYClqdtdL7/
         cFOiENdVRB5fhv/hUa6z3RuvbPoulIyHjfbItAJQ3lWw1jO1AcGOCItICfb0UdtPjq8w
         vZcWqfpXzUL3aM+QTlghNwPqJo8nmKV6at9j9+H3oU/EvrgIz/4F1jJnWw48NMkgBWtj
         PCZn2SYC237OH5o2PrC/1CaxzWu8ql9lJZk4Mgnj/tDLSkxM4QnT+Wo3AdFAfAnr+GY4
         Z8fA==
X-Forwarded-Encrypted: i=1; AJvYcCW3iftCaQcCwJKjY3ezXRM+81rQlXWZ5I18iPPDbtMjgtR5mWUpJiRS1tU2/xbueeE7QEpMBqeocdU=@lists.infradead.org
X-Gm-Message-State: AOJu0YztEiOFG63ZQJrCMBoJ3GUFBTTWX0qfNWq/GZ2HnF473H2dGK7f
	4JKv/Ad9bKyWPjz8xdSkYgGjIs3+OMyRs+9H+qXaTd/aX8mZsNstq0sd24BlV4CXEVnRbSQutIH
	GPtfcwBTp8P6POTyTtU2rgU8c2Z+DmiAtQSrndx0516YVsG4SC+3GR2l1xWXkxIhKZ2Zd
X-Gm-Gg: ATEYQzwZYTRbJ8MVt0yht/iGNEx22e3dadlyJHWwEnCFyBHfoOg+NGuPJUZolmrMIQ+
	2cO7D1IFc/yJb/G/iMA7MOYkCBq3Uf127J3hxPKVtmHvfsO1StWFWiMhkW/+b7U9Fbqd4t6lNjs
	FIKpL6LXcZZ+JE3wQ6ZBr5NVBltxoqhwb3hCcHSbtzU7jW3nkgqa+UCRFKS/IleUM0eKe1JFDAd
	JUSf0mHA/bWhy5CHXX7tWChqoCkJdGOOgsC3iUB8v9Xl3C+mOotPcooYl9gauqeXpldbQBrfCm3
	Sk7s09tQ9/FFqTosXfBygYOwlHYHaJ7TQEa2vyZgbEwe4rR7uGFEI7mUy7p/K+n3YDxumXJD7Hp
	AK45VQTHvWMnmdkOUaVZr0AQRBdSv310=
X-Received: by 2002:a05:7301:1e92:b0:2ba:9115:2fab with SMTP id 5a478bee46e88-2bdc31a9008mr50750eec.12.1771972557373;
        Tue, 24 Feb 2026 14:35:57 -0800 (PST)
X-Received: by 2002:a05:7301:1e92:b0:2ba:9115:2fab with SMTP id 5a478bee46e88-2bdc31a9008mr50743eec.12.1771972556842;
        Tue, 24 Feb 2026 14:35:56 -0800 (PST)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2bd7dbe82desm8327254eec.20.2026.02.24.14.35.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 14:35:55 -0800 (PST)
Date: Tue, 24 Feb 2026 16:35:54 -0600
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
Subject: Re: [PATCH v7 3/3] RISC-V: KVM: selftests: Add RISC-V SBI STA shmem
 alignment tests
Message-ID: <7spmby7jcusyegus2knlhb7nvnyk5c3yz4z5luu6piymj6rwsv@zgktge5bmgd5>
References: <20260213103557.3207335-1-xujiakai2025@iscas.ac.cn>
 <20260213103557.3207335-4-xujiakai2025@iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260213103557.3207335-4-xujiakai2025@iscas.ac.cn>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI0MDE5NyBTYWx0ZWRfX+urVXRAAYrJT
 XyjyChaU8+fGaK4ZduH9cB0EXX/1t1IL2dN0LnuEo4/l129l/04heaSxyQB6Ux+YqxCao0o8lN4
 k/i06i0q2zRQyU/CCo3zKUb0CEsGKCrcCZ/men4AoYp9AIvZxRAMqxatYXCiQQsMwVN6LGygtku
 gJ6BBO20hO+E0AHjWISWxtOrg0FgOMsnJP+rEeRv3KDs0o/ujl5WAKwr2nKr8M5UjSZncKGDyhO
 YfjGlmOT2x+1cDVX5NRGBfkf3tB9DhQ2HCC+ogYjWepr5SxH1LVGwdzgvZXAbSDXDxZBrfQfIqq
 ioWNWnqyBag7BBkqtYROvk0Arq7muYFhl7zZo0W57Se0SiMgco9lqJI6OXAAnWr7Cct1Y9/VZK2
 p9dG1xwUbv6txfZaKuOALrbLJBiX264zXnY20lfPNWB9dpdh9PCqqGS7eybGF/rpIypIf91r8Ch
 TvArBlsnJqntIB4fbYg==
X-Authority-Analysis: v=2.4 cv=V85wEOni c=1 sm=1 tr=0 ts=699e27ce cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=cvcws7F5//HeuvjG1O1erQ==:17
 a=kj9zAlcOel0A:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=pGLkceISAAAA:8 a=9ujUvY2DB1qyNZ7L-csA:9 a=CjuIK1q_8ugA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: -hoOzt5B49nMUVg4jJXK2uInIFMeAkMF
X-Proofpoint-ORIG-GUID: -hoOzt5B49nMUVg4jJXK2uInIFMeAkMF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-24_03,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 spamscore=0
 suspectscore=0 phishscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602240197
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260224_143559_605538_4D3F3AE0 
X-CRM114-Status: GOOD (  26.11  )
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

On Fri, Feb 13, 2026 at 10:35:57AM +0000, Jiakai Xu wrote:
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
> V6 -> V7: 
> - Removed RISCV_SBI_STA_REG() macro addition and used existing 
> KVM_REG_RISCV_SBI_STA_REG(shmem_lo) instead.
> - Refined assertion messages per review feedback.
> - Split into two patches per Andrew Jones' suggestion:
>     Refactored UAPI tests from steal_time_init() into dedicated 
>     check_steal_time_uapi() function and added empty stub for 
>     RISC-V.
>     Filled in RISC-V stub with STA alignment tests. (this patch)
> ---
>  tools/testing/selftests/kvm/steal_time.c | 26 +++++++++++++++++++++++-
>  1 file changed, 25 insertions(+), 1 deletion(-)
> 
> diff --git a/tools/testing/selftests/kvm/steal_time.c b/tools/testing/selftests/kvm/steal_time.c
> index a814f6f3f8b41..2af7fd7513d55 100644
> --- a/tools/testing/selftests/kvm/steal_time.c
> +++ b/tools/testing/selftests/kvm/steal_time.c
> @@ -233,6 +233,7 @@ static void check_steal_time_uapi(struct kvm_vcpu *vcpu)
>  
>  /* SBI STA shmem must have 64-byte alignment */
>  #define STEAL_TIME_SIZE		((sizeof(struct sta_struct) + 63) & ~63)
> +#define INVALID_GPA (~(u64)0)

This belongs in kvm_util_types.h

>  
>  static vm_paddr_t st_gpa[NR_VCPUS];
>  
> @@ -327,7 +328,30 @@ static void steal_time_dump(struct kvm_vm *vm, uint32_t vcpu_idx)
>  
>  static void check_steal_time_uapi(struct kvm_vcpu *vcpu)
>  {
> -	/* RISC-V UAPI tests will be added in a subsequent patch */
> +	struct kvm_one_reg reg;
> +	uint64_t shmem;
> +	int ret;
> +
> +	reg.id = KVM_REG_RISCV_SBI_STA_REG(shmem_lo);
> +	reg.addr = (uint64_t)&shmem;
> +
> +	/* Case 1: misaligned GPA */
> +	shmem = ST_GPA_BASE + 1;
> +	ret = __vcpu_ioctl(vcpu, KVM_SET_ONE_REG, &reg);
> +	TEST_ASSERT(ret == -1 && errno == EINVAL,
> +		    "misaligned STA shmem returns -EINVAL");
> +
> +	/* Case 2: 64-byte aligned GPA */
> +	shmem = ST_GPA_BASE;
> +	ret = __vcpu_ioctl(vcpu, KVM_SET_ONE_REG, &reg);
> +	TEST_ASSERT(ret == 0,
> +		    "aligned STA shmem succeeds");
> +
> +	/* Case 3: INVALID_GPA disables STA */
> +	shmem = INVALID_GPA;
> +	ret = __vcpu_ioctl(vcpu, KVM_SET_ONE_REG, &reg);
> +	TEST_ASSERT(ret == 0,
> +		    "all-ones for STA shmem succeeds");
>  }

I'd remove the 'Case 1', 'Case 2', text from the comments because it'll
be a pain to maintain when people want to add/remove test cases.

Thanks,
drew

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
