Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F233F4BB93
	for <kvm-riscv@archiver.kernel.org>; Tue, 24 Feb 2026 22:11:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lx2EQ4CZHc2p1psx6yflMoyr5vPiP8Jrf4LebEcW64M=; b=0J9VXCAA0ug2j9
	wm+0K2uNv2d6NUu9c1x8bfVPwIUj/Ia+7JMnh2lmKLuxMvxtZaJ9B0uXLgBhfCmc8SFVTUJqTa+Kd
	lFMdlmdljNfpXc+JfiHqLUgyfzTYY+SEl4/Qo0lr+iIomQwub0pEIGi/0FakkJKN4SSoVgN88k4wG
	/WuA2aNIH4oo9GFPVZR7VzaV/B0CmGGs5eR14BebRp1ATSFoRytsYeFCgQ2nK5UzMznd04+ab9teK
	rJzMq5u1Yehk7Gw4BQvhqEgnH85pCy/uwaGWA1yVKGPrYOMDozb3hqIxUAqBV66Rh3RT0uu8baho9
	go+Uy7liP0Fe/WemwRMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vv0ch-00000002qTK-2fdw;
	Tue, 24 Feb 2026 22:11:19 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vv0ce-00000002qSZ-2zVd
	for kvm-riscv@lists.infradead.org;
	Tue, 24 Feb 2026 22:11:17 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61OHjjb9057144
	for <kvm-riscv@lists.infradead.org>; Tue, 24 Feb 2026 22:11:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=MpuMHOd/Hug9XUMO7ooIdgJu
	G+bQRgf3rD7wfYuWTIk=; b=RNBG68nOWtnkct3pLRXTzFwfqNxyv6vii0G7syYk
	Gc23n86pTdRvIWxNUEXvkzXkaElzJNwoVgMVMtZxbx/E/NeGYlgOznoziDx4Sa5w
	zUpAVvy1V9/L9vWn9jzWTQt1Z5pFvztLL6/hc/IIFpqjXXBbKgy8WkfMO0Ng077J
	5vX35Q9PL64/QejwiMXAGeocTONi4cpet6wS+cGKiaZtO5IxeMhaipCXReiEFTJx
	P4VwUh1HghI7bHRP9SxSPgez2JoRwR9VjBi1gvTlNQN9ahpCvRx52lOTgIGwDqky
	fvdWqraP3OWQbGkde2q56uMrrp4NJNllkbJvo2LiZzeNnQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ch9saacjg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <kvm-riscv@lists.infradead.org>; Tue, 24 Feb 2026 22:11:15 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-2ba9f033a5bso53644336eec.0
        for <kvm-riscv@lists.infradead.org>; Tue, 24 Feb 2026 14:11:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771971075; x=1772575875; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MpuMHOd/Hug9XUMO7ooIdgJuG+bQRgf3rD7wfYuWTIk=;
        b=fzVec7s1RM/06FRuDMJvrsMHBmekrBhzC88f8NZjSq7cDnuT/YsAbMiPaqV5oJACg2
         iku1ZnsA1q1R0P/knymMYKAgwhlKQ9qLaX0c2Ot0yxmfK6Ew1tgF9/rlo+2nDR2O2e/t
         sSCS2RIvr24AVdPmonCwMi0eSFJAECEFyI+kIHA3GTZgc2vVCR2W5r9MQ1YbDMB0ZlLs
         3fAS55aloycIu0VXWlS3q3pxY1jX7ysP428b44J12PBuZEPFVo/UBYFUYDNz5tQLDMPW
         t1m+eIS/3vpv0MYm4kjeN9b/gCj5o416E7pIpEsQPD35/TGR0tf8q+jgtATvVte+dNW6
         IshQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771971075; x=1772575875;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MpuMHOd/Hug9XUMO7ooIdgJuG+bQRgf3rD7wfYuWTIk=;
        b=BNfCCh0681ZI8kAlQIOUMdoGNfXWfWtIsqtAciIUkG2KcrfYFqlIG94lJi8ZyR0kis
         TroB9K37q2Jdsdbt33CSjxpfyhtcm2245COi4qZ6ufRyyrW7LegUWeHnvUa5Is/x3pxE
         bdDZ1d7NsvoG21/yjUc/fN/y/1CiPmQMh2+fcRsNDnSf+pw4C5LsdI76ml4vFdNPfM4w
         aPzDbW71oL+7bqrzM6b8B81avbyP5YrczYx9Z4Z0dJLHnjSLTYzUqlGo43p+J/mfblf6
         TwfCaF4R0GW1rRtLjBSbQJ0P8ilC+vtv9UyjayqjQqh+fjE8ZYGvXERdt+sK73Joun+m
         ntdg==
