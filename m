Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93B56C5AD4E
	for <kvm-riscv@archiver.kernel.org>; Mon, 10 Aug 2026 05:17:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jbCDqHS4mFd/5J9GUuf+R21LsLwDPedmtUGcl9nfgVQ=; b=h7VECWFaYBt+EA
	GaKSr+IC879EADKYRo4DyD0Ek6uOHYwNQBw5SZShdQdqUhCGRvZBwsJRehxy6nFM0tiKAPxNQ/hMB
	th0xU8sboQJR5i9FJLnwunH6uQQGKAagdsFPEz+ZWQMYfXuV4LdsQWbm/DruF2o9pF47F4ijjJO+3
	qiSormeaCqaSywbIFdg+LgA7/HnTfSigk36SIZXncWHsoY7kx4iu9uDpTL5A9+ZNsTr7XDAO2XStv
	rC89+l7jo4VH6yktcFOjYrpNqDLB0bsUle1CZ0eqs2aO5EzAr6Vlmk5qkSnXLVFUpOquuoAQLS/Ph
	VwiODISFfoeNOOsjkJ2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtINq-0000000B2DL-1Jtz;
	Mon, 10 Aug 2026 05:17:10 +0000
Received: from [218.76.62.146] (helo=ultrarisc.com)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtINn-0000000B2C6-2qUK
	for kvm-riscv@lists.infradead.org;
	Mon, 10 Aug 2026 05:17:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ultrarisc.com; s=dkim; h=Received:From:To:Cc:Subject:Date:
	Message-Id:In-Reply-To:References:MIME-Version:
	Content-Transfer-Encoding; bh=g95oLQ7SjtKtG4RhAvYdPm09Nh5QYF1WOB
	P8Wpo/53k=; b=ZUyjzbZs9TcsgeyNyOg41AbkvXkCbKveLm1pTtKb8lR/PPsvgb
	OWd5jpLvAL4t4VW7effhrJD3kqcFvt8lwjgIjqpvB8kgcJHPyAlrGMpJUhKGQwOk
	p4ZYkqKFpXZIa3Ld3pq53BbGFdnZ9RoRbJ/HoMszXbytWJC6DNBd6cou8=
Received: from ultrarisc.com (unknown [192.168.100.1])
	by localhost.localdomain (Coremail) with SMTP id AQAAfwAnEkOZXnlq2JYWAA--.18693S4;
	Mon, 10 Aug 2026 13:16:23 +0800 (CST)
From: Xie Bo <xb@ultrarisc.com>
To: Anup Patel <anup@brainfault.org>,
	kvm-riscv@lists.infradead.org
Cc: Atish Patra <atish.patra@linux.dev>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	kvm@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Xie Bo <xb@ultrarisc.com>,
	stable@vger.kernel.org
Subject: [RESEND PATCH 2/2] RISC-V: KVM: Propagate interrupted G-stage faults
Date: Mon, 10 Aug 2026 13:15:44 +0800
Message-Id: <20260810051544.3953925-3-xb@ultrarisc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260810051544.3953925-1-xb@ultrarisc.com>
References: <20260810051544.3953925-1-xb@ultrarisc.com>
MIME-Version: 1.0
X-CM-TRANSID: AQAAfwAnEkOZXnlq2JYWAA--.18693S4
X-Coremail-Antispam: 1UD129KBjvJXoW7CFyDZFWUAF15GFyDur47XFb_yoW8XFyfpF
	W7Cwn5Z3yFgr17K347tw4kur4Y9an0grnxurs8Zay5Xr45tFyj9wn5W347ZF15Gr1rXayS
	gryruFy5uwn5A3JanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUmm14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jryl82xGYIkIc2
	x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
	Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1l84
	ACjcxK6I8E87Iv67AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UM2AI
	xVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20x
	vE14v26r126r1DMcIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xv
	r2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E8cxan2IY04
	v7MxkF7I0En4kS14v26r1q6r43MxkIecxEwVCm-wCF04k20xvY0x0EwIxGrwCFx2IqxVCF
	s4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r
	1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWU
	JVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r
	1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1U
	YxBIdaVFxhVjvjDU0xZFpf9x0JUqYL9UUUUU=
X-CM-SenderInfo: l0e63zxwud2x1vfou0bp/1tbiAQAMB2p1VlUAFAAQsS
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260809_221707_891644_C4B18718 
X-CRM114-Status: GOOD (  10.73  )
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

__kvm_faultin_pfn() reports an interrupted host page fault with
KVM_PFN_ERR_SIGPENDING. RISC-V currently handles it as a generic error PFN
and returns -EFAULT.

Return -EINTR for the signal-pending sentinel so callers can distinguish
an interrupted fault from an invalid userspace mapping. Do not log the
expected interruption as a vCPU exit error.

Fixes: 9d05c1fee837 ("RISC-V: KVM: Implement stage2 page table programming")
Cc: stable@vger.kernel.org
Signed-off-by: Xie Bo <xb@ultrarisc.com>
---
 arch/riscv/kvm/mmu.c       | 2 ++
 arch/riscv/kvm/vcpu_exit.c | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/kvm/mmu.c b/arch/riscv/kvm/mmu.c
index d189fd5..3e955d8 100644
--- a/arch/riscv/kvm/mmu.c
+++ b/arch/riscv/kvm/mmu.c
@@ -708,6 +708,8 @@ int kvm_riscv_mmu_map(struct kvm_vcpu *vcpu, struct kvm_memory_slot *memslot,
 				vma_pageshift, current);
 		return 0;
 	}
+	if (is_sigpending_pfn(hfn))
+		return -EINTR;
 	if (is_error_noslot_pfn(hfn))
 		return -EFAULT;
 
diff --git a/arch/riscv/kvm/vcpu_exit.c b/arch/riscv/kvm/vcpu_exit.c
index 88e0c36..8d36eb8 100644
--- a/arch/riscv/kvm/vcpu_exit.c
+++ b/arch/riscv/kvm/vcpu_exit.c
@@ -283,7 +283,7 @@ int kvm_riscv_vcpu_exit(struct kvm_vcpu *vcpu, struct kvm_run *run,
 	}
 
 	/* Print details in-case of error */
-	if (ret < 0) {
+	if (ret < 0 && ret != -EINTR) {
 		kvm_err("VCPU exit error %d\n", ret);
 		kvm_err("SEPC=0x%lx SSTATUS=0x%lx HSTATUS=0x%lx\n",
 			vcpu->arch.guest_context.sepc,


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
