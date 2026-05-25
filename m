Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 178D2CD5BAB
	for <kvm-riscv@archiver.kernel.org>; Mon, 25 May 2026 01:36:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=K891bIJcKEgE5WPDoxC3/RHsQfzLWvvhDU+6pnGTfQg=; b=js+8jbgX+l8Ega
	EDrK7KaDrQb6FABYos+erYUDqGiLfgWP4AmWBTBS77RR8M2lv6qTGVn5W3em2gQ89SPBg9cd8wOXI
	UjRT6dCrnBNK7x3bDnULEbqHTklrqt82uy4NaufY8zrFKzQVp9uC4O+emucjfncFc76wLLxbns9s3
	ci0zv/bgZAYcUmLDUtoR6pEsOmH8n/yHcxQ1ggAnU6Df17XUcs1wYXXv66fnQwhPFTKLzXxFtOkv5
	O+uQZLdQFCColEi1hyJQnGtmzkC5Xte7QAMpvn863/0pfDACdZ6g1g00OVJWt4zr5f7FuTpqvtr2c
	hU4MsU0evyxJQtY1CL+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRKFU-0000000G1NI-2NCT;
	Mon, 25 May 2026 01:36:56 +0000
Received: from smtp81.cstnet.cn ([159.226.251.81] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRKFS-0000000G1Mm-0LCS;
	Mon, 25 May 2026 01:36:55 +0000
Received: from fric.. (unknown [36.110.52.2])
	by APP-03 (Coremail) with SMTP id rQCowABXcdirpxNquvA8Eg--.6572S2;
	Mon, 25 May 2026 09:36:44 +0800 (CST)
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
Subject: [PATCH v2] RISC-V: KVM: Document a TOCTOU race in SBI system suspend handler
Date: Mon, 25 May 2026 01:36:42 +0000
Message-Id: <20260525013642.999187-1-xujiakai2025@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CM-TRANSID: rQCowABXcdirpxNquvA8Eg--.6572S2
X-Coremail-Antispam: 1UD129KBjvJXoW7tF45Ww4ruF48Ww4DXr15twb_yoW8AFW5pr
	sYkFnIgws5Gr4Ika1IyanrXr1Sg3yvgF4aqrZ2yFW5Ww1qva40krs3urWUXryUAFZYqryf
	Ar4jvF1ruwn8ZaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUBa14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
	JVWxJr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v26F
	4UJVW0owAac4AC62xK8xCEY4vEwIxC4wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40E
	FcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUXVWUAwAv7VC2z280aVAFwI0_Jr
	0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8v
	x2IErcIFxwACI402YVCY1x02628vn2kIc2xKxwCY1x0262kKe7AKxVWUtVW8ZwCF04k20x
	vY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I
	3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIx
	AIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAI
	cVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2js
	IEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUl-eOUUUUU=
X-Originating-IP: [36.110.52.2]
X-CM-SenderInfo: 50xmxthndljiysv6x2xfdvhtffof0/1tbiDAgSCWoTok4USQAAsX
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260524_183654_501939_2A4FF444 
X-CRM114-Status: UNSURE (   9.80  )
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

The SUSP handler checks that all other vCPUs are stopped before
entering system suspend, but a concurrent HSM HART_START can start
a vCPU after it has already passed the check.

This is a known TOCTOU race. We do not fix it because:
1. Triggering it requires a pathological guest.
2. Only guest state is at risk, not host integrity.
3. Userspace can double-check vCPU states before suspend.

Add a comment documenting the race and the rationale for not fixing it.

Signed-off-by: Jiakai Xu <jiakaiPeanut@gmail.com>
Signed-off-by: Jiakai Xu <xujiakai2025@iscas.ac.cn>
Assisted-by: YuanSheng:DeepSeek-V3.2
---
V1 -> V2:
- Replaced the fix with a comment.
Link: https://lore.kernel.org/linux-riscv/20260521142030.1560861-1-xujiakai2025@iscas.ac.cn/t/#u
---
 arch/riscv/kvm/vcpu_sbi_system.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/riscv/kvm/vcpu_sbi_system.c b/arch/riscv/kvm/vcpu_sbi_system.c
index c6f7e609ac794..6f64a59e5d3c4 100644
--- a/arch/riscv/kvm/vcpu_sbi_system.c
+++ b/arch/riscv/kvm/vcpu_sbi_system.c
@@ -35,6 +35,20 @@ static int kvm_sbi_ext_susp_handler(struct kvm_vcpu *vcpu, struct kvm_run *run,
 			return 0;
 		}
 
+		/*
+		 * Check that all other vCPUs are stopped before entering
+		 * system suspend.
+		 *
+		 * There is a known TOCTOU race here: a concurrent HSM
+		 * HART_START on another vCPU can start a vCPU after it
+		 * has already passed this check, violating the invariant.
+		 *
+		 * We do not fix this because:
+		 * 1. Triggering the race requires a pathological guest.
+		 * 2. Only guest state is at risk, not host integrity.
+		 * 3. Userspace can double-check vCPU states before
+		 *    proceeding with suspend.
+		 */
 		kvm_for_each_vcpu(i, tmp, vcpu->kvm) {
 			if (tmp == vcpu)
 				continue;
-- 
2.34.1


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
