Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 755B0D73E80
	for <kvm-riscv@archiver.kernel.org>; Thu, 29 Jan 2026 17:40:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:To:Cc:
	Subject:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EL+yZbNyuGcQtaRsv4GV2eabJvz2S0c4+KAal3NiJIk=; b=JWnStTav1fRxtM
	a0L43N21Nvbh2rvX4OFlL/i9edUHRk4Anj8qXwvBUcmYTARwICJ/OfkH5Mr04YAKBXPxD2hWL1l18
	AZiiPY7WHn45ufqT/JPnazZaa7c/RxYd6eyEfl/oCAY45ghPq/taHk43uy+V3tTEtUdEvHsbFEZ23
	nU97V1GEkldMOBneNbpo0OTSsHRo+RvwzeQCXq0PlqTvh085lXaSsCR5x0XOLQyKKavvvFtO+G1EN
	AsNeK9OSVCn8s+M4HuZOUZPfPI25UTChGKlPVN6ue2jqNWRRElkdNxdgjFJZqm4bLUErzZFIFehy/
	L4LW8g/SQ0U8QWAQrN3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlW0H-00000000SON-0SgY;
	Thu, 29 Jan 2026 17:40:25 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlW0E-00000000SNE-136J
	for kvm-riscv@lists.infradead.org;
	Thu, 29 Jan 2026 17:40:23 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60THNxYG2953444
	for <kvm-riscv@lists.infradead.org>; Thu, 29 Jan 2026 17:40:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	X7MOImJj+nJlLfYhfSrfFXuD7mz/bcT1kMUBG+e2q/g=; b=f7V7Hx79jkuVVvVr
	I3cL1XQ68fPAOX24673vkTDdAOoC1EHZZgyJDUv495w0gl5j8bxtYrHw/jT1JpwH
	RRflRq295ifnjRKV1bKN7aMA+1rBb98hcmGsZFXJ+ymi8Ph7RXYB7J/KuNimU4AV
	ndEEeSl5h6ZWF+brJjlshuUN8pnRsl30aL19U1UNoSQf5jqQtw5LhpPi0Urj1+H9
	AFrFTZ4O1+3CiO7hOANxU/BuaxF03hJiXgSYSJRgzIypXdszXMMaWBS6K4Ef1Sv3
	Raie5SYbYv1mN6xTlOj9UPE8z760GiThwxWm0xIHuvgahfHQfOUsSgJbf9QDNFmw
	SHTLbA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c06421dbe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <kvm-riscv@lists.infradead.org>; Thu, 29 Jan 2026 17:40:21 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c6deddd7f7so317363485a.3
        for <kvm-riscv@lists.infradead.org>; Thu, 29 Jan 2026 09:40:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769708421; x=1770313221; darn=lists.infradead.org;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X7MOImJj+nJlLfYhfSrfFXuD7mz/bcT1kMUBG+e2q/g=;
        b=dxn1+0ym04RNTdSi5YopPi5+HWXBG3RbYi3F67FGabED1Sfe8sKOaf4J2LfqSF0/Jo
         2/fFq0h8BemrVkEB/xbQDWGzbmAxc0Qz9j1MYGTYL8BYqGsboU1bL6+kPzVnAye1UkJa
         Uql/jp9AL0RDTRnL13B/fvQ6QPzaQKwLecLrVSJ91gIw7/Yn8gQ2yiHdpA9wvII7VAWC
         Y0uO5t7Z2vOcDzNJL3G9j1h+MR1d86EQxw7mnRlIli1QEv/hEonwontbvPuFEzIQb4IW
         8ig2TjNzONuAMl2zI6qhUKhNX6LibevEt4fKhpfweABDNmGtIM2TI7IrohKtilEAo88z
         mQwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769708421; x=1770313221;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=X7MOImJj+nJlLfYhfSrfFXuD7mz/bcT1kMUBG+e2q/g=;
        b=tInUppHmjvSXYikSoRQeRJZ1nKnh+dwbr/l26SduY6HDIjg43XWb9z/o5aCDqTxekc
         m5nLsAv93QJoknBd1XqVMBxRrYzfNys364C1PvYaCkMTiSWUNB1B2xmYa7gaFRy2Jswu
         yaoUDwdGjdVI2bQrKF+4AqRUwOrjNmw5hX2REgKri4zrRoG3K/8+FdxNGqJQt6ec93HQ
         DtKrDYcwb8IgtqIpBC2KTS2yN4jBv4404EqGieBTTeZqICyL69ZbVNHKhNUG0TKnF3v4
         haVScogFc6kFGL/qy1hDrNGE/dhvZrCLJuEPICnMNyOTCvGPWECxdjwWuELZkFhTRHs5
         dpJA==