X-Forwarded-Encrypted: i=1; AJvYcCUsEhwnGqz9QOjOv/9/Har3lbVUBSK37SGSUgtgWkV5LNMTbQGQ4Zwt5Z5aNOY7L7RQNB3NMeeGCnA=@lists.infradead.org
X-Gm-Message-State: AOJu0YxFCCx+bWsgz9a2SqZFI0G5CbZEZKUH/yUQi30kbh7QJOSj0wnY
	Tt6JaVk2zDB1tW7fLpGvWAYlNdmb5h0ECcIpu0/8d9ge2ifTZ9NAu8iOp4MW+yOiWvlRAHJZ828
	JGREMZXGRZO3vd5h55GJuIOBKCda0yXqiHj+x70BntotpQ6+e9BuwOTZs9PVAp7jUSek1
X-Gm-Gg: ATEYQzyejXkdO8I6nZ2pDTm0kjufv8oP+xMze2KM36DDTDwjEVcnmmGNLi06lCKzr81
	YBqAmxnbj4Z3PX2GkgzR6opKExFzuheTRrmOtcrnEGddRVHjrzf5WGd2JwLyo9iBkSLg7IzTkn0
	c4sb/ntB0aQFEQKS81SFV7qtxU7xa6rN8/JnDCh3BMrOg6sUR5kjw0drY58RjGksk4kBWxGh19f
	hl3MgV1MneeN0I/zFh53+8rSF5AVdO+5bIoMOFmQgZzsxZ4IJjhXKl2CPRz1HtH0Y2c0SD6hGWu
	ttpKQZjScOJJH+Coov++UyuMt398L7s9jzDi9NcBkRdail+YQEVEZEN53e4EHxgN5WniQVF8H7D
	OCKIEhwhPiAw5vhxsthc/7zfeYcCOJ7c=
X-Received: by 2002:a05:7301:9bc5:b0:2ba:a0c6:ef5d with SMTP id 5a478bee46e88-2bd7bd2a538mr5920114eec.21.1771971075062;
        Tue, 24 Feb 2026 14:11:15 -0800 (PST)
X-Received: by 2002:a05:7301:9bc5:b0:2ba:a0c6:ef5d with SMTP id 5a478bee46e88-2bd7bd2a538mr5920085eec.21.1771971074444;
        Tue, 24 Feb 2026 14:11:14 -0800 (PST)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2bd7da47778sm7770942eec.6.2026.02.24.14.11.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 14:11:13 -0800 (PST)
Date: Tue, 24 Feb 2026 16:11:11 -0600
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
Subject: Re: [PATCH v7 2/3] KVM: selftests: Refactor UAPI tests into
 dedicated function
Message-ID: <bo356uh554twpg2jateqth7rqi7g6uoc26kao3yekcukitg6wc@eeyd2qdjpgff>
References: <20260213103557.3207335-1-xujiakai2025@iscas.ac.cn>
 <20260213103557.3207335-3-xujiakai2025@iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260213103557.3207335-3-xujiakai2025@iscas.ac.cn>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI0MDE5NCBTYWx0ZWRfX1dIiJaeOsUut
 XLXyN/8lwEHYsgNm7QN3VOHTz52yR54m/gRVLHt15d2IpcQ2c8/T1vADmKtZBEIHnn6I+Kg22PF
 2UKIhO6GctjsHGkoJHvJvFk30e7V8nomGSSUAF26Bv7y0okcIxDcNPhDaK2JnPm9g7ybAFeEqfs
 APTKFysKthquM4Vl2/fgDLWeDTkhSyLVFTU1iKttmn0So+DlkgEMGG3Rtyn+zhYE1/MWcYxfQ5k
 jhifYCaGaYeD3RCmpFjQTdlvHXFoAOsxQ2EmmD37HeiHd8mIqnw44kz3cVB+Qckqgadx5z8GoZz
 oTt1VJ9wq1uQyMb1aMF94e32quEuji1wt+mOk/ksVcOUGVfrcxExj4KQ/TbJf7aHVkYQEkcz3q9
 mGmNnSDyMZG9LUnR+fADFyZd3ZFCJP/FFcAc0PCXSPeR2gZxiUGoS0VFCZ1qsdzm2ncaxkYavuY
 G1nK/yVDEfxvIGLitVQ==
