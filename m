Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 403D9D730A7
	for <kvm-riscv@archiver.kernel.org>; Fri,  3 Apr 2026 06:13:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=9COgNhjQw7hQho8sd2Rjf24AUiSBvtcEfFQ7TH+Lgy8=; b=ONrycCFcH7g2Du
	Uy0Fnf2swuylU1R0wvvDShSRn1E0HlmLR8vXSKT6mEG2Em5d8DZIlmfMEyREsz5ioxYL67GDsDe4t
	DSKvfTIM8IjLzFT5Uvw6VuIiaM5mdbbS43e7hGLZH6RXMHDhwXznB+/5Rkh/vnwjZsuzD69l9/5A0
	zY25NvVFWm2vq0R8AOYH/GlUiaON8Ub0XooY+bminpq1E6BE+a1wLKc1xDFEGSSSZNpauEfChInW0
	DNjlwhnDUerKu8G5E0Egr2uxElSDUJoRRflY8dBN2GULG6h+3vCgFio7+bp3t8HgiZp2tb7d1XXu9
	SZ3tY8IlnwR6q+YQNwGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8XmS-00000001Naw-3fzv;
	Fri, 03 Apr 2026 06:13:20 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8XmQ-00000001NZz-2wNA;
	Fri, 03 Apr 2026 06:13:20 +0000
Received: from fric.. (unknown [210.73.43.101])
	by APP-01 (Coremail) with SMTP id qwCowAAn0m1wWs9pxNMLDA--.32889S2;
	Fri, 03 Apr 2026 14:13:05 +0800 (CST)
From: Jiakai Xu <xujiakai2025@iscas.ac.cn>
To: kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Cc: Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atish.patra@linux.dev>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <pjw@kernel.org>,
	Jiakai Xu <xujiakai2025@iscas.ac.cn>,
	Jiakai Xu <jiakaiPeanut@gmail.com>
Subject: [PATCH] RISC-V: KVM: Fix shift-out-of-bounds in make_xfence_request()
Date: Fri,  3 Apr 2026 06:13:02 +0000
Message-Id: <20260403061302.2203179-1-xujiakai2025@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CM-TRANSID: qwCowAAn0m1wWs9pxNMLDA--.32889S2
X-Coremail-Antispam: 1UD129KBjvJXoW7tFy7try3tw1UXF4rWr45Jrb_yoW8XFWfpF
	4kCanY9FZ5GF1aya4ftrZ5WF1Fkrs7Cw1DZrWa9FyrKrn0qF10yrsYg3sxWry3JFsYqry0
	kFnxtFy5ua1DAaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUBY14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
	0DM2vYz4IE04k24VAvwVAKI4IrM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI
	64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVW8JVWxJw
	Am72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAG
	YxC7M4IIrI8v6xkF7I0E8cxan2IY04v7MxkF7I0En4kS14v26r1q6r43MxAIw28IcxkI7V
	AKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCj
	r7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6x
	IIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAI
	w20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x
	0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUjEoGDUUUUU==
X-Originating-IP: [210.73.43.101]
X-CM-SenderInfo: 50xmxthndljiysv6x2xfdvhtffof0/1tbiDAgGCWnPFcPwogAAsp
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260402_231319_129630_16EC0D07 
X-CRM114-Status: UNSURE (   9.15  )
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

The make_xfence_request() function uses a shift operation to check if a
vCPU is in the hart mask:

  if (!(hmask & (1UL << (vcpu->vcpu_id - hbase))))

However, when the difference between vcpu_id and hbase
is >= BITS_PER_LONG, the shift operation causes undefined behavior.

This was detected by UBSAN:
  UBSAN: shift-out-of-bounds in arch/riscv/kvm/tlb.c:343:23
  shift exponent 256 is too large for 64-bit type 'long unsigned int'

Fix this by adding a bounds check before the shift operation.

This bug was found by fuzzing the KVM RISC-V interface.

Fixes: 13acfec2dbcc ("RISC-V: KVM: Add remote HFENCE functions based on VCPU requests")
Signed-off-by: Jiakai Xu <jiakaiPeanut@gmail.com>
Signed-off-by: Jiakai Xu <xujiakai2025@iscas.ac.cn>
---
 arch/riscv/kvm/tlb.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/kvm/tlb.c b/arch/riscv/kvm/tlb.c
index ff1aeac4eb8eb..500e001513a11 100644
--- a/arch/riscv/kvm/tlb.c
+++ b/arch/riscv/kvm/tlb.c
@@ -333,14 +333,17 @@ static void make_xfence_request(struct kvm *kvm,
 	unsigned long i;
 	struct kvm_vcpu *vcpu;
 	unsigned int actual_req = req;
+	unsigned int idx;
 	DECLARE_BITMAP(vcpu_mask, KVM_MAX_VCPUS);
 
 	bitmap_zero(vcpu_mask, KVM_MAX_VCPUS);
 	kvm_for_each_vcpu(i, vcpu, kvm) {
 		if (hbase != -1UL) {
-			if (vcpu->vcpu_id < hbase)
+			idx = vcpu->vcpu_id - hbase;
+
+			if (idx < 0 || idx >= BITS_PER_LONG)
 				continue;
-			if (!(hmask & (1UL << (vcpu->vcpu_id - hbase))))
+			if (!(hmask & (1UL << idx)))
 				continue;
 		}
 
-- 
2.34.1


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
