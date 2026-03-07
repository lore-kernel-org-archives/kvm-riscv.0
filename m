Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 295CBF55104
	for <kvm-riscv@archiver.kernel.org>; Sat,  7 Mar 2026 17:18:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PVk32W3CD3sgVLg0hhzAMJEajKG0A4XVUUf8JreHZUU=; b=U/bNdYwB/u+QD4
	49fRfZqB7p7or3KNOw8yT+wZaQgS/yzJ7diy0g/cR5ZZ+zy1FgEds0O3smp9/dh4XAX1y7yIrIoIh
	WSwek8v+/57P9MxFld5hrM857aWELfa0vjuBzyrmJqcz5SyE1Su+IH/mq0oZNgZoeKPXbQGOmWBGe
	LPZj9401+F/LN7g06U/sHaxRqDXYBvxAoZ29I1pmem1n3mHXvblKnUn00Tk+eaT8MP10giKgPw9n+
	PEytw9GYq0Nkna0XK402JV07e24NjDMrRtBlK9fOkm2dKPlhiwADTVm+TVPoCHFnJTFFLn5bSm+lE
	t/xt0ntHTK2gH0jsULpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyvIe-00000005ORf-1sge;
	Sat, 07 Mar 2026 17:18:48 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyvIa-00000005OQR-3FZz
	for kvm-riscv@lists.infradead.org;
	Sat, 07 Mar 2026 17:18:46 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 627B04lU202936
	for <kvm-riscv@lists.infradead.org>; Sat, 7 Mar 2026 17:18:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=s8k67TJTMj1qQcVF4oBImnAO
	DU96TpZC8jCP+ZBlh6s=; b=cY/1KleGVTSgLS5YlcDghCqjDaPNsNVnmSje19iX
	qRbW5Gs0VTuIxwXLj8ZdR5Y9ZUHTCb2n7irKWeffh4Hd8PsMJN5QEt/2UhbW8FtJ
	O+AXqej3oSFyg1tuIu6Pd3GCGiNGuFRZGDksJXcHXbJjY5L7EBqCdRmKt8ZhBTd/
	8MaoPHbxakb/v69SKvuVdrMub+Z0k+DEmI7hpdD2mY26+HBoKl/IIu+AcjCywiDS
	0uVTd7r9RfsWqxeeC272GtyH6vfZDIxW1rhbneEFYDnSqymJPlNqNriA2jTE3C4S
	17s0rYN0jp9RlmPtxPpd7wC/JWl+oyIUvdGlRMzDyMoDzA==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4crb14sa3m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <kvm-riscv@lists.infradead.org>; Sat, 07 Mar 2026 17:18:43 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2be2f742c46so31039324eec.0
        for <kvm-riscv@lists.infradead.org>; Sat, 07 Mar 2026 09:18:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772903923; x=1773508723; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=s8k67TJTMj1qQcVF4oBImnAODU96TpZC8jCP+ZBlh6s=;
        b=WWo3zmfkbilCxy4D3Ez0wXvraYfECEMu116nJBYKC4QB7YxKURjVd2TGW20KmtP2WH
         CX8S1A0vIRQImhrS7NvwHTLYZSCptTazk491Vqr1Y6emMW23bK6DJ6MVP2Nje5+PwkHo
         ZjHIaJ+ttIQqJ3vVyOUneoGamn51isc1YVrakjGC91d+8fITP/Tf8qbtUjnBgStAnArN
         V+30VnyGui2mfYeYOx+AvVFPHxOT0G0oS8wZkitd/eHyEptqOhD5D1UxchUiT/Uov/2b
         M1Q7bekBWshxim3VZ+eYXPG/ioSRBQBxBmr9aGpzZ34rWDgUFaaUJA1oNjbDfNeXnA0l
         3tHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772903923; x=1773508723;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s8k67TJTMj1qQcVF4oBImnAODU96TpZC8jCP+ZBlh6s=;
        b=iembFnG9iL5Bm+faR3jQ5jIVDwv4KbBTLgkM8cY1Gs5qRnMR+TOIuSJZvPnzPT5o5s
         JB7V5TBj2xX95MWVeZ8fkETgmwAcr95cRwSe7MoKyDE1JU9aV+xQVkAxqn24rmTlhdrF
         HJFuqWW6ZJ7/nc3I4+w0tBA1n7uYgaQUpRaeXXevQaXs2vSE3J8lcZy67DPnWW0IqiYz
         u5smRdwq/wmfKDuM5Ssv/f5RJG8fwC6xsptwfYAU4a/7JQAvh0FOC1IHMdrYZCk8NI1A
         hGlXJap8q3Wj7/TUinq3EDC6+Bq2LnL0l1dinWNtXju2a234q1G6PLIjNwZbNmrjZkJz
         iiFg==
