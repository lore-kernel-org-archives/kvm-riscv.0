Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEEFACCD195
	for <kvm-riscv@archiver.kernel.org>; Fri, 17 Oct 2025 09:14:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IJsIJ/MLH8efvRb5bIbh97k1h+n8oPKr/svN2RI/v+4=; b=PsV8ZZ7W3BMHKQ
	ydWfNlMc7sXMCxo+2zXFLgYUK4pOS8k51tgjWHsotff8UBx++3H/RLMoaEix6tRuQq4d7AZwz/e68
	dKHqq4vh6yPs3rgJW4byM8Yb661i/Vl3zHx6SB7DczxU71pXWxdKrM3CCFbLwsIl2rdErpVjFXoMT
	/kgbNdu2fughdEHN0K9pe6brkWRtVwhISJEJ9DEIzpJDRAc4N0u0gVWkYYgSQP4SNMgCG3pao9YRk
	GID7pQHdkiaw4xXnS/Z44YheqAfwNUD12xioJmOL1w3m+9xXG6MLXiEoJhXKwNlIOoRqi1w93nud6
	cNGbEgltKpPWLHu8qZ7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9gXv-00000007FbA-0xIB;
	Fri, 17 Oct 2025 09:14:47 +0000
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9gXr-00000007FYW-2Sqp;
	Fri, 17 Oct 2025 09:14:46 +0000
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59H8gseu021945;
	Fri, 17 Oct 2025 09:14:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=+02VME
	MaU/wKLb3qOH50f1Q1lv2qDWLwg+tUAWV2wuM=; b=fX4as6tlZNbvPpTLHiNOL6
	SuqTcdsmDfpfNq8euIzwQfdyk8Lj90jsrQrxx0g3TSzGTUvB3IgglBIY3l8UwI5H
	Iyq709WY7TVV909Ul1vSv5L/GqyKeEEfp4oDCChqIFFJBhaPBUMkdZ0u9btzKXQw
	3qtxk1vHbfhaUfhZxDHXMNS/x14awpZozJWh0xKKn7deAdNP4sUgPcwdYCsUZslN
	GUfhVVDetiAIawVuwx8euyqpPONL8b49UN/ruFw449NwyuDKur2YPqFdsB3ApjV3
	cMWbFgKssCB1XTMTv6mZGU2ScfP/+lfBxsBBGTs7W+8xxzR/tWOblbUTzwsQsBQg
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 49qey99c3p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 17 Oct 2025 09:14:27 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 59H8qifB028838;
	Fri, 17 Oct 2025 09:14:26 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 49qey99c2f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 17 Oct 2025 09:14:26 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 59H8xFov018812;
	Fri, 17 Oct 2025 09:14:24 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 49r2jn410s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 17 Oct 2025 09:14:24 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 59H9EK5a39059840
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 17 Oct 2025 09:14:20 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7186020040;
	Fri, 17 Oct 2025 09:14:20 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B663C2004E;
	Fri, 17 Oct 2025 09:14:18 +0000 (GMT)
Received: from p-imbrenda (unknown [9.111.16.217])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with SMTP;
	Fri, 17 Oct 2025 09:14:18 +0000 (GMT)
Date: Fri, 17 Oct 2025 11:13:53 +0200
From: Claudio Imbrenda <imbrenda@linux.ibm.com>
To: Sean Christopherson <seanjc@google.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>,
        Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>,
        Huacai Chen <chenhuacai@kernel.org>,
        Madhavan Srinivasan
 <maddy@linux.ibm.com>,
        Anup Patel <anup@brainfault.org>, Paul Walmsley
 <pjw@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou
 <aou@eecs.berkeley.edu>,
        Christian Borntraeger <borntraeger@linux.ibm.com>,
        Janosch Frank <frankja@linux.ibm.com>,
        Paolo Bonzini <pbonzini@redhat.com>,
        "Kirill A. Shutemov" <kas@kernel.org>,
        linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
        kvm@vger.kernel.org, loongarch@lists.linux.dev,
        linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
        x86@kernel.org, linux-coco@lists.linux.dev,
        linux-kernel@vger.kernel.org, Ira Weiny
 <ira.weiny@intel.com>,
        Kai Huang <kai.huang@intel.com>, Michael Roth
 <michael.roth@amd.com>,
        Yan Zhao <yan.y.zhao@intel.com>,
        Vishal Annapurve
 <vannapurve@google.com>,
        Rick Edgecombe <rick.p.edgecombe@intel.com>,
        Ackerley Tng <ackerleytng@google.com>,
        Binbin Wu
 <binbin.wu@linux.intel.com>
