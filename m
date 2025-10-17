Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA5D1CCD195
	for <kvm-riscv@archiver.kernel.org>; Fri, 17 Oct 2025 09:14:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7hYtEA1kDbBy46N5Pf6e2VvCHz8fNqkciIBeGhMGjns=; b=Nw1V6lSQkuusvD
	Ye8T5mVt+JOygZletr4i6jiyb7JrjIKiXn13mEqaajBKuZCt3/3PZao/YqGV3xajUKVCyUCe0QW0m
	jxlHBzsOMUuqbs348e2yh9nO4zccZ07Qr8Bz6WWSwHaHxo2YN3AhERXaQ6Oc/4kxrqEe6LwzlDmEX
	Dy/uvHLZEKpNOnfdMErW0CEWeWNXzlp88kRrSriB0Berse95tghfD+K7YRXuhFoTwZ9Z6wOjuDpax
	99L4fexZ2UaPtEKT40vzEOImNl9YUKMa1Xqp+DpVBpkUS8/LwOYbpCw/5r3LXbO3XnTKEKz6j9b0O
	n2mbSU2U4rKwK7uKGv0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9gXy-00000007Fe0-2GT5;
	Fri, 17 Oct 2025 09:14:50 +0000
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9gXv-00000007Fb9-0tEt;
	Fri, 17 Oct 2025 09:14:48 +0000
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59H7iHlk001398;
	Fri, 17 Oct 2025 09:14:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=+3Upo5
	OE7pHxEFe3tmbZpeawhzh4FlEoIXRxd4VSv28=; b=JsaKqEezcfpud5WrRLycdc
	H+oQQuOQKt9AWS2MA2f2AWZxfvs/fKy1XLjRxCuyz+56f5TaICphCw6V+vG/C2bz
	F5gbzyBcSi8cacGtFSmpTAFrTlG2aUVsmy31GO+qAMN+54h8jCVe9POxWOaK8fN7
	/hJEpyoIAS2JTMgkwbRRg9OFM1BAa8/e1C7ZI4h8ECcspk29fPXdeARq+uJw8Tjf
	D5t5GR/pWKBSuIjzJXOp2kI6eD4WxDfkehxYD18sHbNqW2XhzgpvGBF1H6XEoi2M
	HcjAvo8sAVrEbNJQz08zCz9y9YqXcAvYvdU1ercKZUeSINmh7JZlhpwWWcKvdf1A
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 49rfp8c6xn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 17 Oct 2025 09:14:31 +0000 (GMT)
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 59H9EULh021760;
	Fri, 17 Oct 2025 09:14:30 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 49rfp8c6wu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 17 Oct 2025 09:14:30 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 59H8ubTK003613;
	Fri, 17 Oct 2025 09:14:29 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 49r1xyc2fw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 17 Oct 2025 09:14:29 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 59H9ENpC44826910
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 17 Oct 2025 09:14:23 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A877D2004D;
	Fri, 17 Oct 2025 09:14:23 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 12A9920043;
	Fri, 17 Oct 2025 09:14:22 +0000 (GMT)
Received: from p-imbrenda (unknown [9.111.16.217])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with SMTP;
	Fri, 17 Oct 2025 09:14:21 +0000 (GMT)
Date: Fri, 17 Oct 2025 11:12:41 +0200
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
Subject: Re: [PATCH v3 01/25] KVM: Make support for
 kvm_arch_vcpu_async_ioctl() mandatory
Message-ID: <20251017111241.3ce81f4f@p-imbrenda>
In-Reply-To: <20251017003244.186495-2-seanjc@google.com>
References: <20251017003244.186495-1-seanjc@google.com>
	<20251017003244.186495-2-seanjc@google.com>
Organization: IBM
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: WPthx5jfwUZwmBXm82Ziu6FlbYNGp6QD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDEyMDA4NCBTYWx0ZWRfX5i24UI+B1MAY
 VWfB/xDHmOzuGKZz+zkZ2l9x8ZFHXJp4bGgLzsCYZhO0HnyGdmaDMrR3mpcUClvHV/6yUf/DJgW
 ovv0s0yH2DpJzEoDalTUQ7xn8+BsGsuUL1Evgi81/rNK8f7liy/e1u5Eplk2Ps1PMqe9VGG88Gd
 B/PWIRzNBJouLYr5zASWk7TtznxP5X/Q7AcX7MyEwpCz/kio7cNBjUypNeg4aqEfYVvH1iNdnqr
 DDQxOpdTs6xRl/ZL81gMulg8gwbv+0DLWp2ISeg0UnUuPhPGkSeiVmEYx2auRl+f/B7rfTpWlo4
 36AvglRUTKXS0RgNKsrmRPKBst0ScMzACFqT/FpbRDvXiLwKYRDDM1MCJ2Zszccck9R4e2QBfwT
 CUAxfvzW0pSyHs9EaJzGgT7XBGLbiw==
