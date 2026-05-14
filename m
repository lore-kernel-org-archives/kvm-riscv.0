Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDDB5CD4851
	for <kvm-riscv@archiver.kernel.org>; Thu, 14 May 2026 08:18:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=K69oE2tql+s7hWohnOQdfghHc95uU+5n90IB3uBlrcM=; b=lRwR7RTPKdp/r4
	gE7b9hOlOp8zqJdMllKT2QAPleyOI8eTlkRmyEbO5jtzCnePz16vw2l0/PKfbK0r8zk4lDFHFXHWo
	r7yh9HWkkZs6NXTQsPssYhhKGkSZFGjis4jkegqTZZqkDcFRb7Tm9M7nZbeElyFCr7EF6Z9mHMPrg
	fbak36Pw9CeBopNwF4cXTjFVbXRhbDcsjKVwA6YjsxzNcIfNa3WZSofOgRkZpzR7pvNymUeJ2D+g0
	4jlH1aPvkDox5F/KrTRk+McV2/OJHv4IhSyPcVm7u/Reps/rIOwLs5XBG6zEbk0xbc7a2hAtVASyr
	FXFL0sVw0DpDXBcTOwLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNRGo-00000004vC7-13GV;
	Thu, 14 May 2026 08:18:14 +0000
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNRGk-00000004vAs-2uG6;
	Thu, 14 May 2026 08:18:13 +0000
Received: from fric.. (unknown [36.110.52.2])
	by APP-05 (Coremail) with SMTP id zQCowAAHlgkyhQVqs4A7EA--.41408S2;
	Thu, 14 May 2026 16:17:54 +0800 (CST)
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
Subject: [PATCH] RISC-V: KVM: Fix sign extension for MMIO loads
Date: Thu, 14 May 2026 08:17:51 +0000
Message-Id: <20260514081752.472987-1-xujiakai2025@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CM-TRANSID: zQCowAAHlgkyhQVqs4A7EA--.41408S2
X-Coremail-Antispam: 1UD129KBjvJXoWxuF1xCry5WF18tF4UXw13Jwb_yoW5Gw4xpF
	W8G34YqFWxXr1Y9F1Ykr409rs09wsYkF1rXrWqg34fKw4jvFy5AFWvg3s5AryUJF1xZr1F
	kFWSqa45ZF1kAa7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
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
X-Originating-IP: [36.110.52.2]
X-CM-SenderInfo: 50xmxthndljiysv6x2xfdvhtffof0/1tbiDAYHCWoFRNPz8gAAs9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260514_011811_097595_1962A79F 
X-CRM114-Status: GOOD (  10.42  )
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

The kvm_riscv_vcpu_mmio_return() function handles MMIO read results
by writing the data back to the guest register. For signed load
instructions (LB, LH, LW on RV64), the value needs sign-extension
from a smaller integer to unsigned long.

The current code uses:
    (ulong)data << shift >> shift
but (ulong) makes the right shift a logical shift (zero-extend)
rather than an arithmetic shift (sign-extend), causing incorrect
results when the MMIO device returns a negative value. For example,
LB reading 0x80 would return 128 instead of -128.

Fix this by casting to (long) after the left shift so that the
subsequent right shift is arithmetic and correctly propagates
the sign bit:
    (long)((ulong)data << shift) >> shift

Additionally, remove the unnecessary shift assignment for LBU
(unsigned byte load) since it does not need sign extension.
This makes LBU consistent with LHU and LWU which already keep
shift = 0.

Fixes: b91f0e4cb8a3 ("RISC-V: KVM: Factor-out instruction emulation into separate sources")
Signed-off-by: Jiakai Xu <jiakaiPeanut@gmail.com>
Signed-off-by: Jiakai Xu <xujiakai2025@iscas.ac.cn>
Assisted-by: OpenClaw:DeepSeek-V3.2
---
 arch/riscv/kvm/vcpu_insn.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/arch/riscv/kvm/vcpu_insn.c b/arch/riscv/kvm/vcpu_insn.c
index 4d89b94128aea..f09f9251d1f0a 100644
--- a/arch/riscv/kvm/vcpu_insn.c
+++ b/arch/riscv/kvm/vcpu_insn.c
@@ -415,7 +415,6 @@ int kvm_riscv_vcpu_mmio_load(struct kvm_vcpu *vcpu, struct kvm_run *run,
 		shift = 8 * (sizeof(ulong) - len);
 	} else if ((insn & INSN_MASK_LBU) == INSN_MATCH_LBU) {
 		len = 1;
-		shift = 8 * (sizeof(ulong) - len);
 #ifdef CONFIG_64BIT
 	} else if ((insn & INSN_MASK_LD) == INSN_MATCH_LD) {
 		len = 8;
@@ -649,22 +648,22 @@ int kvm_riscv_vcpu_mmio_return(struct kvm_vcpu *vcpu, struct kvm_run *run)
 	case 1:
 		data8 = *((u8 *)run->mmio.data);
 		SET_RD(insn, &vcpu->arch.guest_context,
-			(ulong)data8 << shift >> shift);
+			(long)((ulong)data8 << shift) >> shift);
 		break;
 	case 2:
 		data16 = *((u16 *)run->mmio.data);
 		SET_RD(insn, &vcpu->arch.guest_context,
-			(ulong)data16 << shift >> shift);
+			(long)((ulong)data16 << shift) >> shift);
 		break;
 	case 4:
 		data32 = *((u32 *)run->mmio.data);
 		SET_RD(insn, &vcpu->arch.guest_context,
-			(ulong)data32 << shift >> shift);
+			(long)((ulong)data32 << shift) >> shift);
 		break;
 	case 8:
 		data64 = *((u64 *)run->mmio.data);
 		SET_RD(insn, &vcpu->arch.guest_context,
-			(ulong)data64 << shift >> shift);
+			(long)((ulong)data64 << shift) >> shift);
 		break;
 	default:
 		return -EOPNOTSUPP;
-- 
2.34.1


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