X-Forwarded-Encrypted: i=1; AJvYcCXNf/16TOu1mKBrUQTDJG7JD6BFb38QDnRCU0GbK+fcSVwiHhO/QjMUisg5ZtimVmM1GdScFmePzZI=@lists.infradead.org
X-Gm-Message-State: AOJu0Yzx6x5drEYbL+PnuwIwOjW609AogYu9WS6nKm4FrLhN5mtx/olI
	NklfDB0JKhzaSIc5+wNjB3Z9zQGSjkVLaWpEycfs7rdP11lmLfgelLPSv9x7hLlnmGdAxyjThPv
	ENVFqRTtJVRAudw+C3r06o6wKiTUEoHHhAvdiEN3b5wkNZd4lmLFhp1IUyi46DJnsOk28iKdfnD
	c+
X-Gm-Gg: ATEYQzxri2T/nk1i0uaQGI8ZZNaPp7glq57slo/jAcIT2mLBUdlvVU6rP4GCnzOYEzh
	8+39qmmusVR7qopCtb+/8u/6j8r8ihmS/MvTcpAmW5y3F9+mnRrpYD9JO5Gu0AlaEhR4PcDAZ4R
	IkPCFnCh4E41lsKAOh7fQxtHeLZ+N+iQ8gbINB7MnwHgBCCrGzehOATUKEadwcgrMwFryQPBg4Q
	XQof6H0lIIWnwzUeLAvmENOVh6Uh6GCAJudHeKnVMhQv+MoFnBMrOlkD+7+RyTOJXU1VO8piYPq
	igDR5TzSQXI0JGW2TnV4Cvhs0cJI4D9THowSIQK6T+cetz6owqxB3mwwESvSk7LFsafO1im1O82
	+q+qVh8u1uK0iAqYZtY7IneDEh8dI61M=
X-Received: by 2002:a05:7301:5795:b0:2be:30ca:1a9d with SMTP id 5a478bee46e88-2be4e04c762mr2263360eec.28.1772903922436;
        Sat, 07 Mar 2026 09:18:42 -0800 (PST)
X-Received: by 2002:a05:7301:5795:b0:2be:30ca:1a9d with SMTP id 5a478bee46e88-2be4e04c762mr2263345eec.28.1772903921799;
        Sat, 07 Mar 2026 09:18:41 -0800 (PST)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2be4f96aa32sm3669831eec.26.2026.03.07.09.18.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Mar 2026 09:18:40 -0800 (PST)
Date: Sat, 7 Mar 2026 11:18:38 -0600
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: Jiakai Xu <xujiakai2025@iscas.ac.cn>
Cc: ajones@ventanamicro.com, alex@ghiti.fr, anup@brainfault.org,
        aou@eecs.berkeley.edu, atish.patra@linux.dev, jiakaiPeanut@gmail.com,
        kvm-riscv@lists.infradead.org, kvm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
        palmer@dabbelt.com, pjw@kernel.org
Subject: Re: [PATCH 1/2] RISC-V: KVM: Fix array out-of-bounds in
 pmu_ctr_read()
Message-ID: <bcshd6j3vdeorxxmsmjmj5vi52mmivfe247aw77mr75zsk4llk@h3rxaqe23sb5>
References: <7cv4cq43l33fvpbikecjecfulomzurfmlbjk45u6amvdmnmrhu@7padusm25g5l>
 <20260307023537.3686946-1-xujiakai2025@iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260307023537.3686946-1-xujiakai2025@iscas.ac.cn>