X-Forwarded-Encrypted: i=1; AJvYcCVZiwa/mvry9/KT6esvvoyCwKpmvMT0dsde82FzzNR98R16WStJLxs9jWdo8SlS2+ZM5kTe3bVbJ+Q=@lists.infradead.org
X-Gm-Message-State: AOJu0YzGQULRly+wSOVQjjOfVZyvqUTxDYWmoQ7XHa0NPE/fXhCbruSz
	ERKviLhViKR5u/WAiC3VVbOAkMiWX2z/7Qy/XbLDy9X9C+P+vPY/GYJ7Qvy/XB1O4zEv3hzHaey
	vNY1A+dt9dBQWabMVXPjmQ/wXHKWiIHW4SgvuFePvluA7PFbA/CfUOnyhUDE14f9npd2n
X-Gm-Gg: AZuq6aI9m1oUz5Oi3wg1o6LLFCMZQuSEGEMIu08j/c0qu3UFbRMa+r+j4JFqztyqF1B
	SVgognuunc74f59n4OwV6Ljk+vmU/BA4wTfuKuQakJjJgcf5+LyOtnGFfEOAh3MLTTt1EbqODzv
	VY/r+o8YuuG4UhzNNNsvBLGsnWzkgZYJgjuHf4rlCs7rtyTKKSyx09c32cvzt/6Rs56r3XiwRPh
	kxnD2gnl1mxeJxESIt4kVbobpq++luQ+0A1rxsRawDNYFlqmuklOZgAAfKM38cLsKmZkm5lFJVJ
	G/PYcUlcC8P8yTe/l68gToOAYeTyB0y3SaEjCYCgPz7WbekkEbpPXC7yjV7+weUq8/fvsNyeWsZ
	KzlX4U2iTGA/Ye6uslO+Cn+6EUV1OtSrHsNBxxtLA82xUe1qu
X-Received: by 2002:a05:620a:7103:b0:8c5:378f:4def with SMTP id af79cd13be357-8c9eb320122mr57575785a.77.1769708420658;
        Thu, 29 Jan 2026 09:40:20 -0800 (PST)
X-Received: by 2002:a05:620a:7103:b0:8c5:378f:4def with SMTP id af79cd13be357-8c9eb320122mr57568485a.77.1769708419892;
        Thu, 29 Jan 2026 09:40:19 -0800 (PST)
Received: from localhost (ip-86-49-253-11.bb.vodafone.cz. [86.49.253.11])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-480705956f1sm111648965e9.11.2026.01.29.09.40.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jan 2026 09:40:19 -0800 (PST)
Mime-Version: 1.0
Date: Thu, 29 Jan 2026 17:40:17 +0000
Message-Id: <DG199ZOUMRND.1RTVHMI6L9U5L@oss.qualcomm.com>
Subject: Re: [PATCH v3 2/2] RISC-V: KVM: add KVM_CAP_RISCV_SET_HGATP_MODE
Cc: <guoren@kernel.org>, <ajones@ventanamicro.com>,
        <kvm-riscv@lists.infradead.org>, <kvm@vger.kernel.org>,
        <linux-doc@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
To: <fangyu.yu@linux.alibaba.com>, <pbonzini@redhat.com>, <corbet@lwn.net>,
        <anup@brainfault.org>, <atish.patra@linux.dev>, <pjw@kernel.org>,
        <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <alex@ghiti.fr>,
        <andrew.jones@oss.qualcomm.com>
From: =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?=
 <radim.krcmar@oss.qualcomm.com>
References: <20260125150450.27068-1-fangyu.yu@linux.alibaba.com>
 <20260125150450.27068-3-fangyu.yu@linux.alibaba.com>
In-Reply-To: <20260125150450.27068-3-fangyu.yu@linux.alibaba.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI5MDEyNSBTYWx0ZWRfX8jjc6ziFpUFy
 wd2rbNfKNNuA02BjA9IGkhg7x0f96WDpXM7dRYwtyKJwxbE5LFNJk/sgJgEifWQsh2aWGd4i5eH
 KcyGh/x0bksdjnazdvjQvra4K7ylk2xFouOAS3Dzz55gTJ3z1s+hB4sdWwf8/YSPcm7hZHmyEy3
 Pxm+2YRm/89Y+sZ9RxK77TJMtEV0/tea47Qs6wjzpxFzjU81GtC4H1PESVU2X4wXavKZFXek80w
 ElJiC0ajFZx+Al8q+NcCbDTV6Cq65fgwST5EdpHqNJInGZtb45qu/5XbmHna/KhnKU5PG1gNSXq
 Vkw8Rqblsyt7uhcHMrrAcJ4V/7kU8mqkUAglAVk1bgrRHHKwYaP+tdZlPMSf7WnSldRwwkqOB0M
 Gykygb+8pGDi+Yly5D2bEUxbpVm7PAEDYpLFgG31urv6ixYkrxk2ECWWV8mNK8aYopDSz7HUETU
 SAxjzlU/lptqeTRRH5Q==