Subject: Re: [PATCH v3 02/25] KVM: Rename kvm_arch_vcpu_async_ioctl() to
 kvm_arch_vcpu_unlocked_ioctl()
Message-ID: <20251017111353.0d13af74@p-imbrenda>
In-Reply-To: <20251017003244.186495-3-seanjc@google.com>
References: <20251017003244.186495-1-seanjc@google.com>
	<20251017003244.186495-3-seanjc@google.com>
Organization: IBM
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: FzOT-asu0IlIDrxzaFQEZZaoA1KrLdy0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxMSBTYWx0ZWRfX1G02mGiBv00e
 dMQHZ8EcTuxNkyzLCgTkLS1wBT2kz1nzWzB2QF17bwej8xxLL1oqzzytFya8LWxstatbd+WYDIl
 NQ2s80v15I/r/bTW05huuDcp8Smd/7qMVu9fRxboF1bRETShMLjpsw7qijkxyxXsX7wiGabGK2Z
 17Hi24vMM3F18Tb+S9esTLJkCUCpMSLmAZNWu2JCA4/WSxGXEK5yjh0UJ7SOQvY8BRgL5H1li5w
 1767rZvXgSpYIH61cKRXuN/merjVrw1gXuiRkbKgjXEAMsbpk49pyoEpNtj49lCFS6IL0JyUrTf
 oKtyUeVdOb6XJi6opW/HQYxx+lBKwYSo0WH+tTWAkBpzpfnCWiuEKCj0ABzkqxFEEvCmobyw8Ha
 I0oEIKDLgPe8JiVSvMm5FBiVkPNrLQ==
X-Proofpoint-GUID: jHYcE7o7R3MyDzi2nuNi9GaxAOOKehmG
X-Authority-Analysis: v=2.4 cv=QZ5rf8bv c=1 sm=1 tr=0 ts=68f208f3 cx=c_pps
 a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17
 a=kj9zAlcOel0A:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=1XWaLZrsAAAA:8 a=VnNF1IyMAAAA:8 a=BhxH6JHrR1DjCnThtpoA:9 a=CjuIK1q_8ugA:10
 a=nl4s5V0KI7Kw-pW0DWrs:22 a=pHzHmUro8NiASowvMSCR:22 a=xoEH_sTeL_Rfw54TyV31:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-17_03,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0
 spamscore=0 malwarescore=0 impostorscore=0 clxscore=1011 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510110011
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251017_021443_639929_884634F4 
X-CRM114-Status: GOOD (  21.38  )
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

On Thu, 16 Oct 2025 17:32:20 -0700
Sean Christopherson <seanjc@google.com> wrote:

> Rename the "async" ioctl API to "unlocked" so that upcoming usage in x86's
> TDX code doesn't result in a massive misnomer.  To avoid having to retry
> SEAMCALLs, TDX needs to acquire kvm->lock *and* all vcpu->mutex locks, and
> acquiring all of those locks after/inside the current vCPU's mutex is a
> non-starter.  However, TDX also needs to acquire the vCPU's mutex and load
> the vCPU, i.e. the handling is very much not async to the vCPU.
> 
> No functional change intended.
> 
> Signed-off-by: Sean Christopherson <seanjc@google.com>

Acked-by: Claudio Imbrenda <imbrenda@linux.ibm.com>

