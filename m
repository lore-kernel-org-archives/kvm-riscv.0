Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F074AE88D6E
	for <kvm-riscv@archiver.kernel.org>; Fri,  3 Apr 2026 23:20:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=sLbsgQgJIHc+HXoJOGhWep80CmoCcm9akXNs1GW/Vn4=; b=gI1+oNawwTgCae
	7BS3PoCMUpWcrzmZTVqRVfi2cu3W1zyjfTj0Q4kU+DUBGoHDqMFZdq/uMWal1r7XewOOHBO3p7sgS
	Qwx28mzfbDIQiw3p/4quQHUENmKBrS86ou2b3Hdt63752qD2k1dMAFBq+wgJvilPkEZymmCZH+Jpf
	bjiOwPOMLkV8qjbOWrNhDm7fplZhpgw6Pn57eKNnt4rht8Tmx0ivecyuNmWrIVCerav8WOgou2lbe
	4jh37oIj3ObpxzIiQrJxfcg9j+SeiZcR3WR88n8E2pMyth29I/dP197w7xLM73Ud1ww5SJ3oNS0Z+
	IqOejGdf/6KIbqIv9zyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8noP-00000002j0v-2bBo;
	Fri, 03 Apr 2026 23:20:25 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8noM-00000002j0W-1zlp;
	Fri, 03 Apr 2026 23:20:24 +0000
Received: from fric.. (unknown [210.73.43.101])
	by APP-01 (Coremail) with SMTP id qwCowADHb2ssS9BpDqMbDA--.3154S2;
	Sat, 04 Apr 2026 07:20:12 +0800 (CST)
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
Subject: [PATCH v2] RISC-V: KVM: Fix shift-out-of-bounds in make_xfence_request()
Date: Fri,  3 Apr 2026 23:20:11 +0000
Message-Id: <20260403232011.2394966-1-xujiakai2025@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CM-TRANSID: qwCowADHb2ssS9BpDqMbDA--.3154S2
X-Coremail-Antispam: 1UD129KBjvJXoW7tFy7try3tw1UXF4rWr45Jrb_yoW8XryDpr
	4kuFsa9Fs5GFnFya47ArZ5WF18Ar1kK34jvrW3uF48Jr4qqry8ArsY93s8Wry3JFsYqryF
	krnIqFyfua1DAaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUPj14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVWxJr
	0_GcWlnxkEFVAIw20F6cxK64vIFxWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xv
	F2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE14v26r1j6r
	4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I
	648v4I1lFIxGxcIEc7CjxVA2Y2ka0xkIwI1lc7CjxVAaw2AFwI0_Jw0_GFylc2xSY4AK67
	AK6FWl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AK
	xVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrx
	kI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v2
	6r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8Jw
	CI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfU0sqXDUUU
	U
X-Originating-IP: [210.73.43.101]
X-CM-SenderInfo: 50xmxthndljiysv6x2xfdvhtffof0/1tbiBwkGCWnP11+pggAAsE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260403_162022_893856_1265BF46 
X-CRM114-Status: UNSURE (   8.91  )
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
V1 -> V2:
- Dropped 'idx' variable and compared vcpu_id against hbase directly,
  as suggested by Andrew Jones.
---
 arch/riscv/kvm/tlb.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/kvm/tlb.c b/arch/riscv/kvm/tlb.c
index ff1aeac4eb8eb..439c20c2775ab 100644
--- a/arch/riscv/kvm/tlb.c
+++ b/arch/riscv/kvm/tlb.c
@@ -338,7 +338,8 @@ static void make_xfence_request(struct kvm *kvm,
 	bitmap_zero(vcpu_mask, KVM_MAX_VCPUS);
 	kvm_for_each_vcpu(i, vcpu, kvm) {
 		if (hbase != -1UL) {
-			if (vcpu->vcpu_id < hbase)
+			if (vcpu->vcpu_id < hbase ||
+				vcpu->vcpu_id >= hbase + BITS_PER_LONG)
 				continue;
 			if (!(hmask & (1UL << (vcpu->vcpu_id - hbase))))
 				continue;
-- 
2.34.1


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
