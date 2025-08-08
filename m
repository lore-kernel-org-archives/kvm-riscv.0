Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 600A8C87FD2
	for <kvm-riscv@archiver.kernel.org>; Fri,  8 Aug 2025 10:46:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=I4jY/2fcPRGVuDYxXkuUhYs3glbybfSNvc5lKAmv63k=; b=qQmWMmDCvHZVYv
	myBjyXKadDlbvmXFR7ZzMoDm1xj0QEwYPtVT86L2To/dQ0Lzb5LNOa+R4W6PIH8zdUn3TKy9SWHrn
	nAdSahZJ7tFy9bzE11LWUhq34u/sKuMPFXE0ZF/8oWOJpmQ9ufD+0JHWo1JZqfYagvRbw3ktoP2SN
	JGJVmdIppSXaI/NlItLj30MfGm6ptab1mAadu8Fdn3VcHqlNiQy5GiA1AAbAeduIHyCFvjbv1VHHA
	7Nw2BT+Bs9hNyDSKT1SaFWiQKWd0fFLzLHvxPelYLsv3VVR4wsEj3WX76OTUR2de+tB16zYTPDIA0
	49VkcxMeJGw+h3ECfgTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukKcY-00000002au0-0QAO;
	Fri, 08 Aug 2025 10:46:46 +0000
Received: from smtp81.cstnet.cn ([159.226.251.81] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukKMi-00000002Z3v-1CTg;
	Fri, 08 Aug 2025 10:30:26 +0000
Received: from zq-Legion-Y7000.. (unknown [121.237.92.164])
	by APP-03 (Coremail) with SMTP id rQCowAA3zH2U0ZVoWhVQCg--.7250S2;
	Fri, 08 Aug 2025 18:29:41 +0800 (CST)
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
Subject: [PATCH v2 0/6] RISC-V: KVM: Allow zicbop/bfloat16 exts for guests
Date: Fri,  8 Aug 2025 18:18:10 +0800
Message-Id: <cover.1754646071.git.zhouquan@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CM-TRANSID: rQCowAA3zH2U0ZVoWhVQCg--.7250S2
X-Coremail-Antispam: 1UD129KBjvdXoW7XF1kZrWrtFW3Kw1xAr4rGrg_yoWDKFX_CF
	WrXrZ7J343Xayj9ayfAFs5JFykt390kr1xJF4jvr17WFnrurWUZw1xG3yYkr17uw45XFnI
	vrn5uFZ29w1a9jkaLaAFLSUrUUUUbb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbhAFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_
	Cr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
	0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
	jxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr
	1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E8cxa
	n2IY04v7M4kE6xkIj40Ew7xC0wCY1x0262kKe7AKxVWUtVW8ZwCY02Avz4vE14v_Gw1l42
	xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWU
	GwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI4
	8JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4U
	MIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I
	8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfUOrcfUUUUU
X-Originating-IP: [121.237.92.164]
X-CM-SenderInfo: 52kr31xxdqqxpvfd2hldfou0/1tbiBgwIBmiVokWI1gABsB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250808_033024_687995_2C4325A1 
X-CRM114-Status: UNSURE (   6.26  )
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

Advertise zicbop/bfloat16 extensions to KVM guest when underlying
host supports it, and add them to get-reg-list test.

---
Change since v1:
- update zicbom/zicboz/zicbop block size registers to depend on the host isa.
- update the reg list filtering in copy_config_reg_indices() to use the host isa.
- add reg list filtering for zicbop.
v1: https://lore.kernel.org/all/cover.1750164414.git.zhouquan@iscas.ac.cn/

Quan Zhou (6):
  RISC-V: KVM: Change zicbom/zicboz block size to depend on the host isa
  RISC-V: KVM: Provide UAPI for Zicbop block size
  RISC-V: KVM: Allow Zicbop extension for Guest/VM
  RISC-V: KVM: Allow bfloat16 extension for Guest/VM
  KVM: riscv: selftests: Add Zicbop extension to get-reg-list test
  KVM: riscv: selftests: Add bfloat16 extension to get-reg-list test

 arch/riscv/include/uapi/asm/kvm.h             |  5 +++
 arch/riscv/kvm/vcpu_onereg.c                  | 34 +++++++++++++++----
 .../selftests/kvm/riscv/get-reg-list.c        | 25 ++++++++++++++
 3 files changed, 58 insertions(+), 6 deletions(-)

-- 
2.34.1


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
