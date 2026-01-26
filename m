Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAD54E63C9E
	for <kvm-riscv@archiver.kernel.org>; Mon, 26 Jan 2026 01:26:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yyrxPdSKFkyNA9SxO8MkDkC9j6P48xilVduUMiu6Utc=; b=W9qbC0FMX69v3LGZc4+bvUb4+H
	2C//lyC6CP6zTIS7NlXZSBnk1P7YIEN1goo/5Lixj/jAZxSouT/CzQvGWWqo6khNtQUvuMOlNM3UL
	2wdsQe+FU0/jedsntknd2C1luCO+wMWBbvSxWGE17dPNYbLWZ1LVfwzfNvaMI6LdNlV77eroHJ26J
	St9NmjY8HC3NHbsGQDG7ACzl/G9kR1wP3izk24gQYccAuPp8XZ6SHg7EQnHu8WYVE5O8eo3HB0LgL
	4AImxoF5FMm7UU+CfLFKdWwZYkp1phy63sOKRgWsYGR0rAKcH0H6XpDWeCK+BRsAbpUA691RNY/Ra
	4e/ShOyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkBMn-0000000BkV8-2QP9;
	Mon, 26 Jan 2026 01:26:09 +0000
Received: from out30-111.freemail.mail.aliyun.com ([115.124.30.111])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkBMj-0000000BkUA-2Lu9;
	Mon, 26 Jan 2026 01:26:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1769390759; h=From:To:Subject:Date:Message-Id:MIME-Version:Content-Type;
	bh=gCARNgGUNLhCd1rBcVoXKGTchR8utjxKY5PDBVlWowc=;
	b=KSNtFqDcwGgx33hABd3WO6MzGbMeXRB1dnhGFtazzkVP20+W+WFBhXMi1zMl7GwgNn4ed71mCFacj7OkcGFEVk1POQVc5esICOU2Jr1GpaaLxsDRNju9RWtL+qyJu3opblbwuzGWFhv7Zu/ImXMDX3nZAxku/YTlnWl7w98o6zM=
Received: from localhost.localdomain(mailfrom:fangyu.yu@linux.alibaba.com fp:SMTPD_---0WxmmVCv_1769390752 cluster:ay36)
          by smtp.aliyun-inc.com;
          Mon, 26 Jan 2026 09:25:54 +0800
From: fangyu.yu@linux.alibaba.com
To: fangyu.yu@linux.alibaba.com
Cc: ajones@ventanamicro.com,
	alex@ghiti.fr,
	andrew.jones@oss.qualcomm.com,
	anup@brainfault.org,
	aou@eecs.berkeley.edu,
	atish.patra@linux.dev,
	corbet@lwn.net,
	guoren@kernel.org,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	pbonzini@redhat.com,
	pjw@kernel.org,
	radim.krcmar@oss.qualcomm.com
Subject: Re: [PATCH v3 2/2] RISC-V: KVM: add KVM_CAP_RISCV_SET_HGATP_MODE 
Date: Mon, 26 Jan 2026 09:25:50 +0800
Message-Id: <20260126012550.38206-1-fangyu.yu@linux.alibaba.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20260125150450.27068-3-fangyu.yu@linux.alibaba.com>
References: <20260125150450.27068-3-fangyu.yu@linux.alibaba.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260125_172606_180039_EF91FE64 
X-CRM114-Status: GOOD (  14.08  )
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
Content-Type: multipart/mixed; boundary="===============4333495260072982295=="
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
Errors-To: kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org

--===============4333495260072982295==
Content-Type: text/plain; charset=y
Content-Transfer-Encoding: 8bit