X-Authority-Analysis: v=2.4 cv=IYSKmGqa c=1 sm=1 tr=0 ts=69ac5df3 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=cvcws7F5//HeuvjG1O1erQ==:17
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=uecIoWCG_2LCaAR_9GoA:9 a=CjuIK1q_8ugA:10 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: rpSJQxKnsBOiYtuXIxs8AZOmpff-RuYN
X-Proofpoint-ORIG-GUID: rpSJQxKnsBOiYtuXIxs8AZOmpff-RuYN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA3MDE2NCBTYWx0ZWRfX1ryZt5RZ6AkE
 BfN3hvwrsb89w/bDAmtrgckEUeRVTCHaCvAC+aTV6PDox5JV25Y8V/L74xxqdcVmj35KdMkpCD8
 CEy9qsT393Mu7BYa7/Wzoeg7jtQOK9giL3zSXEeJ4hDwTgdPHdDSGWzmmlN0nYwykKHr/z9b7KZ
 nWBnzh4aBHGXIc68H6SPe2mJKzgIYg7SUBbQDqdqVURETM0IiDFQ4cnX1cmSuxOzLCMpIh8Nd2S
 1pSokD3rS9CPG/Q62IHje+a3JKKZPOjB6ABU6QM36oe4L6IVl0Y9HAX8YeU1o/acc1OpFgKP5Kg
 z8z9PaxypM5WZiEPhW11Zwc8NyW2pHx90yPeKzCbZTTe2hWPnuFpqbG4cPHYqGrz5oyLPzn8KuI
 OJi0cmWWNO9Hz74rQtvQcd1hF2kTaGSGhcFpog50zrL1KrnmTNzsYIOtEhNMrHdmNqDp6hurRRW
 D0T3HbNxVarCWtUz34Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-07_05,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0 impostorscore=0
 phishscore=0 clxscore=1015 priorityscore=1501 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603070164
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260307_091844_974415_8092DBF8 
X-CRM114-Status: GOOD (  34.67  )
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

On Sat, Mar 07, 2026 at 02:35:37AM +0000, Jiakai Xu wrote:
> Hi Andrew,
> 
> Thanks for the review and the suggestions.
> 
> I agree with your feedback. In v2, I will merge the fixes for both
> pmu_ctr_read() and pmu_fw_ctr_read_hi() into a single commit and remove
> the pr_warn, simply returning -EINVAL instead.
> 
> I have two questions regarding the next version:
> 
> 1. Regarding other pr_warns in PMU emulation code:
> You mentioned that other pr_warns in the code might need auditing. Should
> I address those in this patchset (e.g., converting them to pr_warn_once
> or removing them), or is it better to keep this series focused strictly
> on the out-of-bounds fix and handle the logging cleanup in a separate
> patchset later?

Any changes that come out of the pr_warn audit will result in a separate
patch or patches. That work can be done completely separately and submit
as a separate series. Or, if you do it right now, you could append those
patches to this series. Either way works for me.

> 
> 2. Selftests update:
> I noticed that applying this fix causes a regression in
> selftests/kvm/sbi_pmu_test. The test_pmu_basic_sanity function currently
> attempts to read a firmware counter without configuring it via
> SBI_EXT_PMU_COUNTER_CFG_MATCH first.
> 
> Previously, this triggered the out-of-bounds access (likely reading
> garbage), but with this fix, the kernel correctly returns
> SBI_ERR_INVALID_PARAM, causing the test to fail.
> 
> To fix this, I plan to include a second patch in v2 that updates the
> selftest to properly configure the counter before reading. Here is my
> draft for the fix. Does this approach look reasonable to you?

That's good and we should do that, but we should also do negative testing.
So there should be a test case where we try to read a counter without
configuring it and ensure everything fails gracefully.

