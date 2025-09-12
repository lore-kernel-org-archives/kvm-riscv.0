Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECFF1CA101F
	for <kvm-riscv@archiver.kernel.org>; Fri, 12 Sep 2025 14:01:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3SwG3mayh2I3OXvdBXY07eboGKm6xVTNKFWha1vfs/w=; b=rI1qm2knMhTHAD
	97cJmw/FGiym+mRcGuuY4r3nFuLBaGM6f+yCOcX2EzAknKZfxqUB3ZWDOaKw97ivV5N+QMFmRzhuy
	taFYrY4VloDrHTg51MEBiudhxi1+YPv2wy1+DGrQP4VeNLI6F8qkL36Goy165riPS726PFnc1uoZb
	gXdSbnzqOLMeDwhIvpXm/9J2I7t2vUQ8HuWVp9tmxv9nw1Y1qTcggl8Qv08mQSsMt4pVkO0bS0hvf
	OOzsGTBHqOQJhTpLeJWhnQcj131/DYyYnmocC+W8ymVFex++dDFT5nib8J85dOeG3+Y61haX2brj3
	3MmFcQ8siJ4ZMAwci6wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux4Lb-00000009iE3-2eXt;
	Fri, 12 Sep 2025 14:01:55 +0000
Received: from out30-124.freemail.mail.aliyun.com ([115.124.30.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux4LZ-00000009iB9-1QcR;
	Fri, 12 Sep 2025 14:01:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1757685709; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=7vxMUaEoC1xxpeH68Y+6uXbvZfNDx8aZMXB0ICKHPVA=;
	b=PfRqB0Sy1LO9+mPNAMX5xMxSIfnYxfwiCtYTpLPotKcYDwVFp3n4qXLGI72zvGOvALF8DNAsofm4OxtvUM9ujGLsy5BtY+f6VoNCxEExadY6jOYniPbRiVNiynf2YztSGbTewnZ6h4XHLVHUYNmBjGFqb2emew0XZvgxcQ/ytqY=
Received: from localhost.localdomain(mailfrom:fangyu.yu@linux.alibaba.com fp:SMTPD_---0WnrFnIQ_1757685706 cluster:ay36)
          by smtp.aliyun-inc.com;
          Fri, 12 Sep 2025 22:01:47 +0800
From: fangyu.yu@linux.alibaba.com
To: fangyu.yu@linux.alibaba.com
Cc: alex@ghiti.fr,
	anup@brainfault.org,
	aou@eecs.berkeley.edu,
	atish.patra@linux.dev,
	graf@amazon.com,
	guoren@kernel.org,
	jiangyifei@huawei.com,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	pbonzini@redhat.com
Subject: [PATCH] RISC-V: KVM: Fix guest page fault within HLV* instructions
Date: Fri, 12 Sep 2025 22:01:42 +0800
Message-Id: <20250912140142.25147-1-fangyu.yu@linux.alibaba.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20250912134332.22053-1-fangyu.yu@linux.alibaba.com>
References: <20250912134332.22053-1-fangyu.yu@linux.alibaba.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250912_070153_713245_78DE5B3A 
X-CRM114-Status: UNSURE (   5.67  )
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

>From: Fangyu Yu <fangyu.yu@linux.alibaba.com>
>
>When executing HLV* instructions at the HS mode, a guest page fault
>may occur when a g-stage page table migration between triggering the
>virtual instruction exception and executing the HLV* instruction.
>
>This may be a corner case, and one simpler way to handle this is to
>re-execute the instruction where the virtual  instruction exception
>occurred, and the guest page fault will be automatically handled.
>
>Fixes: 9f7013265112 ("RISC-V: KVM: Handle MMIO exits for VCPU")
>Signed-off-by: Fangyu Yu <fangyu.yu@linux.alibaba.com>
>---
> arch/riscv/kvm/vcpu_insn.c | 21 ++++++++++++++++++---
> 1 file changed, 18 insertions(+), 3 deletions(-)
>
>diff --git a/arch/riscv/kvm/vcpu_insn.c b/arch/riscv/kvm/vcpu_insn.c
>index 97dec18e6989..a8b93aa4d8ec 100644
>--- a/arch/riscv/kvm/vcpu_insn.c
>+++ b/arch/riscv/kvm/vcpu_insn.c
>@@ -448,7 +448,12 @@ int kvm_riscv_vcpu_virtual_insn(struct kvm_vcpu *vcpu, struct kvm_run *run,
> 			insn = kvm_riscv_vcpu_unpriv_read(vcpu, true,
> 							  ct->sepc,
> 							  &utrap);
>-			if (utrap.scause) {
>+			switch (utrap.scause) {
>+			case 0:
>+				break;
>+			case EXC_LOAD_GUEST_PAGE_FAULT:
>+				return KVM_INSN_CONTINUE_SAME_SEPC;
>+			default:
> 				utrap.sepc = ct->sepc;
> 				kvm_riscv_vcpu_trap_redirect(vcpu, &utrap);
> 				return 1;
>@@ -503,7 +508,12 @@ int kvm_riscv_vcpu_mmio_load(struct kvm_vcpu *vcpu, struct kvm_run *run,
> 		 */
> 		insn = kvm_riscv_vcpu_unpriv_read(vcpu, true, ct->sepc,
> 						  &utrap);
>-		if (utrap.scause) {
>+		switch (utrap.scause) {
>+		case 0:
>+			break;
>+		case EXC_LOAD_GUEST_PAGE_FAULT:
>+			return KVM_INSN_CONTINUE_SAME_SEPC;
>+		default:
> 			/* Redirect trap if we failed to read instruction */
> 			utrap.sepc = ct->sepc;
> 			kvm_riscv_vcpu_trap_redirect(vcpu, &utrap);
>@@ -629,7 +639,12 @@ int kvm_riscv_vcpu_mmio_store(struct kvm_vcpu *vcpu, struct kvm_run *run,
> 		 */
> 		insn = kvm_riscv_vcpu_unpriv_read(vcpu, true, ct->sepc,
> 						  &utrap);
>-		if (utrap.scause) {
>+		switch (utrap.scause) {
>+		case 0:
>+			break;
>+		case EXC_LOAD_GUEST_PAGE_FAULT:

Here should be EXC_STORE_GUEST_PAGE_FAULT, I will fix it next version.

>+			return KVM_INSN_CONTINUE_SAME_SEPC;
>+		default:
> 			/* Redirect trap if we failed to read instruction */
> 			utrap.sepc = ct->sepc;
> 			kvm_riscv_vcpu_trap_redirect(vcpu, &utrap);
>-- 
>2.49.0

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