X-Proofpoint-ORIG-GUID: 6m1AdfAT4BJmN54xRQU4x7jDenoWaotu
X-Authority-Analysis: v=2.4 cv=e7ELiKp/ c=1 sm=1 tr=0 ts=699e2203 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=cvcws7F5//HeuvjG1O1erQ==:17
 a=kj9zAlcOel0A:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=HySIa_1SWE6k9wrxFvsA:9 a=CjuIK1q_8ugA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: 6m1AdfAT4BJmN54xRQU4x7jDenoWaotu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-24_03,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 adultscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602240194
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260224_141116_785740_878CBCBB 
X-CRM114-Status: GOOD (  30.56  )
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

On Fri, Feb 13, 2026 at 10:35:56AM +0000, Jiakai Xu wrote:
> Move steal time UAPI tests from steal_time_init() into a separate
> check_steal_time_uapi() function for better code organization and
> maintainability.
> 
> Previously, x86 and ARM64 architectures performed UAPI validation
> tests within steal_time_init(), mixing initialization logic with
> uapi tests.
> 
> Changes by architecture:
> x86_64:
>   - Extract MSR reserved bits test from steal_time_init()
>   - Move to check_steal_time_uapi() which tests that setting
>     MSR_KVM_STEAL_TIME with KVM_STEAL_RESERVED_MASK fails
> ARM64:
>   - Extract three UAPI tests from steal_time_init():
>     	Device attribute support check
>     	Misaligned IPA rejection (EINVAL)
>     	Duplicate IPA setting rejection (EEXIST)
>   - Move all tests to check_steal_time_uapi()
> RISC-V:
>   - Add empty check_steal_time_uapi() stub for future use
>   - No changes to steal_time_init() (had no tests to extract)
> 
> The new check_steal_time_uapi() function:
>   - Is called once before the per-VCPU test loop
> 
> No functional change intended.
> 

Suggested-by: Andrew Jones <andrew.jones@oss.qualcomm.com>