X-Proofpoint-GUID: R3CWxwVp1MSUDtnlqjQzPeUreuCpS978
X-Authority-Analysis: v=2.4 cv=af5sXBot c=1 sm=1 tr=0 ts=68f208f7 cx=c_pps
 a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17
 a=kj9zAlcOel0A:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=1XWaLZrsAAAA:8 a=VnNF1IyMAAAA:8 a=Pqhxwy0yHowpa1wmBDEA:9
 a=3CZKy65qupELU2PZ:21 a=CjuIK1q_8ugA:10 a=nl4s5V0KI7Kw-pW0DWrs:22
 a=pHzHmUro8NiASowvMSCR:22 a=xoEH_sTeL_Rfw54TyV31:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-17_03,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 priorityscore=1501 spamscore=0 adultscore=0 suspectscore=0
 bulkscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510120084
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251017_021447_293395_DA477E7A 
X-CRM114-Status: GOOD (  22.03  )
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

On Thu, 16 Oct 2025 17:32:19 -0700
Sean Christopherson <seanjc@google.com> wrote:

> Implement kvm_arch_vcpu_async_ioctl() "natively" in x86 and arm64 instead
> of relying on an #ifdef'd stub, and drop HAVE_KVM_VCPU_ASYNC_IOCTL in
> anticipation of using the API on x86.  Once x86 uses the API, providing a
> stub for one architecture and having all other architectures opt-in
> requires more code than simply implementing the API in the lone holdout.
> 
> Eliminating the Kconfig will also reduce churn if the API is renamed in
> the future (spoiler alert).
> 
> No functional change intended.
> 
> Signed-off-by: Sean Christopherson <seanjc@google.com>

Acked-by: Claudio Imbrenda <imbrenda@linux.ibm.com>

