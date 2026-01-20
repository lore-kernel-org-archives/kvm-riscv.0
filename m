Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97E57D2ECE9
	for <kvm-riscv@archiver.kernel.org>; Tue, 20 Jan 2026 14:22:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BDG2wiczFpnZUAr7q3OwE2/KAbxt1VpvqUDiczW11P4=; b=qS38VYCS1sCu3G
	vxng9FRVNPflzQPVwhv5jeOkw+FTK+umLy+bNqB7u+1TonVpXWeGggr7VCvz9yFs1MtzaJhtRAbYp
	n0aXD1GeCUBK0PSoJAdKvyKlXZtecjQ0SovHcLnLc40ukdEe+pqcmVpHroqAwi+iqDgCphFnX3rWo
	gDmCe2qVqJlvENbXjFNqQUug4UpIWSrDQs9Ex2I+O2/DhnJ2czy75TXZ7v0Uufv+mkaG/Z6QR9JG8
	70XTojWKuPmPn2p32hBFbIARFEIR5MRiHmsqUku3gAsGi455zamSznV3qZttnsgBv4pmXeO5D8G5U
	1MBok+h0qjwGaUHsWhYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viCd0-00000003yCL-2j8U;
	Tue, 20 Jan 2026 14:22:42 +0000
Received: from out30-113.freemail.mail.aliyun.com ([115.124.30.113])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viCcv-00000003yA0-45kT;
	Tue, 20 Jan 2026 14:22:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1768918947; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=wD/viQYhsRUrgX+bgboJYmyufn5Ii5TsHLlk29tx4N4=;
	b=bwnHFPtUJkgZ+T3zM3woukFmEqow+D9rfcsKqQconRenbIavgyAVXRKXpcOOX7HIHjSeLVp3FgCJeysxcFUoIqS61Qgqy5lJ4exE05FQ3xbzIymU+ZQzwDeg7lXgi1QHRiPc9fw6Hw5Oe6NzF4782oNJ6E8jp6y817JJRe4Semw=
Received: from localhost.localdomain(mailfrom:fangyu.yu@linux.alibaba.com fp:SMTPD_---0WxUjVe1_1768918934 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 20 Jan 2026 22:22:16 +0800
From: fangyu.yu@linux.alibaba.com
To: andrew.jones@oss.qualcomm.com
Cc: ajones@ventanamicro.com,
	alex@ghiti.fr,
	anup@brainfault.org,
	aou@eecs.berkeley.edu,
	atish.patra@linux.dev,
	corbet@lwn.net,
	fangyu.yu@linux.alibaba.com,
	guoren@kernel.org,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	pbonzini@redhat.com,
	pjw@kernel.org,
	rkrcmar@ventanamicro.com
Subject: Re: Re: [PATCH v2] RISC-V: KVM: add KVM_CAP_RISCV_SET_HGATP_MODE
Date: Tue, 20 Jan 2026 22:22:10 +0800
Message-Id: <20260120142210.9891-1-fangyu.yu@linux.alibaba.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <6txqxrkyqh4afmked4hdi6qekkqrb54ar3q5upz3ennnuaktsi@dtoarqt7e26t>
References: <6txqxrkyqh4afmked4hdi6qekkqrb54ar3q5upz3ennnuaktsi@dtoarqt7e26t>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_062238_947765_7BC49E8E 
X-CRM114-Status: UNSURE (   9.78  )
X-CRM114-Notice: Please train this message.
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

>...
>> +	case KVM_CAP_RISCV_SET_HGATP_MODE:
>> +#ifdef CONFIG_64BIT
>> +		if (cap->args[0] < HGATP_MODE_SV39X4 ||
>> +			cap->args[0] > kvm_riscv_gstage_max_mode)
>> +			return -EINVAL;
>> +		if (kvm->arch.gstage_mode_initialized)
>> +			return 0;
>> +		kvm->arch.gstage_mode_initialized = true;
>> +		kvm->arch.kvm_riscv_gstage_mode = cap->args[0];
>> +		kvm->arch.kvm_riscv_gstage_pgd_levels = 3 +
>> +		    kvm->arch.kvm_riscv_gstage_mode - HGATP_MODE_SV39X4;
>> +		kvm_info("using SV%lluX4 G-stage page table format\n",
>> +			39 + (cap->args[0] - HGATP_MODE_SV39X4) * 9);
>
>I don't think we want this kvm_info line, particularly if it doesn't also
>include a VM ID in some form to allow readers to know which VM is using
>the selected format. Let's either drop it or change it to kvm_debug and
>include a VM ID.

Agreed, I will switch it to kvm_debug() and include a VM ID.

>
>Thanks,
>drew
>
>> +#endif
>> +		return 0;
>>  	default:
>>  		return -EINVAL;
>>  	}
>> diff --git a/include/uapi/linux/kvm.h b/include/uapi/linux/kvm.h
>> index dddb781b0507..00c02a880518 100644
>> --- a/include/uapi/linux/kvm.h
>> +++ b/include/uapi/linux/kvm.h
>> @@ -974,6 +974,7 @@ struct kvm_enable_cap {
>>  #define KVM_CAP_GUEST_MEMFD_FLAGS 244
>>  #define KVM_CAP_ARM_SEA_TO_USER 245
>>  #define KVM_CAP_S390_USER_OPEREXEC 246
>> +#define KVM_CAP_RISCV_SET_HGATP_MODE 247
>>  
>>  struct kvm_irq_routing_irqchip {
>>  	__u32 irqchip;
>> -- 
>> 2.50.1
>
>

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