>From: Fangyu Yu <fangyu.yu@linux.alibaba.com>
>
>This capability allows userspace to explicitly select the HGATP mode
>for the VM. The selected mode must be less than or equal to the max
>HGATP mode supported by the hardware. This capability must be enabled
>before creating any vCPUs, and can only be set once per VM.
>
>Signed-off-by: Fangyu Yu <fangyu.yu@linux.alibaba.com>
>---
> Documentation/virt/kvm/api.rst | 18 ++++++++++++++++++
> arch/riscv/kvm/vm.c            | 26 ++++++++++++++++++++++++--
> include/uapi/linux/kvm.h       |  1 +
> 3 files changed, 43 insertions(+), 2 deletions(-)
>
>diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
>index 01a3abef8abb..9d0794b174c7 100644
>--- a/Documentation/virt/kvm/api.rst
>+++ b/Documentation/virt/kvm/api.rst
>@@ -8765,6 +8765,24 @@ helpful if user space wants to emulate instructions which are not
> This capability can be enabled dynamically even if VCPUs were already
> created and are running.
> 
>+7.47 KVM_CAP_RISCV_SET_HGATP_MODE
>+---------------------------------
>+
>+:Architectures: riscv
>+:Type: VM
>+:Parameters: args[0] contains the requested HGATP mode
>+:Returns:
>+  - 0 on success.
>+  - -EINVAL if args[0] is outside the range of HGATP modes supported by the
>+    hardware.
>+  - -EBUSY if vCPUs have already been created for the VM, if the VM has any
>+    non-empty memslots, or if the capability has already been set for the VM.
>+
>+This capability allows userspace to explicitly select the HGATP mode for
>+the VM. The selected mode must be less than or equal to the maximum HGATP
>+mode supported by the hardware. This capability must be enabled before
>+creating any vCPUs, and can only be set once per VM.
>+
Hi Andrew:

In v3，no changes were made here, as KVM_CAP_RISCV_SET_HGATP_MODE might be
appropriate, just like the no5lvl and no4lvl in the kernel.
If you think it's needed, I'm happy to discuss this further.

Thanks,
Fangyu
> 8. Other capabilities.
> ======================
> 
>diff --git a/arch/riscv/kvm/vm.c b/arch/riscv/kvm/vm.c
>index 4b2156df40fc..7bc9b193dcaa 100644
>--- a/arch/riscv/kvm/vm.c
>+++ b/arch/riscv/kvm/vm.c
>@@ -202,6 +202,9 @@ int kvm_vm_ioctl_check_extension(struct kvm *kvm, long ext)
> 	case KVM_CAP_VM_GPA_BITS:
> 		r = kvm_riscv_gstage_gpa_bits(&kvm->arch);
> 		break;
>+	case KVM_CAP_RISCV_SET_HGATP_MODE:
>+		r = IS_ENABLED(CONFIG_64BIT) ? 1 : 0;
>+		break;
> 	default:
> 		r = 0;
> 		break;
>@@ -212,12 +215,31 @@ int kvm_vm_ioctl_check_extension(struct kvm *kvm, long ext)
> 
> int kvm_vm_ioctl_enable_cap(struct kvm *kvm, struct kvm_enable_cap *cap)
> {
>+	if (cap->flags)
>+		return -EINVAL;
>+
> 	switch (cap->cap) {
> 	case KVM_CAP_RISCV_MP_STATE_RESET:
>-		if (cap->flags)
>-			return -EINVAL;
> 		kvm->arch.mp_state_reset = true;
> 		return 0;
>+	case KVM_CAP_RISCV_SET_HGATP_MODE:
>+#ifdef CONFIG_64BIT
>+		if (cap->args[0] < HGATP_MODE_SV39X4 ||
>+		    cap->args[0] > kvm_riscv_gstage_mode(kvm_riscv_gstage_max_pgd_levels))
>+			return -EINVAL;
>+
>+		if (kvm->arch.gstage_mode_user_initialized || kvm->created_vcpus ||
>+		    !kvm_are_all_memslots_empty(kvm))
>+			return -EBUSY;
>+
>+		kvm->arch.gstage_mode_user_initialized = true;
>+		kvm->arch.kvm_riscv_gstage_pgd_levels =
>+				3 + cap->args[0] - HGATP_MODE_SV39X4;
>+		kvm_debug("VM (vmid:%lu) using SV%lluX4 G-stage page table format\n",
>+			  kvm->arch.vmid.vmid,
>+			  39 + (cap->args[0] - HGATP_MODE_SV39X4) * 9);
>+#endif
>+		return 0;
> 	default:
> 		return -EINVAL;
> 	}
>diff --git a/include/uapi/linux/kvm.h b/include/uapi/linux/kvm.h
>index dddb781b0507..00c02a880518 100644
>--- a/include/uapi/linux/kvm.h
>+++ b/include/uapi/linux/kvm.h
>@@ -974,6 +974,7 @@ struct kvm_enable_cap {
> #define KVM_CAP_GUEST_MEMFD_FLAGS 244
> #define KVM_CAP_ARM_SEA_TO_USER 245
> #define KVM_CAP_S390_USER_OPEREXEC 246
>+#define KVM_CAP_RISCV_SET_HGATP_MODE 247
> 
> struct kvm_irq_routing_irqchip {
> 	__u32 irqchip;
>-- 
>2.50.1


--===============4333495260072982295==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv

--===============4333495260072982295==--