X-Proofpoint-GUID: JdEFquuFLIA6OUjEc9b3ATc2ERiyYN4p
X-Proofpoint-ORIG-GUID: JdEFquuFLIA6OUjEc9b3ATc2ERiyYN4p
X-Authority-Analysis: v=2.4 cv=dpTWylg4 c=1 sm=1 tr=0 ts=697b9b85 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=HFCiZzTCIv7qJCpyeE1rag==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=SRrdq9N9AAAA:8 a=Cpfndy8aBPzOrYTrbFgA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-29_02,2026-01-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 malwarescore=0 bulkscore=0 clxscore=1015
 spamscore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601290125
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260129_094022_714441_5CD9DA6D 
X-CRM114-Status: GOOD (  26.08  )
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

2026-01-25T23:04:50+08:00, <fangyu.yu@linux.alibaba.com>:
> From: Fangyu Yu <fangyu.yu@linux.alibaba.com>
>
> This capability allows userspace to explicitly select the HGATP mode
> for the VM. The selected mode must be less than or equal to the max
> HGATP mode supported by the hardware. This capability must be enabled
> before creating any vCPUs, and can only be set once per VM.
>
> Signed-off-by: Fangyu Yu <fangyu.yu@linux.alibaba.com>
> ---
>  Documentation/virt/kvm/api.rst | 18 ++++++++++++++++++
>  arch/riscv/kvm/vm.c            | 26 ++++++++++++++++++++++++--
>  include/uapi/linux/kvm.h       |  1 +
>  3 files changed, 43 insertions(+), 2 deletions(-)
>
> diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
> @@ -8765,6 +8765,24 @@ helpful if user space wants to emulate instructions which are not
> +7.47 KVM_CAP_RISCV_SET_HGATP_MODE
> +---------------------------------
> +
> +:Architectures: riscv
> +:Type: VM
> +:Parameters: args[0] contains the requested HGATP mode
> +:Returns:
> +  - 0 on success.
> +  - -EINVAL if args[0] is outside the range of HGATP modes supported by the
> +    hardware.
> +  - -EBUSY if vCPUs have already been created for the VM, if the VM has any
> +    non-empty memslots, or if the capability has already been set for the VM.
> +
> +This capability allows userspace to explicitly select the HGATP mode for
> +the VM. The selected mode must be less than or equal to the maximum HGATP
> +mode supported by the hardware.

"The selected mode must be supported by both KVM and hardware."

(The comparison is a technical detail, and incorrect too since the value
 is bouded from the bottom as well.)

>                                  This capability must be enabled before
> +creating any vCPUs, and can only be set once per VM.

                     ^ "or memslots"

> diff --git a/arch/riscv/kvm/vm.c b/arch/riscv/kvm/vm.c
> @@ -202,6 +202,9 @@ int kvm_vm_ioctl_check_extension(struct kvm *kvm, long ext)
>  	case KVM_CAP_VM_GPA_BITS:
>  		r = kvm_riscv_gstage_gpa_bits(&kvm->arch);
>  		break;
> +	case KVM_CAP_RISCV_SET_HGATP_MODE:
> +		r = IS_ENABLED(CONFIG_64BIT) ? 1 : 0;

Maybe we can return the currently selected mode for a bit of extra info?
Another nice option would be to return a bitmask of all supported modes.

I think userspace has otherwise no reason to call it, since it's fine to
just try enable and handle the -EINVAL as "don't care".
1 syscall instead of 2.

> @@ -212,12 +215,31 @@ int kvm_vm_ioctl_check_extension(struct kvm *kvm, long ext)
>  
>  int kvm_vm_ioctl_enable_cap(struct kvm *kvm, struct kvm_enable_cap *cap)
>  {
> +	case KVM_CAP_RISCV_SET_HGATP_MODE:
> +#ifdef CONFIG_64BIT
> +		if (cap->args[0] < HGATP_MODE_SV39X4 ||
> +		    cap->args[0] > kvm_riscv_gstage_mode(kvm_riscv_gstage_max_pgd_levels))
> +			return -EINVAL;
> +
> +		if (kvm->arch.gstage_mode_user_initialized || kvm->created_vcpus ||
> +		    !kvm_are_all_memslots_empty(kvm))
> +			return -EBUSY;
> +
> +		kvm->arch.gstage_mode_user_initialized = true;

No need to have gstage_mode_user_initialized, since if the user could
have changed it once, there shouldn't be an issue in changing it again.
It's the other protections that must work.

> +		kvm->arch.kvm_riscv_gstage_pgd_levels =
> +				3 + cap->args[0] - HGATP_MODE_SV39X4;
> +		kvm_debug("VM (vmid:%lu) using SV%lluX4 G-stage page table format\n",
> +			  kvm->arch.vmid.vmid,
> +			  39 + (cap->args[0] - HGATP_MODE_SV39X4) * 9);

(I don't think this debug message is going to be useful after a short
 debugging period, and it would clog the log on each VM launch, so I'd
 rather get rid of it.)

Thanks.

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
