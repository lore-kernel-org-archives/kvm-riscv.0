Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7099D6AAEC
	for <kvm-riscv@archiver.kernel.org>; Thu,  2 Apr 2026 18:27:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:Cc:Subject:
	From:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xIFiiiaC6uCTUpPKACzoBbJ7+7ITJE1pitZCb0B5S2Y=; b=IcnIfIS6sPiXdm
	qL59S8U4HQs8+Zp2hi5ZHzl0lQXPKqL2QH2Ig4kxb/ilxReaINMUwIXY1q8FdivX3oUuglETF5QZQ
	XQbPmAJvTCLZGKA4txkh1AhYu/acLb9lT1MMl5GuWIhhnmf3FibaEQB/x7OaxjTeF6Pi2L3qR5fKn
	T7IgCs/KoQJBos8ff0K1iiqNxv2q5Zo56KmFb7OdjoVtQj2QfOPAxTuXcerrrDVS8jBm6BRWak1LQ
	xpX7azgWz4pby+Bu7e2Cau4ciews6i0aNfB1BV0L8FHreteAc2e/JJSshCFqxLM9Dy3VA+2N1bgZ6
	I/5vqeIcCGxy9wr3Z3bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8Mla-00000000ebD-1uci;
	Thu, 02 Apr 2026 18:27:42 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8MlX-00000000ea5-1Bse
	for kvm-riscv@lists.infradead.org;
	Thu, 02 Apr 2026 18:27:40 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 632G4ZUF3485895
	for <kvm-riscv@lists.infradead.org>; Thu, 2 Apr 2026 18:27:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TU8QdhgxiCPZ6ep8IVIJN8LEHXfbUR2Kb96nB47jKKM=; b=lIx2EtkhreUt/UB8
	TcY4yytliO4NobIg6t5Web89r/EuGQJD0W+TOYbx/0zqiBGnYZhjcTYORLrFUcD0
	CQ22tk0nHZDuW6ArbPcr2JjmsgUZsP/FKJ1ch1dJN3nvxgiSYtSQP4qs3S23u5Li
	y5rxkGDmTD/JDnPxxbp1aPOxqHKGBZA/nzxnvEyDK9Uxzz94QYwWtvt1auGNQP9H
	gSSWo3Ph083pXVrIr7q8EkdHbX/vks9hqlkBzadws5X26MR+qekYnRchKF4/XgWN
	1yDMjOvziZ4/RyLbnZLN/57PySHYG+W7hbHSPHq0Uvy/7inQ6fTsrYCp0Z1Wxh8G
	+LGErA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d9heeub3d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <kvm-riscv@lists.infradead.org>; Thu, 02 Apr 2026 18:27:38 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50b323c43fdso24453131cf.2
        for <kvm-riscv@lists.infradead.org>; Thu, 02 Apr 2026 11:27:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775154458; x=1775759258; darn=lists.infradead.org;
        h=in-reply-to:references:to:cc:subject:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TU8QdhgxiCPZ6ep8IVIJN8LEHXfbUR2Kb96nB47jKKM=;
        b=Pzj5FWLGYRV4+QcvQHdHT3joX00v6SS8HYUQpCqERpT27Bed/VmIMXejTaZDbFgJ0k
         9j/hMTXK34qrpT2og3h9O6lbQZQqyTZrmYAhYzf7GEgqo+Lrrs2XFM6W9r+q/yYwm040
         yUAV1GBv4db4IWfFJznYjAtYdSl3cJVBTVB8aJJ1sdj0xivAyld1HwwH5zHgYrOmhqkQ
         qwQqfq3qnKxqhie/V0m/0VmDuAC1hE8anCltPQ8fS4kD9iwt4SRdPr23z3LmDeA41DxA
         Bcm5mrk2nkFqpUEHw4QEcOoAQbRic57b97XxclFzR3wWdouSKfpbrPvXLie2nK0UltRS
         syJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775154458; x=1775759258;
        h=in-reply-to:references:to:cc:subject:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TU8QdhgxiCPZ6ep8IVIJN8LEHXfbUR2Kb96nB47jKKM=;
        b=FqMZDdGu//NOZyGa5/yKZD8/fHcc030MOwDeTEQMVBH8pr4yXQEJZU5KMDQijZwWjP
         k9BuGA7Njl/E44WYSSMtDHPVC4y2LRYXg4wuQ9NQpWTQTBplsR/fbffmx8VCpPmpP6KX
         ySGY4x+Xw8wo4jh6kWNPYV3PeTG/Xs+VKXRe47Yj+PIZFsuDd/C7WJgUWWNwnwjV0051
         ITaDbgYJA41tWqfznLKoMGUka7HrBfxKbg1il25O7+hLreBX6Jo+G8mJ3ujLZ9hAtCb6
         mV18TLNH1o0G5m5CqFxd6WcYrujzR5twxh5V6f+773dR/rpbxMuh/PRvG/XQDj0SMyCa
         eCaA==