> ---
>  arch/arm64/kvm/arm.c       | 4 ++--
>  arch/loongarch/kvm/vcpu.c  | 4 ++--
>  arch/mips/kvm/mips.c       | 4 ++--
>  arch/powerpc/kvm/powerpc.c | 4 ++--
>  arch/riscv/kvm/vcpu.c      | 4 ++--
>  arch/s390/kvm/kvm-s390.c   | 4 ++--
>  arch/x86/kvm/x86.c         | 4 ++--
>  include/linux/kvm_host.h   | 4 ++--
>  virt/kvm/kvm_main.c        | 6 +++---
>  9 files changed, 19 insertions(+), 19 deletions(-)
> 
> diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
> index 785aaaee6a5d..e8d654024608 100644
> --- a/arch/arm64/kvm/arm.c
> +++ b/arch/arm64/kvm/arm.c
> @@ -1828,8 +1828,8 @@ long kvm_arch_vcpu_ioctl(struct file *filp,
>  	return r;
>  }
>  
> -long kvm_arch_vcpu_async_ioctl(struct file *filp, unsigned int ioctl,
> -			       unsigned long arg)
> +long kvm_arch_vcpu_unlocked_ioctl(struct file *filp, unsigned int ioctl,
> +				  unsigned long arg)
>  {
>  	return -ENOIOCTLCMD;
>  }
> diff --git a/arch/loongarch/kvm/vcpu.c b/arch/loongarch/kvm/vcpu.c
> index 30e3b089a596..9a5844e85fd3 100644
> --- a/arch/loongarch/kvm/vcpu.c
> +++ b/arch/loongarch/kvm/vcpu.c
> @@ -1471,8 +1471,8 @@ int kvm_vcpu_ioctl_interrupt(struct kvm_vcpu *vcpu, struct kvm_interrupt *irq)
>  	return 0;
>  }
>  
> -long kvm_arch_vcpu_async_ioctl(struct file *filp,
> -			       unsigned int ioctl, unsigned long arg)
> +long kvm_arch_vcpu_unlocked_ioctl(struct file *filp, unsigned int ioctl,
> +				  unsigned long arg)
>  {
>  	void __user *argp = (void __user *)arg;
>  	struct kvm_vcpu *vcpu = filp->private_data;
> diff --git a/arch/mips/kvm/mips.c b/arch/mips/kvm/mips.c
> index a75587018f44..b0fb92fda4d4 100644
> --- a/arch/mips/kvm/mips.c
> +++ b/arch/mips/kvm/mips.c
> @@ -895,8 +895,8 @@ static int kvm_vcpu_ioctl_enable_cap(struct kvm_vcpu *vcpu,
>  	return r;
>  }
>  
> -long kvm_arch_vcpu_async_ioctl(struct file *filp, unsigned int ioctl,
> -			       unsigned long arg)
> +long kvm_arch_vcpu_unlocked_ioctl(struct file *filp, unsigned int ioctl,
> +				  unsigned long arg)
>  {
>  	struct kvm_vcpu *vcpu = filp->private_data;
>  	void __user *argp = (void __user *)arg;
> diff --git a/arch/powerpc/kvm/powerpc.c b/arch/powerpc/kvm/powerpc.c
> index 2ba057171ebe..9a89a6d98f97 100644
> --- a/arch/powerpc/kvm/powerpc.c
> +++ b/arch/powerpc/kvm/powerpc.c
> @@ -2028,8 +2028,8 @@ int kvm_arch_vcpu_ioctl_set_mpstate(struct kvm_vcpu *vcpu,
>  	return -EINVAL;
>  }
>  
> -long kvm_arch_vcpu_async_ioctl(struct file *filp,
> -			       unsigned int ioctl, unsigned long arg)
> +long kvm_arch_vcpu_unlocked_ioctl(struct file *filp, unsigned int ioctl,
> +				  unsigned long arg)
>  {
>  	struct kvm_vcpu *vcpu = filp->private_data;
>  	void __user *argp = (void __user *)arg;
> diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
> index bccb919ca615..a4bd6077eecc 100644
> --- a/arch/riscv/kvm/vcpu.c
> +++ b/arch/riscv/kvm/vcpu.c
> @@ -238,8 +238,8 @@ vm_fault_t kvm_arch_vcpu_fault(struct kvm_vcpu *vcpu, struct vm_fault *vmf)
>  	return VM_FAULT_SIGBUS;
>  }
>  
> -long kvm_arch_vcpu_async_ioctl(struct file *filp,
> -			       unsigned int ioctl, unsigned long arg)
> +long kvm_arch_vcpu_unlocked_ioctl(struct file *filp, unsigned int ioctl,
> +				  unsigned long arg)
>  {
>  	struct kvm_vcpu *vcpu = filp->private_data;
>  	void __user *argp = (void __user *)arg;
> diff --git a/arch/s390/kvm/kvm-s390.c b/arch/s390/kvm/kvm-s390.c
> index 16ba04062854..8c4caa5f2fcd 100644
> --- a/arch/s390/kvm/kvm-s390.c
> +++ b/arch/s390/kvm/kvm-s390.c
> @@ -5730,8 +5730,8 @@ static long kvm_s390_vcpu_memsida_op(struct kvm_vcpu *vcpu,
>  	return r;
>  }
>  
> -long kvm_arch_vcpu_async_ioctl(struct file *filp,
> -			       unsigned int ioctl, unsigned long arg)
> +long kvm_arch_vcpu_unlocked_ioctl(struct file *filp, unsigned int ioctl,
> +				  unsigned long arg)
>  {
>  	struct kvm_vcpu *vcpu = filp->private_data;
>  	void __user *argp = (void __user *)arg;
> diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
> index ca5ba2caf314..b85cb213a336 100644
> --- a/arch/x86/kvm/x86.c
> +++ b/arch/x86/kvm/x86.c
> @@ -7240,8 +7240,8 @@ static int kvm_vm_ioctl_set_clock(struct kvm *kvm, void __user *argp)
>  	return 0;
>  }
>  
> -long kvm_arch_vcpu_async_ioctl(struct file *filp, unsigned int ioctl,
> -			       unsigned long arg)
> +long kvm_arch_vcpu_unlocked_ioctl(struct file *filp, unsigned int ioctl,
> +				  unsigned long arg)
>  {
>  	return -ENOIOCTLCMD;
>  }
> diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
> index 7186b2ae4b57..d93f75b05ae2 100644
> --- a/include/linux/kvm_host.h
> +++ b/include/linux/kvm_host.h
> @@ -1557,6 +1557,8 @@ long kvm_arch_dev_ioctl(struct file *filp,
>  			unsigned int ioctl, unsigned long arg);
>  long kvm_arch_vcpu_ioctl(struct file *filp,
>  			 unsigned int ioctl, unsigned long arg);
> +long kvm_arch_vcpu_unlocked_ioctl(struct file *filp,
> +				  unsigned int ioctl, unsigned long arg);
>  vm_fault_t kvm_arch_vcpu_fault(struct kvm_vcpu *vcpu, struct vm_fault *vmf);
>  
>  int kvm_vm_ioctl_check_extension(struct kvm *kvm, long ext);
> @@ -2437,8 +2439,6 @@ static inline bool kvm_arch_no_poll(struct kvm_vcpu *vcpu)
>  }
>  #endif /* CONFIG_HAVE_KVM_NO_POLL */
>  
> -long kvm_arch_vcpu_async_ioctl(struct file *filp,
> -			       unsigned int ioctl, unsigned long arg);
>  void kvm_arch_guest_memory_reclaimed(struct kvm *kvm);
>  
>  #ifdef CONFIG_HAVE_KVM_VCPU_RUN_PID_CHANGE
> diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
> index b7a0ae2a7b20..b7db1d5f71a8 100644
> --- a/virt/kvm/kvm_main.c
> +++ b/virt/kvm/kvm_main.c
> @@ -4434,10 +4434,10 @@ static long kvm_vcpu_ioctl(struct file *filp,
>  		return r;
>  
>  	/*
> -	 * Some architectures have vcpu ioctls that are asynchronous to vcpu
> -	 * execution; mutex_lock() would break them.
> +	 * Let arch code handle select vCPU ioctls without holding vcpu->mutex,
> +	 * e.g. to support ioctls that can run asynchronous to vCPU execution.
>  	 */
> -	r = kvm_arch_vcpu_async_ioctl(filp, ioctl, arg);
> +	r = kvm_arch_vcpu_unlocked_ioctl(filp, ioctl, arg);
>  	if (r != -ENOIOCTLCMD)
>  		return r;
>  


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