> ---
>  arch/arm64/kvm/arm.c       |  6 ++++++
>  arch/loongarch/kvm/Kconfig |  1 -
>  arch/mips/kvm/Kconfig      |  1 -
>  arch/powerpc/kvm/Kconfig   |  1 -
>  arch/riscv/kvm/Kconfig     |  1 -
>  arch/s390/kvm/Kconfig      |  1 -
>  arch/x86/kvm/x86.c         |  6 ++++++
>  include/linux/kvm_host.h   | 10 ----------
>  virt/kvm/Kconfig           |  3 ---
>  9 files changed, 12 insertions(+), 18 deletions(-)
> 
> diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
> index f21d1b7f20f8..785aaaee6a5d 100644
> --- a/arch/arm64/kvm/arm.c
> +++ b/arch/arm64/kvm/arm.c
> @@ -1828,6 +1828,12 @@ long kvm_arch_vcpu_ioctl(struct file *filp,
>  	return r;
>  }
>  
> +long kvm_arch_vcpu_async_ioctl(struct file *filp, unsigned int ioctl,
> +			       unsigned long arg)
> +{
> +	return -ENOIOCTLCMD;
> +}
> +
>  void kvm_arch_sync_dirty_log(struct kvm *kvm, struct kvm_memory_slot *memslot)
>  {
>  
> diff --git a/arch/loongarch/kvm/Kconfig b/arch/loongarch/kvm/Kconfig
> index ae64bbdf83a7..ed4f724db774 100644
> --- a/arch/loongarch/kvm/Kconfig
> +++ b/arch/loongarch/kvm/Kconfig
> @@ -25,7 +25,6 @@ config KVM
>  	select HAVE_KVM_IRQCHIP
>  	select HAVE_KVM_MSI
>  	select HAVE_KVM_READONLY_MEM
> -	select HAVE_KVM_VCPU_ASYNC_IOCTL
>  	select KVM_COMMON
>  	select KVM_GENERIC_DIRTYLOG_READ_PROTECT
>  	select KVM_GENERIC_HARDWARE_ENABLING
> diff --git a/arch/mips/kvm/Kconfig b/arch/mips/kvm/Kconfig
> index ab57221fa4dd..cc13cc35f208 100644
> --- a/arch/mips/kvm/Kconfig
> +++ b/arch/mips/kvm/Kconfig
> @@ -22,7 +22,6 @@ config KVM
>  	select EXPORT_UASM
>  	select KVM_COMMON
>  	select KVM_GENERIC_DIRTYLOG_READ_PROTECT
> -	select HAVE_KVM_VCPU_ASYNC_IOCTL
>  	select KVM_MMIO
>  	select KVM_GENERIC_MMU_NOTIFIER
>  	select KVM_GENERIC_HARDWARE_ENABLING
> diff --git a/arch/powerpc/kvm/Kconfig b/arch/powerpc/kvm/Kconfig
> index 2f2702c867f7..c9a2d50ff1b0 100644
> --- a/arch/powerpc/kvm/Kconfig
> +++ b/arch/powerpc/kvm/Kconfig
> @@ -20,7 +20,6 @@ if VIRTUALIZATION
>  config KVM
>  	bool
>  	select KVM_COMMON
> -	select HAVE_KVM_VCPU_ASYNC_IOCTL
>  	select KVM_VFIO
>  	select HAVE_KVM_IRQ_BYPASS
>  
> diff --git a/arch/riscv/kvm/Kconfig b/arch/riscv/kvm/Kconfig
> index c50328212917..77379f77840a 100644
> --- a/arch/riscv/kvm/Kconfig
> +++ b/arch/riscv/kvm/Kconfig
> @@ -23,7 +23,6 @@ config KVM
>  	select HAVE_KVM_IRQCHIP
>  	select HAVE_KVM_IRQ_ROUTING
>  	select HAVE_KVM_MSI
> -	select HAVE_KVM_VCPU_ASYNC_IOCTL
>  	select HAVE_KVM_READONLY_MEM
>  	select HAVE_KVM_DIRTY_RING_ACQ_REL
>  	select KVM_COMMON
> diff --git a/arch/s390/kvm/Kconfig b/arch/s390/kvm/Kconfig
> index cae908d64550..96d16028e8b7 100644
> --- a/arch/s390/kvm/Kconfig
> +++ b/arch/s390/kvm/Kconfig
> @@ -20,7 +20,6 @@ config KVM
>  	def_tristate y
>  	prompt "Kernel-based Virtual Machine (KVM) support"
>  	select HAVE_KVM_CPU_RELAX_INTERCEPT
> -	select HAVE_KVM_VCPU_ASYNC_IOCTL
>  	select KVM_ASYNC_PF
>  	select KVM_ASYNC_PF_SYNC
>  	select KVM_COMMON
> diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
> index b4b5d2d09634..ca5ba2caf314 100644
> --- a/arch/x86/kvm/x86.c
> +++ b/arch/x86/kvm/x86.c
> @@ -7240,6 +7240,12 @@ static int kvm_vm_ioctl_set_clock(struct kvm *kvm, void __user *argp)
>  	return 0;
>  }
>  
> +long kvm_arch_vcpu_async_ioctl(struct file *filp, unsigned int ioctl,
> +			       unsigned long arg)
> +{
> +	return -ENOIOCTLCMD;
> +}
> +
>  int kvm_arch_vm_ioctl(struct file *filp, unsigned int ioctl, unsigned long arg)
>  {
>  	struct kvm *kvm = filp->private_data;
> diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
> index 5bd76cf394fa..7186b2ae4b57 100644
> --- a/include/linux/kvm_host.h
> +++ b/include/linux/kvm_host.h
> @@ -2437,18 +2437,8 @@ static inline bool kvm_arch_no_poll(struct kvm_vcpu *vcpu)
>  }
>  #endif /* CONFIG_HAVE_KVM_NO_POLL */
>  
> -#ifdef CONFIG_HAVE_KVM_VCPU_ASYNC_IOCTL
>  long kvm_arch_vcpu_async_ioctl(struct file *filp,
>  			       unsigned int ioctl, unsigned long arg);
> -#else
> -static inline long kvm_arch_vcpu_async_ioctl(struct file *filp,
> -					     unsigned int ioctl,
> -					     unsigned long arg)
> -{
> -	return -ENOIOCTLCMD;
> -}
> -#endif /* CONFIG_HAVE_KVM_VCPU_ASYNC_IOCTL */
> -
>  void kvm_arch_guest_memory_reclaimed(struct kvm *kvm);
>  
>  #ifdef CONFIG_HAVE_KVM_VCPU_RUN_PID_CHANGE
> diff --git a/virt/kvm/Kconfig b/virt/kvm/Kconfig
> index 5f0015c5dd95..267c7369c765 100644
> --- a/virt/kvm/Kconfig
> +++ b/virt/kvm/Kconfig
> @@ -78,9 +78,6 @@ config HAVE_KVM_IRQ_BYPASS
>         tristate
>         select IRQ_BYPASS_MANAGER
>  
> -config HAVE_KVM_VCPU_ASYNC_IOCTL
> -       bool
> -
>  config HAVE_KVM_VCPU_RUN_PID_CHANGE
>         bool
>  


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