> 
> Thanks,
> Jiakai
> 
> ---
>  .../testing/selftests/kvm/include/riscv/sbi.h | 28 +++++++++++++++++++
>  .../selftests/kvm/riscv/sbi_pmu_test.c        |  9 +++++-
>  2 files changed, 36 insertions(+), 1 deletion(-)
> 
> diff --git a/tools/testing/selftests/kvm/include/riscv/sbi.h b/tools/testing/selftests/kvm/include/riscv/sbi.h
> index 046b432ae896..8c172422f386 100644
> --- a/tools/testing/selftests/kvm/include/riscv/sbi.h
> +++ b/tools/testing/selftests/kvm/include/riscv/sbi.h
> @@ -97,6 +97,34 @@ enum sbi_pmu_hw_generic_events_t {
>  	SBI_PMU_HW_GENERAL_MAX,
>  };
>  
> +enum sbi_pmu_fw_generic_events_t {
> +	SBI_PMU_FW_MISALIGNED_LOAD	= 0,
> +	SBI_PMU_FW_MISALIGNED_STORE	= 1,
> +	SBI_PMU_FW_ACCESS_LOAD		= 2,
> +	SBI_PMU_FW_ACCESS_STORE		= 3,
> +	SBI_PMU_FW_ILLEGAL_INSN		= 4,
> +	SBI_PMU_FW_SET_TIMER		= 5,
> +	SBI_PMU_FW_IPI_SENT		= 6,
> +	SBI_PMU_FW_IPI_RCVD		= 7,
> +	SBI_PMU_FW_FENCE_I_SENT		= 8,
> +	SBI_PMU_FW_FENCE_I_RCVD		= 9,
> +	SBI_PMU_FW_SFENCE_VMA_SENT	= 10,
> +	SBI_PMU_FW_SFENCE_VMA_RCVD	= 11,
> +	SBI_PMU_FW_SFENCE_VMA_ASID_SENT	= 12,
> +	SBI_PMU_FW_SFENCE_VMA_ASID_RCVD	= 13,
> +
> +	SBI_PMU_FW_HFENCE_GVMA_SENT	= 14,
> +	SBI_PMU_FW_HFENCE_GVMA_RCVD	= 15,
> +	SBI_PMU_FW_HFENCE_GVMA_VMID_SENT = 16,
> +	SBI_PMU_FW_HFENCE_GVMA_VMID_RCVD = 17,
> +
> +	SBI_PMU_FW_HFENCE_VVMA_SENT	= 18,
> +	SBI_PMU_FW_HFENCE_VVMA_RCVD	= 19,
> +	SBI_PMU_FW_HFENCE_VVMA_ASID_SENT = 20,
> +	SBI_PMU_FW_HFENCE_VVMA_ASID_RCVD = 21,
> +	SBI_PMU_FW_MAX,
> +};
> +
>  /* SBI PMU counter types */
>  enum sbi_pmu_ctr_type {
>  	SBI_PMU_CTR_TYPE_HW = 0x0,
> diff --git a/tools/testing/selftests/kvm/riscv/sbi_pmu_test.c b/tools/testing/selftests/kvm/riscv/sbi_pmu_test.c
> index 924a335d2262..0d6ba3563561 100644
> --- a/tools/testing/selftests/kvm/riscv/sbi_pmu_test.c
> +++ b/tools/testing/selftests/kvm/riscv/sbi_pmu_test.c
> @@ -461,7 +461,14 @@ static void test_pmu_basic_sanity(void)
>  			pmu_csr_read_num(ctrinfo.csr);
>  			GUEST_ASSERT(illegal_handler_invoked);
>  		} else if (ctrinfo.type == SBI_PMU_CTR_TYPE_FW) {
> -			read_fw_counter(i, ctrinfo);
> +			/*
> +			 * Try to configure with a common firmware event.
> +			 * If configuration succeeds, verify we can read it.
> +			 */
> +			ret = sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_COUNTER_CFG_MATCH,
> +			        i, 1, 0, SBI_PMU_FW_ACCESS_LOAD, 0, 0);
> +			if (ret.error == 0 && ret.value < RISCV_MAX_PMU_COUNTERS && BIT(ret.value) & counter_mask_available)

Put () around the & operator. checkpatch should have pointed that out.

> +				read_fw_counter(i, ctrinfo);
>  		}
>  	}
>  
> -- 
> 2.34.1
>

Thanks,
drew

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