X-Forwarded-Encrypted: i=1; AJvYcCXS1OLe0VfL8pCy+cAmxK0rxbUmjg74NZloBhcGLNpAKLmrhxq5ObjfiULlBAp+DbscaDtEyz7WRww=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy0Kw6DowZj80mYrIKwFAy0633lr2i4ZprDRVEFb3MhYN1zIheU
	rbh3W0CmuYl2QRArahH+VeC3G55a/Flq/zvn1DP4lrbDpnoUwZpxbN86UJXf25xw0WTQ79aYApi
	MB9bkHIGWuKEQuqqfGMNQqYclD+dOsWVhfmNfETrnLokiOhoifZ0Rn5mxFP4R1NjnGJhH
X-Gm-Gg: ATEYQzyDfaGv/n8l+5nfvbOPCEvRNDeay/zn1fbmEV2b3pOH/uRMT4k1fGioGNSbdE3
	tyOEtySB66pTxoE5HQYUOqGqJGpJLtyhQASLBAhIG4z9mcsFDkfKRAEK/W8XMGQi8+b9Popzemb
	vh1Wq2ox5ZQ53GGXkCauGg75linkiVwpVrsPKKYFGJlhAfyxZsKC2a3Ixg8jqECqwh/oqvCvEj1
	qTuLjxzGjTqBLdmsbvaTx8QVx4FlpNBgFVM74/FABMX84W2NawiSqqPdkIVTObkVDMPuWLt2v8c
	Bhz/X/ywqYzpU6qb2uPJ/1cvyHqLBdXjrLYhfOj8aPZJ3AhWhvlFQF2GoqSNaNUy18x0sCGZnyL
	NcbOJXuJo/GGqbV7MUrHFaijb3Zv1RF7FadmoTDtTp7TTcj4wEZWjjMheVJLY
X-Received: by 2002:a05:622a:790c:b0:509:15d8:2c0a with SMTP id d75a77b69052e-50d62a8e346mr5227601cf.32.1775154457633;
        Thu, 02 Apr 2026 11:27:37 -0700 (PDT)
X-Received: by 2002:a05:622a:790c:b0:509:15d8:2c0a with SMTP id d75a77b69052e-50d62a8e346mr5227311cf.32.1775154457216;
        Thu, 02 Apr 2026 11:27:37 -0700 (PDT)
Received: from localhost (ip-86-49-249-15.bb.vodafone.cz. [86.49.249.15])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9c3cff128bsm116569366b.53.2026.04.02.11.27.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 11:27:36 -0700 (PDT)
Mime-Version: 1.0
Date: Thu, 02 Apr 2026 20:27:33 +0200
Message-Id: <DHIVQI1DY4MK.27YZ2NPDXF5WM@oss.qualcomm.com>
From: =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?=
 <radim.krcmar@oss.qualcomm.com>
Subject: Re: [PATCH v7 4/4] RISC-V: KVM: add KVM_CAP_RISCV_SET_HGATP_MODE
Cc: <guoren@kernel.org>, <andrew.jones@oss.qualcomm.com>,
        <linux-doc@vger.kernel.org>, <kvm@vger.kernel.org>,
        <kvm-riscv@lists.infradead.org>, <linux-riscv@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
