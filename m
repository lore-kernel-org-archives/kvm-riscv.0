Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A90BC87FCF
	for <kvm-riscv@archiver.kernel.org>; Mon, 11 Aug 2025 02:59:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ZHigZkpBmGfahcJvyfT5LR1rcxgwh4mAsD4G0EPH9oo=; b=ps0aszVk8v12VC
	871yC8O0Qc9gID/l/FTQSx9TxC0IqXx1M77I6QCNWkt6bhXpr8jllcUUWvGNj0+y4qKGxu0wB21LM
	66DRBNjUQq8HgoxnQM6pG3reh296v4+a4cnl1zsVQrgZComg7lGD/X+Pc3pKnbnizjiRi7VlG+m7r
	MCfnkATQZAmo+UKD/i/xnFHYRn7E5hRF+4IoFnGukdWqZVm0ySzZPRzuvLE9u2E64DgqFsjz1ctjo
	o2HqWh5Q/25eYv0nr69LQMi4Qt4st49qHMaaRhE1fvxovKXcVUy+X0JiwgbRAESrpj5TLh0HShzGZ
	WtEdV0Dnnc+Blw6S3IJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulIlG-00000006O0x-3Axa;
	Mon, 11 Aug 2025 02:59:46 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulIJ6-00000006LpL-0VBZ;
	Mon, 11 Aug 2025 02:30:42 +0000
Received: from zq-Legion-Y7000.. (unknown [121.237.92.164])
	by APP-01 (Coremail) with SMTP id qwCowAC3pamoVZlo_2nRCg--.21035S2;
	Mon, 11 Aug 2025 10:30:01 +0800 (CST)
From: zhouquan@iscas.ac.cn
To: anup@brainfault.org,
	ajones@ventanamicro.com,
	atishp@atishpatra.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com
Cc: linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	Quan Zhou <zhouquan@iscas.ac.cn>
Subject: [PATCH] RISC-V: KVM: Correct kvm_riscv_check_vcpu_requests() comment
Date: Mon, 11 Aug 2025 10:18:29 +0800
Message-Id: <49680363098c45516ec4b305283d662d26fa9386.1754326285.git.zhouquan@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CM-TRANSID: qwCowAC3pamoVZlo_2nRCg--.21035S2
X-Coremail-Antispam: 1UD129KBjvdXoWruw4ktFW3CF1kZry3trW8WFg_yoW3ZFb_Cw
	1xGrsIgrWrZF10vFsrua1FgFs8G34xWayrJ3Z7Zr9rJ3s5urZ3W390gw43Jr47JrWYyFZ7
	Jw4FvrZ3C3s3tjkaLaAFLSUrUUUUbb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUb68FF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_
	Gr1UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
	Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628v
	n2kIc2xKxwAKzVCY07xG64k0F24lc7CjxVAaw2AFwI0_Jw0_GFylc2xSY4AK67AK6r4UMx
	AIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_
	Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwI
	xGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWx
	JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcV
	C2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUb-VyDUUUUU==
X-Originating-IP: [121.237.92.164]
X-CM-SenderInfo: 52kr31xxdqqxpvfd2hldfou0/1tbiBwwLBmiZRyEuxwAAs4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250810_193040_518264_31DA6A1E 
X-CRM114-Status: UNSURE (   7.02  )
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

From: Quan Zhou <zhouquan@iscas.ac.cn>

Correct `check_vcpu_requests` to `kvm_riscv_check_vcpu_requests`.

Fixes: f55ffaf89636 ("RISC-V: KVM: Enable ring-based dirty memory tracking")
Signed-off-by: Quan Zhou <zhouquan@iscas.ac.cn>
---
 arch/riscv/kvm/vcpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
index f001e56403f9..3ebcfffaa978 100644
--- a/arch/riscv/kvm/vcpu.c
+++ b/arch/riscv/kvm/vcpu.c
@@ -683,7 +683,7 @@ void kvm_arch_vcpu_put(struct kvm_vcpu *vcpu)
 }
 
 /**
- * check_vcpu_requests - check and handle pending vCPU requests
+ * kvm_riscv_check_vcpu_requests - check and handle pending vCPU requests
  * @vcpu:	the VCPU pointer
  *
  * Return: 1 if we should enter the guest
-- 
2.34.1


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
