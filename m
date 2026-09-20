Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D8CEC982DA
	for <kvm-riscv@archiver.kernel.org>; Sun, 20 Sep 2026 13:12:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=harNf0YHMK0qBAduuALnJxaR70MVGQt7pZs/KqPCPIQ=; b=HbVtQnXy2hrFfK
	7bT3S3A0OeUQmfH9qdbOKLOkUB8A9mYiYu01uicDY9VZkp+RxGvIR8DJ3G1F3IY1NwKRNpuatYxKl
	L+OPXQiCQtrxFY0MUbm74Nx/wHv3HKigmdNvuwvsBvi44livJNZHn1GOS4P3ECYckL26E9VM3m1k2
	dInNOeeOcmxalkyOX1tb8780fIjmu5AgDpkpXFp1/FKRQ6vzJv0FJEE00x72aBFd8OrLnkLEwjlpH
	MeOj5iY++7/YomxuqtNDOTlR1hvAPFnb1yUJKObiAd6FW19iLmXzootM4qZcncoP6QelHRORD6Sfd
	hqSeJWFyaz/iQ/5ds4pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8HLF-0000000HUcr-3DZh;
	Sun, 20 Sep 2026 13:12:25 +0000
Received: from mail-proxy25256.mail.163.com ([103.129.252.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8HLC-0000000HUbz-47pN;
	Sun, 20 Sep 2026 13:12:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=fx
	xetwQM1IVZM6P54FHuhflyKkC0LojiwyGoiT/nK4Q=; b=jKf1EJuE+KZKaKmcXE
	poYBlGoD53ld9BzWypVlatyygE7j/FUZGXQja3WXLa9jacTBtwZ2eiXuGhx9H1gc
	hQod2ArXlYBJpmGg+a0hfoxuadP2l0jDKZvT04ZpIcS7nFtVaDher80QEs7qVSuj
	vpWQAyrstZpkkT0ncESG+/+BM=
Received: from localhost.localdomain (unknown [])
	by gzsmtp4 (Coremail) with SMTP id PygvCgD3v1cl269qj9S_AQ--.59232S2;
	Sun, 20 Sep 2026 21:09:58 +0800 (CST)
From: Pengpeng Hou <hppiscas@163.com>
To: anup@brainfault.org
Cc: Pengpeng Hou <hppiscas@163.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Andrew Jones <andrew.jones@oss.qualcomm.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Atish Patra <atish.patra@linux.dev>,
	Fangyu Yu <fangyu.yu@linux.alibaba.com>,
	Guo Ren <guoren@kernel.org>,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Nutty Liu <nutty.liu@hotmail.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <pjw@kernel.org>
Subject: [PATCH v2 2/2] RISC-V: KVM: Disallow GPA-width changes after AIA init
Date: Sun, 20 Sep 2026 21:09:55 +0800
Message-ID: <fbe7337f6989994ad4dbc4dc03a67e8ebfa61f8d.1789872556.git.hppiscas@163.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <cover.1789872556.git.hppiscas@163.com>
References: <cover.1789872556.git.hppiscas@163.com>
MIME-Version: 1.0
X-CM-TRANSID: PygvCgD3v1cl269qj9S_AQ--.59232S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7Cr17try7WF45CrWUAF1fWFg_yoW8WrW3p3
	9rGa95Zr95Wr17CrW0yws7Zr10vws5Gr1ayFyYvF43WFs0vFy0vanYyr47Jr1DAan29FWI
	vF1Yy34Fvrs5CaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zil4i5UUUUU=
X-CM-SenderInfo: 5kssx2xfdvqiywtou0bp/xtbC7QaGT2qv2yYXHwAA3S
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260920_061223_330946_D4D70E45 
X-CRM114-Status: UNSURE (   8.85  )
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

KVM_ENABLE_CAP(KVM_CAP_VM_GPA_BITS) allows userspace to reduce the
stage-2 GPA width while a VM has no vCPUs or memory slots.

AIA initialization can complete with an APLIC and no vCPUs or memory
slots. The APLIC MMIO device has then been registered, but the existing
checks still allow userspace to shrink the GPA width below its address.

Reject GPA-width changes after AIA initialization. Both paths hold
kvm->lock, serializing the width change with AIA initialization.

The issue was found by our static-analysis tool.

Fixes: 7263b4fdb0b2 ("RISC-V: KVM: Reuse KVM_CAP_VM_GPA_BITS to select HGATP.MODE")
Reviewed-by: Anup Patel <anup@brainfault.org>
Assisted-by: gpt 5
Signed-off-by: Pengpeng Hou <hppiscas@163.com>
---
Changes since v1: https://lore.kernel.org/r/4852f3b8985c353811fa065e4701d76dc9a7f086.1786512671.git.pengpeng@iscas.ac.cn/
- No change to the code; retain Anup's Reviewed-by.
- Rebase and clarify the locking description.

 arch/riscv/kvm/vm.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/kvm/vm.c b/arch/riscv/kvm/vm.c
index a9f083f..66edfaa 100644
--- a/arch/riscv/kvm/vm.c
+++ b/arch/riscv/kvm/vm.c
@@ -250,7 +250,8 @@ int kvm_vm_ioctl_enable_cap(struct kvm *kvm, struct kvm_enable_cap *cap)
 		mutex_lock(&kvm->lock);
 		mutex_lock(&kvm->slots_lock);
 
-		if (kvm->created_vcpus || !kvm_are_all_memslots_empty(kvm))
+		if (kvm->created_vcpus || !kvm_are_all_memslots_empty(kvm) ||
+		    kvm_riscv_aia_initialized(kvm))
 			r = -EBUSY;
 		else
 			kvm->arch.pgd_levels = new_levels;


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
