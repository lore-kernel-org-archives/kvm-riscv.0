Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 511931125857
	for <kvm-riscv@archiver.kernel.org>; Wed, 11 Mar 2026 16:57:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+nVbzAavv0nSb2LgUFeWHWOWVeq1C7lowKAiCdtzEm4=; b=2fhGyrQMJNB00M
	m2SqlhEup8IewOrYe3TXJzz/UWJYf1dlyyEwhH020Z+oBg5pAvAB7cUut6M9Dh7M0r14wFDIqa7Tl
	3GQXGcS7SSej1xQZp5wVarIy3HchAD4rc2E+IFYvCUoBjcUDmGXhzPeKZs+pi3v7Ul5+cPZKIDb35
	oOgtoo/VbdhHUL70Cpz3swt7uAQANwmcKqcnuYqwyr3P10Q5BLBCvFKbOLQId+5TuGn5y5vI7NJTm
	6TheHFW8dXmnmbXPebrZikszpYUdquu9m/79/VCK294JKtRQSQTMu9uTD4BatP1CRgfLeK9JaFM2H
	IQkFzERgtEYXguqSdXGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0Mro-0000000BxCo-47TW;
	Wed, 11 Mar 2026 16:57:04 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0Mrm-0000000BxC2-2Pa8
	for kvm-riscv@lists.infradead.org;
	Wed, 11 Mar 2026 16:57:03 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62BFoxeX350618
	for <kvm-riscv@lists.infradead.org>; Wed, 11 Mar 2026 16:57:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=h07YhZ15uUsR3D3PiadCrr4J
	bpjVd0QblfgbHENErsk=; b=p3Yax84VOMh7P/ITtyRHAt3LGt6bA01ccLDVjqBz
	dedYV2H7EfNj2LucW0F/6iH/FhJyyKkM+Rx7uGL7JBMlwCY+EvfR3VNptNwurhJf
	MzNOWTs28fPMTBGiT7l3uCutFRcXlC/p7R0XUefyqGq62RlszlcY/Kx6RNdQjWES
	825hbuHJGwHW5sEFiWAAxkNlz6EUBJxrvT9LqfkWBJ765oAXYMEEUA1PlGWcNmIZ
	KKwraVC23Sf5ZEI6crTiMicVuGTI2e5QbnwhvvK0KbPBM6DO3E/eQ2NTVM/QtY5D
	r1UfbAegAsJ0LOgQ7IOQMbDIZtUkuphG+nm8aIazTS1v8w==
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com [209.85.210.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cubd6g8f4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <kvm-riscv@lists.infradead.org>; Wed, 11 Mar 2026 16:57:01 +0000 (GMT)
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-7d74533e53dso1153843a34.1
        for <kvm-riscv@lists.infradead.org>; Wed, 11 Mar 2026 09:57:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773248221; x=1773853021; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=h07YhZ15uUsR3D3PiadCrr4JbpjVd0QblfgbHENErsk=;
        b=G9iPyOa6UY+EE4msVk3kluUEyhjPDhkexvGU605hAgZFVsJOEZD6AU+UFpTorUMNqg
         FpYgG/wZFggIQcxjqdJUYwQTZUm9DsrEW9DytFD2MKRyApk57O1BmAvXZyh4cFNd+bWc
         mOeAnN7cZbXkWz8REf+Zu+DEJJmIoG2p0qAxKC/0D1nwbfwuECnbRAhVVG92WyAkQdzz
         v8aIeZ9MhNSI5M3FcPCvO3mxe7u+Tcr4CkDTqRY76O3o9C10Vrv54/oikvW6IrGITdRf
         DDYR/BjeMxi1Xv4ixCe4Kz+Imt/1mpqPW9GAOB3fudyF5SlzGYZO+7SNbRGqMT280zZk
         1X+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773248221; x=1773853021;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h07YhZ15uUsR3D3PiadCrr4JbpjVd0QblfgbHENErsk=;
        b=NRwAXu8TRVLkQSakI0KkqiGW6XBecQywgnZG7QBLFcRnFIun3NDizRMpG950xQgagR
         6RMroUGacJUllnwjOwWE2Ecr4FzB2L+cZXar48Y3Z9w1lvLyjm9VpDnO7hBTmi9/br7k
         QTaNwXDQY/5VYQLJJkl3KMYeYGJxZTyAK66N2Kz3m+YW4Q9a4zdl2a0lVybHnYbnYwYt
         wO32JH0Br9OroGPc8KYWxfyyXVF8ONzvZON8Htq0fAV4Nzm+dmVvQ6vqEIenSMkmoe/n
         0JtKRgrDp02OF6QW9d6Jjs9HFoFQMqO1vqHquztIXF/SQ4bkrIVbcjynlNrmeV7gMv2x
         yJ+Q==
X-Gm-Message-State: AOJu0YxG/h4N4h9S8rpkM4jPo3GqwWqxMmoDYHkm1IJ5RAFvljmTA83X
	NQO3P26IfV/idKtOa19dMtd65jH4EJAKz9I9CrwVCRA2dUUxTCMWWFV1ZVjv5eoX847mA7L3a73
	+OGScYsjv5o6UKmV6j5q4lwaA3ySUK+h5l3sNJkXH3odnTM0sWH0lAMBtQoE8mJLVbjtDNsgYag
	Xi
X-Gm-Gg: ATEYQzzXCZWtcF0PjAOXFlx9Qu/nxyOuWZi19TttrSjct/HCL4rl4bfddbVUcWnv6D4
	DqC0VHD+KuM5AwX0JIYgnge+qLA6cmL8XyIMlUpGpqtV7z87yL7L9ClJKR4OCr242eJARXqDoIi
	d3m8bT4S0d+7mDOjzsBBqmgLq4dBfsHyHiBF7J0yQIE6WaSIZkeTx8rCELDOdREj/vIlin0Lieb
	V7uwTpCAfr4B194TqsyxNCm7XgRcRpmz/iSUJlNqHHzbm0X4bECHB/Dce4V9IfvyloDxgqdkD4h
	gpdKQi0s71/A0tBB9CNwxmwMtfP5waKZRQBIkXL6JD5XzwSLh/5uOsrKXlMj8wELbElsCuwgIsS
	1vZ9EPw7I7abdhcae118R50XuY9W3CEI=
X-Received: by 2002:a05:6830:398a:b0:7d7:4f9d:54a7 with SMTP id 46e09a7af769-7d76a8bd730mr2414340a34.28.1773248220780;
        Wed, 11 Mar 2026 09:57:00 -0700 (PDT)
X-Received: by 2002:a05:6830:398a:b0:7d7:4f9d:54a7 with SMTP id 46e09a7af769-7d76a8bd730mr2414301a34.28.1773248220302;
        Wed, 11 Mar 2026 09:57:00 -0700 (PDT)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7d76ae3a18bsm2142694a34.18.2026.03.11.09.56.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 09:56:59 -0700 (PDT)
Date: Wed, 11 Mar 2026 11:56:59 -0500
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: Jiakai Xu <xujiakai2025@iscas.ac.cn>
Cc: kvm-riscv@lists.infradead.org, kvm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
        linux-riscv@lists.infradead.org, Albert Ou <aou@eecs.berkeley.edu>,
        Alexandre Ghiti <alex@ghiti.fr>,
        Andrew Jones <ajones@ventanamicro.com>,
        Anup Patel <anup@brainfault.org>, Atish Patra <atish.patra@linux.dev>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Paolo Bonzini <pbonzini@redhat.com>, Paul Walmsley <pjw@kernel.org>,
        Shuah Khan <shuah@kernel.org>, Jiakai Xu <jiakaiPeanut@gmail.com>
Subject: Re: [PATCH v3 2/2] RISC-V: KVM: selftests: Fix firmware counter read
 in sbi_pmu_test
Message-ID: <xno3pqjszessdrkjayjhtz44avckviidwg3orhgqzuj52gw37h@fjsvuvo6bji6>
References: <20260310055557.835531-1-xujiakai2025@iscas.ac.cn>
 <20260310055557.835531-3-xujiakai2025@iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260310055557.835531-3-xujiakai2025@iscas.ac.cn>
X-Authority-Analysis: v=2.4 cv=OvdCCi/t c=1 sm=1 tr=0 ts=69b19edd cx=c_pps
 a=7uPEO8VhqeOX8vTJ3z8K6Q==:117 a=cvcws7F5//HeuvjG1O1erQ==:17
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=VH6gc7BSxg5OAeS6WkMA:9 a=CjuIK1q_8ugA:10
 a=EXS-LbY8YePsIyqnH6vw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzExMDE0MyBTYWx0ZWRfX4WKX6RDeTzEz
 hlUCxb4pcirOnj8mp6pwko1vhFX8RMgF9FiODb9feFJVkb7tH4DAX3wlkKj08k3Nd7w9N2+x3IS
 cNvqHENLi17IFA4M4TTMPeuaXQds56sZZeax+Pcsm/2/w7/ZLoDzi0Q1pGY/twvt5Vws+3PPO8Q
 TdXIOY6rUpKiinqoChEsTcxOSgVADu3D1dN5m552onfepJBDtol4toxzKGlyxk8BZrivYl5/JQ1
 ybs/fxxToIdxw5qi9UP9x9CmIe+74O7wpzeoy4AI4ySL0R8HvQlIcm8SToY4UKmlW9X8dUy6mAG
 JIgar8aZh2/F7gqfwkbHdTwS6ZblQzfmLN17WOnLGE1KTL7gX1mb6Vt6nmsiR3bxb9pExqZ8v57
 5Mb6Z+QPvHwtFdueT+gbxHn4AqzBNfG5JjNPDsFaWJOpZQuMbgEaUm4YaU3fhofAxC/kjWYb7Wv
 ytDUMU4sV8hYEzxY6qA==
X-Proofpoint-GUID: SN9pY7weXpLuM_iSEuxXLn17CiTl2PH5
X-Proofpoint-ORIG-GUID: SN9pY7weXpLuM_iSEuxXLn17CiTl2PH5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-11_02,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 impostorscore=0
 phishscore=0 malwarescore=0 suspectscore=0 adultscore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603110143
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_095702_722781_9FBAC848 
X-CRM114-Status: GOOD (  26.24  )
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

On Tue, Mar 10, 2026 at 05:55:57AM +0000, Jiakai Xu wrote:
> The current sbi_pmu_test attempts to read firmware counters without
> configuring them first with SBI_EXT_PMU_COUNTER_CFG_MATCH.
> 
> Previously this did not fail because KVM incorrectly allowed the read
> and accessed fw_event[] with an out-of-bounds index when the counter
> was unconfigured. After fixing that bug, the read now correctly returns
> SBI_ERR_INVALID_PARAM, causing the selftest to fail.
> 
> Update the test to configure a firmware event before reading the
> counter. Also add a negative test to ensure that attempting to read an
> unconfigured firmware counter fails gracefully.
> 
> Signed-off-by: Jiakai Xu <xujiakai2025@iscas.ac.cn>
> Signed-off-by: Jiakai Xu <jiakaiPeanut@gmail.com>
> ---
> V2 -> V3:
> - Removed unnecessary BIT(ret.value) & counter_mask_available check.
> - Asserted ret.value == i after successful CFG_MATCH.
> - Fixed eidx construction in SBI_EXT_PMU_COUNTER_CFG_MATCH.
> ---
>  .../testing/selftests/kvm/include/riscv/sbi.h | 37 +++++++++++++++++++
>  .../selftests/kvm/riscv/sbi_pmu_test.c        | 20 +++++++++-
>  2 files changed, 56 insertions(+), 1 deletion(-)
> 
> diff --git a/tools/testing/selftests/kvm/include/riscv/sbi.h b/tools/testing/selftests/kvm/include/riscv/sbi.h
> index 046b432ae896..16f1815ac48f 100644
> --- a/tools/testing/selftests/kvm/include/riscv/sbi.h
> +++ b/tools/testing/selftests/kvm/include/riscv/sbi.h
> @@ -97,6 +97,43 @@ enum sbi_pmu_hw_generic_events_t {
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
> +/* SBI PMU event types */
> +enum sbi_pmu_event_type {
> +	SBI_PMU_EVENT_TYPE_HW = 0x0,
> +	SBI_PMU_EVENT_TYPE_CACHE = 0x1,
> +	SBI_PMU_EVENT_TYPE_RAW = 0x2,
> +	SBI_PMU_EVENT_TYPE_RAW_V2 = 0x3,
> +	SBI_PMU_EVENT_TYPE_FW = 0xf,
> +};
> +
>  /* SBI PMU counter types */
>  enum sbi_pmu_ctr_type {
>  	SBI_PMU_CTR_TYPE_HW = 0x0,
> diff --git a/tools/testing/selftests/kvm/riscv/sbi_pmu_test.c b/tools/testing/selftests/kvm/riscv/sbi_pmu_test.c
> index 924a335d2262..9404577e4ad5 100644
> --- a/tools/testing/selftests/kvm/riscv/sbi_pmu_test.c
> +++ b/tools/testing/selftests/kvm/riscv/sbi_pmu_test.c
> @@ -436,6 +436,7 @@ static void test_pmu_basic_sanity(void)
>  	struct sbiret ret;
>  	int num_counters = 0, i;
>  	union sbi_pmu_ctr_info ctrinfo;
> +	unsigned long fw_eidx;
>  
>  	probe = guest_sbi_probe_extension(SBI_EXT_PMU, &out_val);
>  	GUEST_ASSERT(probe && out_val == 1);
> @@ -461,7 +462,24 @@ static void test_pmu_basic_sanity(void)
>  			pmu_csr_read_num(ctrinfo.csr);
>  			GUEST_ASSERT(illegal_handler_invoked);
>  		} else if (ctrinfo.type == SBI_PMU_CTR_TYPE_FW) {
> -			read_fw_counter(i, ctrinfo);
> +			/* Read without configure should fail */
> +			ret = sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_COUNTER_FW_READ,
> +					i, 0, 0, 0, 0, 0);
> +			GUEST_ASSERT(ret.error == SBI_ERR_INVALID_PARAM);
> +
> +			/*
> +			 * Try to configure with a common firmware event.
> +			 * If configuration succeeds, verify we can read it.
> +			 */
> +			fw_eidx = ((unsigned long)SBI_PMU_EVENT_TYPE_FW << 16) |
> +					  SBI_PMU_FW_ACCESS_LOAD;
> +
> +			ret = sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_COUNTER_CFG_MATCH,
> +					i, 1, 0, fw_eidx, 0, 0);
> +			if (ret.error == 0) {
> +				GUEST_ASSERT(ret.value == i);
> +				read_fw_counter(i, ctrinfo);
> +			}
>  		}
>  	}
>  
> -- 
> 2.34.1
>

Reviewed-by: Andrew Jones <andrew.jones@oss.qualcomm.com>

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