To: <fangyu.yu@linux.alibaba.com>, <pbonzini@redhat.com>, <corbet@lwn.net>,
        <anup@brainfault.org>, <atish.patra@linux.dev>, <pjw@kernel.org>,
        <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <alex@ghiti.fr>,
        <skhan@linuxfoundation.org>
References: <20260402132303.6252-1-fangyu.yu@linux.alibaba.com>
 <20260402132303.6252-5-fangyu.yu@linux.alibaba.com>
In-Reply-To: <20260402132303.6252-5-fangyu.yu@linux.alibaba.com>
X-Proofpoint-ORIG-GUID: XZ_hcbuMw-b4anWEROAm1J54geGlEGQK
X-Authority-Analysis: v=2.4 cv=VY36/Vp9 c=1 sm=1 tr=0 ts=69ceb51a cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=fuErIE+P63Icv3tqjtEZBw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=SRrdq9N9AAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=YvLePRtRmKwuc7oy_z8A:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: XZ_hcbuMw-b4anWEROAm1J54geGlEGQK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAyMDE2NSBTYWx0ZWRfX2AHy69pMxgOf
 4WyEVnlGX2WITGituXQxOnPc5wnAkI/XvcFqBkEE6ZryF0nFFSSX7DJZq7qPKJTu9imsBeWakdC
 lVbFUICdp5TGSxehXIHxEXnq2pWGG7zhgGWKysfxhIHVFCKhgCNAC9z1zPWx2Y9KbaIStSzspeY
 DyNDon0ziiqDbT688svCdCI1jY0AJ4re6a9MB6ZzVmw2vDAso6Z6MHdZwbYR9ixpq9YbDibEYOb
 rbBk8OD52Ko23pBgwM4Qd5S6IgrgP3p0C55DK+lBQXD6sAZaZF/F3zWhQptJvlyB+fmr3+bezs8
 lfA7Xea5QDuHtXDJf+lf9qoiqKpk7ZTrXItdiRjWxLI9s998UFByIV92v0u4InzB8mAgrK9G6HA
 /n//QDqPevDHlbgcHLzYIeTjlZek3ClrOs9G9ueXTHpSc+iO4cajLnksPTqkZa2/qYMcETIWSwJ
 dbnj/6SbmrYwmgaEUVQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-02_03,2026-04-02_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 spamscore=0 adultscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604020165
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260402_112739_357693_AF24E92C 
X-CRM114-Status: GOOD (  13.03  )
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

2026-04-02T21:23:03+08:00, <fangyu.yu@linux.alibaba.com>:
> From: Fangyu Yu <fangyu.yu@linux.alibaba.com>
>
> Add a VM capability that allows userspace to select the G-stage page table
> format by setting HGATP.MODE on a per-VM basis.
>
> Userspace enables the capability via KVM_ENABLE_CAP, passing the requested
> HGATP.MODE in args[0]. The request is rejected with -EINVAL if the mode is
> not supported by the host, and with -EBUSY if the VM has already been
> committed (e.g. vCPUs have been created or any memslot is populated).
>
> KVM_CHECK_EXTENSION(KVM_CAP_RISCV_SET_HGATP_MODE) returns a bitmask of the
> HGATP.MODE formats supported by the host.
>
> Signed-off-by: Fangyu Yu <fangyu.yu@linux.alibaba.com>
> Reviewed-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
> Reviewed-by: Guo Ren <guoren@kernel.org>
> ---
> diff --git a/arch/riscv/kvm/vm.c b/arch/riscv/kvm/vm.c
> @@ -211,12 +214,23 @@ int kvm_vm_ioctl_check_extension(struct kvm *kvm, long ext)
>  
>  int kvm_vm_ioctl_enable_cap(struct kvm *kvm, struct kvm_enable_cap *cap)
>  {
> +	case KVM_CAP_RISCV_SET_HGATP_MODE:
> +		if (!kvm_riscv_hgatp_mode_is_valid(cap->args[0]))
> +			return -EINVAL;
> +
> +		if (kvm->created_vcpus || !kvm_are_all_memslots_empty(kvm))
> +			return -EBUSY;

Since multiple VM ioctls can execute concurrently, I would protect
created_vcpus by kvm->lock and kvm_are_all_memslots_empty by
kvm->slots_lock.

Thanks.

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