> Signed-off-by: Jiakai Xu <xujiakai2025@iscas.ac.cn>
> Signed-off-by: Jiakai Xu <jiakaiPeanut@gmail.com>
> ---
>  tools/testing/selftests/kvm/steal_time.c | 63 ++++++++++++++++++------
>  1 file changed, 47 insertions(+), 16 deletions(-)
> 
> diff --git a/tools/testing/selftests/kvm/steal_time.c b/tools/testing/selftests/kvm/steal_time.c
> index 8edc1fca345ba..a814f6f3f8b41 100644
> --- a/tools/testing/selftests/kvm/steal_time.c
> +++ b/tools/testing/selftests/kvm/steal_time.c
> @@ -69,16 +69,10 @@ static bool is_steal_time_supported(struct kvm_vcpu *vcpu)
>  
>  static void steal_time_init(struct kvm_vcpu *vcpu, uint32_t i)
>  {
> -	int ret;
> -
>  	/* ST_GPA_BASE is identity mapped */
>  	st_gva[i] = (void *)(ST_GPA_BASE + i * STEAL_TIME_SIZE);
>  	sync_global_to_guest(vcpu->vm, st_gva[i]);
>  
> -	ret = _vcpu_set_msr(vcpu, MSR_KVM_STEAL_TIME,
> -			    (ulong)st_gva[i] | KVM_STEAL_RESERVED_MASK);
> -	TEST_ASSERT(ret == 0, "Bad GPA didn't fail");
> -
>  	vcpu_set_msr(vcpu, MSR_KVM_STEAL_TIME, (ulong)st_gva[i] | KVM_MSR_ENABLED);
>  }
>  
> @@ -99,6 +93,18 @@ static void steal_time_dump(struct kvm_vm *vm, uint32_t vcpu_idx)
>  			st->pad[8], st->pad[9], st->pad[10]);
>  }
>  
> +static void check_steal_time_uapi(struct kvm_vcpu *vcpu)
> +{
> +	int ret;
> +
> +	st_gva[0] = (void *)(ST_GPA_BASE);
> +	sync_global_to_guest(vcpu->vm, st_gva[0]);

No need to use st_gva[] and sync_global_to_guest(). For this test we can
just use ST_GPA_BASE directly.

> +
> +	ret = _vcpu_set_msr(vcpu, MSR_KVM_STEAL_TIME,
> +			    (ulong)st_gva[0] | KVM_STEAL_RESERVED_MASK);
> +	TEST_ASSERT(ret == 0, "Bad GPA didn't fail");
> +}
> +
>  #elif defined(__aarch64__)
>  
>  /* PV_TIME_ST must have 64-byte alignment */
> @@ -170,7 +176,6 @@ static void steal_time_init(struct kvm_vcpu *vcpu, uint32_t i)
>  {
>  	struct kvm_vm *vm = vcpu->vm;
>  	uint64_t st_ipa;
> -	int ret;
>  
>  	struct kvm_device_attr dev = {
>  		.group = KVM_ARM_VCPU_PVTIME_CTRL,
> @@ -178,21 +183,12 @@ static void steal_time_init(struct kvm_vcpu *vcpu, uint32_t i)
>  		.addr = (uint64_t)&st_ipa,
>  	};
>  
> -	vcpu_ioctl(vcpu, KVM_HAS_DEVICE_ATTR, &dev);
> -
>  	/* ST_GPA_BASE is identity mapped */
>  	st_gva[i] = (void *)(ST_GPA_BASE + i * STEAL_TIME_SIZE);
>  	sync_global_to_guest(vm, st_gva[i]);
>  
> -	st_ipa = (ulong)st_gva[i] | 1;
> -	ret = __vcpu_ioctl(vcpu, KVM_SET_DEVICE_ATTR, &dev);
> -	TEST_ASSERT(ret == -1 && errno == EINVAL, "Bad IPA didn't report EINVAL");
> -
>  	st_ipa = (ulong)st_gva[i];
>  	vcpu_ioctl(vcpu, KVM_SET_DEVICE_ATTR, &dev);
> -
> -	ret = __vcpu_ioctl(vcpu, KVM_SET_DEVICE_ATTR, &dev);
> -	TEST_ASSERT(ret == -1 && errno == EEXIST, "Set IPA twice without EEXIST");
>  }
>  
>  static void steal_time_dump(struct kvm_vm *vm, uint32_t vcpu_idx)
> @@ -205,6 +201,34 @@ static void steal_time_dump(struct kvm_vm *vm, uint32_t vcpu_idx)
>  	ksft_print_msg("    st_time: %ld\n", st->st_time);
>  }
>  
> +static void check_steal_time_uapi(struct kvm_vcpu *vcpu)
> +{
> +	struct kvm_vm *vm = vcpu->vm;
> +	uint64_t st_ipa;
> +	int ret;
> +
> +	struct kvm_device_attr dev = {
> +		.group = KVM_ARM_VCPU_PVTIME_CTRL,
> +		.attr = KVM_ARM_VCPU_PVTIME_IPA,
> +		.addr = (uint64_t)&st_ipa,
> +	};
> +
> +	vcpu_ioctl(vcpu, KVM_HAS_DEVICE_ATTR, &dev);
> +
> +	st_gva[0] = (void *)(ST_GPA_BASE);
> +	sync_global_to_guest(vm, st_gva[0]);

Same comment as above.

> +
> +	st_ipa = (ulong)st_gva[0] | 1;
> +	ret = __vcpu_ioctl(vcpu, KVM_SET_DEVICE_ATTR, &dev);
> +	TEST_ASSERT(ret == -1 && errno == EINVAL, "Bad IPA didn't report EINVAL");
> +
> +	st_ipa = (ulong)st_gva[0];
> +	vcpu_ioctl(vcpu, KVM_SET_DEVICE_ATTR, &dev);
> +
> +	ret = __vcpu_ioctl(vcpu, KVM_SET_DEVICE_ATTR, &dev);
> +	TEST_ASSERT(ret == -1 && errno == EEXIST, "Set IPA twice without EEXIST");
> +}

Hmm... don't we now fail with EEXIST in arm64's steal_time_init() for i=0 ?
I think the only way to avoid it is to create a temporary vcpu for the uapi
tests which gets thrown away before creating the vcpus for the steal time
tests.

> +
>  #elif defined(__riscv)
>  
>  /* SBI STA shmem must have 64-byte alignment */
> @@ -301,6 +325,11 @@ static void steal_time_dump(struct kvm_vm *vm, uint32_t vcpu_idx)
>  	pr_info("\n");
>  }
>  
> +static void check_steal_time_uapi(struct kvm_vcpu *vcpu)
> +{
> +	/* RISC-V UAPI tests will be added in a subsequent patch */

nit: no need for this comment.

> +}
> +
>  #endif
>  
>  static void *do_steal_time(void *arg)
> @@ -369,6 +398,8 @@ int main(int ac, char **av)
>  	TEST_REQUIRE(is_steal_time_supported(vcpus[0]));
>  	ksft_set_plan(NR_VCPUS);
>  
> +	check_steal_time_uapi(vcpus[0]);
> +
>  	/* Run test on each VCPU */
>  	for (i = 0; i < NR_VCPUS; ++i) {
>  		steal_time_init(vcpus[i], i);
> -- 
> 2.34.1
>

Thanks,
drew

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
